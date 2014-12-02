#!/usr/bin/env perl

use POSIX;
use Data::Dumper;
use File::Basename;


$filename = shift;
open POIDAT, "<$filename";

my $buff;
read POIDAT, $buff, 4;
$buff = unpack("V",$buff);
printf "%s\n", $buff;
$b = $buff;
$header = ( "V" x $buff );
read POIDAT, $buff, $buff * 4;
@array = unpack $header, $buff;
printf "@array\n";

read POIDAT, $buff, ( $b + 1 ) * 4;
@array = unpack $header . "V", $buff;
printf "@array\n";
