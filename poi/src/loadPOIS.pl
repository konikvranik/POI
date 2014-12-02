#!/usr/bin/env perl

use encoding 'iso-8859-2';
use POSIX;
use locale;
use Data::Dumper;
use Getopt::Long;
use Locale::TextDomain 'net.suteren.POI.tidy_csv_POIs', '/usr/share/locale/',
  '/usr/local/share/locale/';
use Pod::Text::Termcap;
use Pod::Usage;
use Config::General;
use File::Basename;

#push @INC, "./lib", "../lib", dirname($0) . "./lib", dirname( $0 ) . "../lib";
use Geo::Gpx;
use GPS::Poi;
use DBI;

use DBI qw(:sql_types);
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

$dbname      = "POI";
$dbuser      = "postgres";
$password = undef;
@configfiles = (
	"loadPOIS.conf", "loadPOIS.cfg",
	"loadPOISrc", "loadPOIS_rc", "loadPOIS"
);
@configdirs = ( "./", "./etc/", "/etc/", "/etc/POI/", "/etc/POIs/", "/etc/local/", "/etc/local/POI/", "../etc/" );

=head1 NAME

{progname} - Displays time to mountpoint capacity exceed.

=head1 SYNOPSIS

{progname} [--hour|-ho] [--minute|-m] [--day|-d] [--human-readable|-hu] [--kilo|-k] [--mega|-m] [--alert=N|-a N] mountpoint [mountpoint [mountpoint]]...

{progname} --help|-h


=head1 DESCRIPTION

{progname} displays aproximate time to fullfill specified mountpoints. For approximation is used simple linear iterpolation by X<Partial Least Squares>.

=head1 OPTIONS

=over

=item --help|-he

Display this help message.

=item --hour|-ho

All time units on input and output are considered as hours.

=item --minute|-mi

All time units on input and output are considered as minutes.

=item --day|-d

All time units on input and output are considered as days.

=item --human-readable|-hu

Output is provided in human readable format.

In other cases is outpus displayed in columns without units and explanation for better processing by other piped commands.

=item --kilo|-k

All capacity units on input and output are considered as kiB.

=item --mega|-me

All capacity units on input and output are considered as MiB.

=item --alert=N|-a N

If capacity will be exceeded in time shorter than N in selected timeunits, command will exit with exit status 1 and with corresponding line will be displayed warning.

=back

I<Default time units are seconds.>

I<Default capacity units are bytes.>

config: {configfile}

=head1 SEE ALSO

L<Pod::Usage>, L<pod2usage(1)>

=head1 BUGS

=over
=item
Translation of help message is dependent on pod2usage implementation. If help message is not displayed in expected language, you can check net.suteren.dfincrease.monitor.po for corresponding message
=back

=cut

$help       = undef;
$configfile = undef;
$ov2        = GPS::Poi->new();

unless ( GetOptions( "help" => \$help, "configfile" => \$configfile ) ) {
	&printhelp();
	die __ "Bad options.";
}

unless ( -r $configfile ) {
  outer:
	foreach $i (@configdirs) {
		foreach $j (@configfiles) {
			if ( -f "$i$j" && -r "$i$j" ) {
				$configfile = "$i$j";
				last outer;
			}
		}
	}
}

if ($help) {
	&printhelp();
	exit 0;
}

$conf =
  new Config::General( -ConfigFile => $configfile, -InterPolateVars => 1 );
%conf = $conf->getall;

$extensions        = $conf{_DEFAULT_}{dst_extension};
@dst_extensions    = @$extensions;
$dst_extension     = $dst_extensions[0];
$extensions        = $conf{_DEFAULT_}{src_extension};
@src_extensions    = @$extensions;
$src_extension     = $src_extensions[0];
$srcDir            = $conf{_DEFAULT_}{srcDir};
$destDir           = $conf{_DEFAULT_}{destDir};
$replacefrom       = $conf{_DEFAULT_}{replaceFrom};
$replaceto         = $conf{_DEFAULT_}{replaceTo};
$stripprefix       = $conf{_DEFAULT_}{stripPrefix};
$softLength        = $conf{_DEFAULT_}{softLength};
$hardLength        = $conf{_DEFAULT_}{hardLength};
$primaryDividers   = $conf{_DEFAULT_}{primaryDividers};
$secondaryDividers = $conf{_DEFAULT_}{secondaryDividers};
$inputEncoding     = $conf{_DEFAULT_}{inputEncoding};
$outputEncoding    = $conf{_DEFAULT_}{outputEncoding};

