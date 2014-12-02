#!/usr/bin/env perl
use Data::Dumper;
use Geo::Ov2;

my $inst1 = Geo::Ov2->new();
my $inst2 = Geo::Ov2->new();

printf "1 - 1: %d; 2: %d\n", $inst1->repart_size, $inst2->repart_size;
printf "2 - 1: %d; 2: %d\n", $inst1->repart_size(15), $inst2->repart_size(20);
printf "3 - 1: %d; 2: %d\n", $inst1->repart_size, $inst2->repart_size;
