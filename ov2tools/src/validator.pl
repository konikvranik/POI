#!/usr/bin/env perl
use Geo::Ov2;

my $file = shift;
my $ov2 = Geo::Ov2->new( "<$file" );

my $counter = 0;
my @stack;
while ( my $poi = $ov2->poiread() ) {
	my %poi = %$poi;
	my $printed = 0;
	while ( $#stack >= 0 and $stack[$#stack] < $ov2->tell - 1 ) {
		pop @stack;
		printf "%s   %d POIs (%d)\n", "  " x ( $#stack + 1 ), $counter, $ov2->tell unless $printed;
		$printed = 1;
		$counter = 0;
	}
	if ( $poi{type} == 1 ) {
		printf "%s level %d (%f; %f; %f; %f) [%d-%d]\n", "  " x ( $#stack + 1 ), $#stack + 1, $poi{longitude} / 100000, $poi{latitude} / 100000, $poi{longitude2} / 100000, $poi{latitude2} / 100000, $ov2->tell - 21, $ov2->tell + $poi{size} - 21;
		push @stack, $ov2->tell + $poi{size} - 21;
	} else {
		$counter++;
	}
	#printf "%s type: %d (%d)\n", "  " x ( $#stack  ), $poi{type}, $ov2->tell;
	#printf "type: %d\n", $poi{type};
}