$srcDir  = "$srcDir/"  if substr( $srcDir,  length($srcDir) - 1 )  ne "/";
$destDir = "$destDir/" if substr( $destDir, length($destDir) - 1 ) ne "/";

opendir SRCDIR, $srcDir;
file:
while ( $file = readdir SRCDIR ) {
  ext:
	foreach $j (@src_extensions) {
		last ext if $j eq substr $file, -length $j;
	} continue {
		next file;
	}
	push @inputfiles, $srcDir . basename($file);
}
closedir SRCDIR;
push @inputfiles, @ARGV;

my %importers = ( gpx => \&load_gpx, csv => \&load_csv, ov2 => \&load_ov2 );

my $timer1 = time;
&load_pois();
printf "TOTAL TIME ELAPSED: %ds.\n", time - $timer1;

sub printhelp {
	pipe Reader, Writer;
	pod2usage( -exitval => NOEXIT, -output => \*Writer );
	close Writer;
	$message = "";
	while (<Reader>) {
		$message .= __ $_;
	}
	close Reader;
	print __x( $message, progname => basename($0), configfile => $configfile );
}

sub progress() {
	my @progchars = ( "\\", "|", "/", "-" );
	printf "\b%s", $progchars[ $progress++ % 4 ] if $ENV{TERM};
}

sub strip() {
	$_ = shift;
	s/^\s*//;
	s/\s*$//;
	return $_;
}

sub divide() {
	$_        = shift;
	$original = $_;
	$delims   = $primaryDividers;
	( $first, $second ) = split /$delims/, $original, 2;
	if ( $first eq $original || ( length($first) > $softLength ) ) {
		$delims = $secondaryDividers;
		( $first, $second ) = split /$delims/, $original, 2;
	}
	if ( length($first) > $hardLength ) {
		$first = substr $original, 0, $softLength;
		$second = $original;
	}
	$first  = &strip($first);
	$second = &strip($second);
	return ( $first, $second );
}

sub insert_poi() {
	my $pgsth         = shift;
	my $lon           = shift;
	my $lat           = shift;
	my $name          = shift;
	my $description   = shift;
	my $comment       = shift;
	my $link          = shift;
	my $phone         = shift;
	my $timestamp     = shift;
	my $time          = shift;
	my $fix           = shift;
	my $satellites    = shift;
	my $hdop          = shift;
	my $vdop          = shift;
	my $pdop          = shift;
	my $ageofdgpsdata = shift;
	my $dgpsid        = shift;
	my $categoryid    = shift;
	my $sourceid      = shift;
	my $type          = shift;
	my $symbol        = shift;
	my $country       = shift;
	my $region        = shift;

#printf "'%f %f', '%s', '%s', '%s', '%s', '%s', '%s', %f, %d, %f, %f, %f, %f, %d, %d, %d, %d, %d, %d, %d\n", $lon, $lat, $name, $description, $comment, $link, $timestamp, $time, $fix, $satellites, $hdop, $vdop, $pdop, $ageofdgpsdata, $dgpsid, $categoryid, $sourceid, $type, $symbol, $country, $region;
	$pgsth->execute(
		"$lon $lat", $name,          $description, $comment,
		$link,       $phone,         $timestamp,   $time,
		$fix,        $satellites,    $hdop,        $vdop,
		$pdop,       $ageofdgpsdata, $dgpsid,      $categoryid,
		$sourceid,   $type,          $symbol,      $country,
		$region
	  )
	  or printf STDERR "%s\n", $DBI::errstr;
}

sub load_gpx() {
	&progress;
	return ( 1, 2 );
}

