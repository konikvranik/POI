#!/usr/bin/env perl

use DBI;
use File::Basename;
use Data::Dumper;

#my ($script, $rundir, $ext ) = parsefile($0);
my $dir = shift;
$dbh = DBI->connect("DBI:CSV:f_dir=$dir")
        or die "Cannot connect: " . $DBI::errstr;

# Read a CSV file with ";" as the separator, as exported by
# MS Excel. Note we need to escape the ";", otherwise it
# would be treated as an attribute separator.
#$dbh = DBI->connect("DBI:CSV:csv_sep_char=,");

my $k=0;
my $l = 1;

foreach $i ( $dbh->func('list_tables') ) {
	$dbh->{csv_tables}->{$i} = { 'col_names' => [ "name", "description", "longitude", "latitude", "elevation" ]};
	$k++;
	$sth = $dbh->prepare("SELECT *  FROM $i");
	$sth->execute();
	my ( $lat, $lon, $ele, $name, $desc );
	$sth->bind_columns( \$name, \$desc, \$lat, \$lon, \$ele );
	printf "insert into Kategorie ( id, name ) values ( %d, '%s' );\n", $k, $i ;
	while ($sth->fetch) {
		chomp ( $name, $desc );
		$name =~ s/\n//g;
		$desc =~ s/\n//g;
		$name =~ s/\r//g;
		$desc =~ s/\r//g;
		$name =~ s/"/\\"/g;
		$desc =~ s/"/\\"/g;
		$desc = "XXXXX" unless $desc;
		$name = "XXXXX" unless $name;
		printf "insert into POI ( id, latitude, longitude, name, description, elevation, category ) values ( %d, %f, %f, '%s', '%s', %f, %d );\n", $l++, $lat, $lon, $name, $desc, $ele, $k ;
	}
	$sth->finish();

}
