#!/usr/bin/env perl

=pod
=head1 Funkcni specifikace

V konfiguraku budou sekce kategorii, ve kterych budou mimo jine vydefinovany i kriteria pro where selectu.
Bude to zhruba v rero forme:

<category XYZ>
	filename=XYZ
	id=999
	<filter>
	<and>
		category_code=XYZ
		type_id=1
		<or>
			category_id=3
			type_id=8
		</or>
	</and>
	</filter>
</category>

select bude min. pres POI, WPT, Category.
Dal je nutno zvazit, jestli kdyz se pridaji dalsi tabulky, tak se vyrazne nesnizi vykon.
Pokud ne, bylo by dobre pridat i type a source, country a region.

Vystup pro ov2 by mel byt dale zarazen podle regionu. 

=cut

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

$destDir = "$destDir/" if substr( $destDir, length($destDir) - 1 ) ne "/";

my %exporters = ( gpx => \&save_gpx, csv => \&save_csv, ov2 => \&save_ov2 );

my $timer1 = time;
&save_pois();
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

sub save_gpx() {
	&progress;
	return ( 1, 2 );
}

sub save_csv() {
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

sub save_ov2() {
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

sub save_pois() {

	print STDERR "Saving...\n";

	my $connectstring = "DBI:Pg:dbname=$dbname";
	$connectstring = "$connectstring;host=$host" if $host;

	my $pgdbh =
	  DBI->connect( $connectstring, $dbuser, $password, { AutoCommit => 1 } )
	  or die "Cannot connect: " . $DBI::errstr;

	my $pgsth =
	$pgdbh->prepare(
"SELECT * FROM POI inner join on poi.category_id = category.id left outer join on poi.id = wpt-poi_id order by poi.Category_id;");
	my $result = $pgsth->execute();
	
	while ( my $line_hash = $pgsth->fetchrow_hashref ) {

		my $loadroutine = $exporters{$type};
		#my @pois        = &$loadroutine(
		my $poicount        = &$loadroutine(
			$pgsth,    $file,   $categroyid, $typeid,
			$sourceid, $region, $countryid
		);
		printf "\b%d POIs in %.2fs.\n", $poicount, time - $timer;
	}
}