sub load_csv() {
	my $pgsth      = shift;
	my $if         = shift;
	my $categoryid = shift;
	my $type       = shift;
	my $sourceid   = shift;
	my $region     = shift;
	my $country    = shift;
	my ( $comment , $timestamp , $fix , $satellites,$link, $hdop, $pdop, $vdop, $ageofdgpsdata, $dgpsid, $symbol ) = undef;

	#my ( $fname, $dir, $ext ) = fileparse( $if, ".csv" );
	#$csvdbh = DBI->connect("DBI:CSV:csv_sep_char=,;f_dir=$dir")
	$csvdbh = DBI->connect('dbi:AnyData(RaiseError=>1):')
	  or die "Cannot connect: " . $DBI::errstr;
	$csvdbh->func(
		'POIs', 'CSV', $if,
		{
			col_names => 'latitude,longitude,elevation,name, description,time,unknown1,unknown2'
		},
		'ad_catalog'
	);

	$csvsth = $csvdbh->prepare("SELECT *  FROM POIs");
	$csvsth->execute();
	my ( $lat, $lon, $ele, $name, $desccription, $time, $phone );
	$csvsth->bind_columns( \$name, \$description, \$lat, \$lon, \$ele, \$time,
		undef, undef );
	my @pois;
	my $counter = 0;
	while ( $csvsth->fetch ) {
		$counter++;
		$description = undef if $description eq $name;
		$name        = Encode::decode( 'cp1250', $name );
		$description = Encode::decode( 'cp1250', $description );

		#chomp ( $name, $desc );
		#$name =~ s/\n//g;
		#$desc =~ s/\n//g;
		#$name =~ s/\r//g;
		#$desc =~ s/\r//g;
		#$name =~ s/"/\\"/g;
		#$desc =~ s/"/\\"/g;
		if ( $name =~ /^(.*)>(\d*)$/ ) {
			$name  = $1;
			$phone = $2;
		}
		( $name, $description ) = &divide($name) unless $description;
		$description = $name unless $description;
		my %poi = (
			name => $name,
			desc => $description,
			lat  => $lat,
			lon  => $lon,
			ele  => $ele,
			time => $time,
		);
		&insert_poi(
			$pgsth,       $lon,        $lat,      $name,
			$description, $comment,    $link,     $phone,
			$timestamp,   $time,       $fix,      $satellites,
			$hdop,        $vdop,       $pdop,     $ageofdgpsdata,
			$dgpsid,      $categoryid, $sourceid, $type,
			$symbol,      $country,    $region
		);
		push @pois, \%poi;
		&progress;
	}
	$csvsth->finish();
	#return @pois;
	return $counter;
}

sub load_ov2() {
	my $pgsth         = shift;
	my $if            = shift;
	my $categoryid    = shift;
	my $typeid        = shift;
	my $sourceid      = shift;
	my $region        = shift;
	my $country       = shift;
	my $description   = undef;
	my $comment       = undef;
	my $link          = undef;
	my $timestamp     = undef;
	my $time          = undef;
	my $fix           = undef;
	my $satellites    = undef;
	my $hdop          = undef;
	my $vdop          = undef;
	my $pdop          = undef;
	my $ageofdgpsdata = undef;
	my $dgpsid        = undef;
	my $symbol        = undef;
	my $phone         = undef;

	my ( $name, $dir, $ext ) = fileparse( $if, ".ov2" );
	my $nb = $poi->parse( { file => $if } );
	my @list = $poi->all_as_list();
	my $counter = 0;
	foreach $i (@list) {
		$counter++;
		my ( $name, $lon, $lat, undef ) = @$i;
		if ( $name =~ /^(.*)>(\d*)$/ ) {
			$name  = $1;
			$phone = $2;
		}
		( $name, $description ) = &divide($name) unless $description;
		$description = $name unless $description;
		&insert_poi(
			$pgsth,       $lon,        $lat,      $name,
			$description, $comment,    $link,     $phone,
			$timestamp,   $time,       $fix,      $satellites,
			$hdop,        $vdop,       $pdop,     $ageofdgpsdata,
			$dgpsid,      $categoryid, $sourceid, $typeid,
			$symbol,      $country,    $region
		);
		&progress;
	}
	return $counter;
}

sub load_pois() {

	print STDERR "Loading...\n";

	my $connectstring = "DBI:Pg:dbname=$dbname";
	$connectstring = "$connectstring;host=$host" if $host;

	my $pgdbh =
	  DBI->connect( $connectstring, $dbuser, $password, { AutoCommit => 1 } )
	  or die "Cannot connect: " . $DBI::errstr;

	my $pgsth =
	  $pgdbh->prepare(
"SELECT public.put_poi(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
	  );
	$pgsth->bind_param( 1,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 2,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 3,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 4,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 5,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 6,  undef, SQL_VARCHAR );
	$pgsth->bind_param( 7,  undef, SQL_TYPE_TIMESTAMP_WITH_TIMEZONE );
	$pgsth->bind_param( 8,  undef, SQL_TYPE_TIMESTAMP_WITH_TIMEZONE );
	$pgsth->bind_param( 9,  undef, SQL_NUMERIC );
	$pgsth->bind_param( 10, undef, SQL_INTEGER );
	$pgsth->bind_param( 11, undef, SQL_NUMERIC );
	$pgsth->bind_param( 12, undef, SQL_NUMERIC );
	$pgsth->bind_param( 13, undef, SQL_NUMERIC );
	$pgsth->bind_param( 14, undef, SQL_NUMERIC );
	$pgsth->bind_param( 15, undef, SQL_INTEGER );
	$pgsth->bind_param( 16, undef, SQL_INTEGER );
	$pgsth->bind_param( 17, undef, SQL_INTEGER );
	$pgsth->bind_param( 18, undef, SQL_INTEGER );
	$pgsth->bind_param( 19, undef, SQL_INTEGER );
	$pgsth->bind_param( 20, undef, SQL_INTEGER );
	$pgsth->bind_param( 21, undef, SQL_INTEGER );

	my $pgsth1 =
	  $pgdbh->prepare("SELECT public.get_category_id_by_code(?, ?);");
	$pgsth1->bind_param( 1, undef, SQL_VARCHAR );
	$pgsth1->bind_param( 2, undef, SQL_VARCHAR );

	my $pgsth2 = $pgdbh->prepare("SELECT public.get_country_id_by_code(?);");
	$pgsth2->bind_param( 1, undef, SQL_VARCHAR );

	my $pgsth3 = $pgdbh->prepare("SELECT public.get_source_id_by_code(?);");
	$pgsth3->bind_param( 1, undef, SQL_VARCHAR );

	foreach $file (@inputfiles) {
		my $timer = time;
		next unless $file;
		my ( $category, $path, $type ) = fileparse( $file, @src_extensions );
		next unless $type;
		chop $category if "." eq substr( $category, length($category) - 1 );
		$type = substr $type, 1 if "." eq substr $type, 0, 1;
		my $inputEncoding = $inputEncoding;
		if ( $category =~ m/^(([A-Z ][A-Z ])-)(.*)$/ ) {
			$countrycode = $2;
			$category    = $3;
		}
		$categorycode = substr $category, 0, 32;
		$categorycode =~ tr/ /_/;
		$category     =~ tr/_/ /;

		$pgsth1->execute( $categorycode, $category );
		my @ary        = $pgsth1->fetchrow_array;
		my $categroyid = $ary[0];

		$pgsth2->execute($countrycode);
		@ary = $pgsth2->fetchrow_array;
		my $countryid = $ary[0];

		$pgsth3->execute('poi.cz');
		@ary = $pgsth3->fetchrow_array;
		my $sourceid = $ary[0];

		printf "category %s from %s: |", $categorycode, $type;
		my $loadroutine = $importers{$type};
		#my @pois        = &$loadroutine(
		my $poicount        = &$loadroutine(
			$pgsth,    $file,   $categroyid, $typeid,
			$sourceid, $region, $countryid
		);
		printf "\b%d POIs in %.2fs.\n", $poicount, time - $timer;
	}
}
