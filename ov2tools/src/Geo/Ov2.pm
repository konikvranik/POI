#!/usr/bin/env perl

package Geo::Ov2;

$VERSION = "0.9_01";
$VERSION = eval $VERSION;

require IO::File;
use Carp;
our @ISA = qw(IO::File);

use POSIX;
use locale;
use Data::Dumper;
use Getopt::Long;
use Locale::TextDomain 'net.suteren.POI.todevice', '/usr/share/locale/',
  '/usr/local/share/locale/';
use Pod::Text::Termcap;
use Pod::Usage;
use Config::General;
use File::Basename;
use GPS::Poi;
use File::Copy;
use strict;
#use sort '_quicksort';

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

our @positions = [];
our %defaults = ( repart_size=> 10, repartition => 1, deareize => 0 );
our %params;

sub _params {
	my $self = shift;
	my $params = shift;
	$params{$self} = $params if defined $params;
	$params{$self} = {} unless exists $params{$self};
	return $params{$self};
}

sub poisysread {
	my $self     = shift;
	my $filemode = $self->{filemode};
	croak "Not implemented yet.";
}

sub deareize {
	my $self = shift;
	return $self->_param( "deareize", @_[0] );
}

sub repartition {
	my $self = shift;
	return $self->_param( "repartition", @_[0] );
}

sub repart_size {
	my $self = shift;
	return $self->_param( "repart_size", @_[0] );
}

sub _param {
	my $self = shift;
	my $key = shift;
	croak "undefined parameter." unless defined $key;
	my $new_value = shift;
	my %params = %{$self->_params};
	if ( defined $new_value ) {
		$params{$key} = $new_value;
		$self->_params( \%params );
	}
	unless ( defined $params{$key} ) {
		$params{$key} = $defaults{$key};
		$self->_params( \%params );
	}
	return $params{$key};
}

sub poiwrite {
	my $self = shift;
	my $poi  = shift;
	my %poi  = %$poi;
	my $data = $poi{data};
	unless ($data) {
		my $type      = $poi{type};
		my $longitude = $poi{longitude};
		my $latitude  = $poi{latitude};
		if ( $type == 0x01 ) {
			my $longitude2 = $poi{longitude2};
			my $latitude2  = $poi{latitude2};
			my $size     = $poi{size};
			$data = pack "CVVVVV", $type, $size, $longitude, $latitude,
			  $longitude2, $latitude2;
		} elsif ( $type == 0x02 ) {
			my $description = $poi{description};
			$data = pack "CVVV", $type, 13 + lenght $description, $latitude,
			  $longitude;
			$data = $data . $description;
		} elsif ( $type == 0x04 ) {
			$data = pack "C", $type;
			$data = $data . substr( pack( "V", $longitude ), 1 );
			$data = $data . substr( pack( "V", $latitude ),  1 );
		} elsif ( $type == 0x05 or $type == 0x15 ) {
			my $description = $poi{description};
			$data = pack "C", $type;
			$data = $data . substr( pack( "V", $longitude ), 1 );
			$data = $data . substr( pack( "V", $latitude ),  1 );
			$data = $data . substr( $description, 0, 2 );    # TODO
		} elsif ( $type == 0x06 ) {
			my $description = $poi{description};
			$data = pack "C", $type;
			$data = $data . substr( pack( "V", $longitude ), 1 );
			$data = $data . substr( pack( "V", $latitude ),  1 );
			$data = $data . substr( $description, 0, 3 );    # TODO
		} elsif ( $type == 0x07
			or $type == 0x08
			or $type == 0x18
			or $type == 0x09
			or $type == 0x19
			or $type == 0x0a
			or $type == 0x1a
			or $type == 0x0c )
		{
			my $description = $poi{description};
			$data = pack "CC", $type, length $description;
			$data = $data . substr( pack( "V", $longitude ), 1 );
			$data = $data . substr( pack( "V", $latitude ),  1 );
			$data = $data . $description;
		} else {
			croak "Unknown type of POI.";
		}
	}
	print {$self} $data;

}

sub poisyswrite {
	my $self     = shift;
	my $filemode = $self->{filemode};
	croak "Not implemented yet.";
}

sub poiread {
	my $self = shift;
	return undef unless ( 1 == read( $self, my $buff, 1));
	my $data = $buff;
	my $type = unpack "C", $buff;
	my %poi;
	if ( $type == 0x01 ) {
		read( $self, $buff, 20 ) == 20
		  or croak "Unexpected end of ov2 file.";
		#next if $repartition;
		$data = $data . $buff;
		my ( $size, $longitude, $latitude, $longitude2, $latitude2 ) =
		  unpack "VVVVV", $buff;
		%poi = (
			type       => $type,
			size       => $size,
			longitude  => $longitude,
			latitude   => $latitude,
			longitude2 => $longitude2,
			latitude2   => $latitude2,
			data => $data
		);
	} elsif ( $type == 0x02 ) {
		read( $self, $buff, 4 ) == 4
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $size = unpack "V", $buff;
		read( $self, $buff, 8 ) == 8
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read( $self, $buff, $size - 13 ) == $size - 13
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		%poi  = (
			type        => $type,
			size        => $size,
			longitude   => $longitude,
			latitude    => $latitude,
			data        => $data,
			description => $buff
		);
	} elsif ( $type == 0x04 ) {
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $tmp = "00" . $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		$tmp  = $tmp . "00" . $buff;
		my ( $longitude, $latitude ) = unpack "VV", $tmp;
		%poi = (
			type      => $type,
			longitude => $longitude,
			latitude  => $latitude,
			data      => $data
		);
	} elsif ( $type == 0x05 or $type == 0x15 ) {
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $tmp = "00" . $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		$tmp  = $tmp . "00" . $buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read( $self, $buff, 2 ) == 2
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		%poi  = (
			type        => $type,
			longitude   => $longitude,
			latitude    => $latitude,
			data        => $data,
			description => $buff
		);
	} elsif ( $type == 0x06 ) {
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $tmp = "00" . $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		$tmp  = $tmp . "00" . $buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		%poi  = (
			type        => $type,
			longitude   => $longitude,
			latitude    => $latitude,
			description => $buff,
			data        => $data
		);
	} elsif ( $type == 0x07
		or $type == 0x08
		or $type == 0x18
		or $type == 0x09
		or $type == 0x19
		or $type == 0x0a
		or $type == 0x1a
		or $type == 0x0c )
	{
		read( $self, $buff, 1 ) == 1
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $size = unpack "C", $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		my $tmp = "00" . $buff;
		read( $self, $buff, 3 ) == 3
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		$tmp  = $tmp . "00" . $buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read( $self, $buff, $size ) == $size
		  or croak "Unexpected end of ov2 file.";
		$data = $data . $buff;
		%poi  = (
			type        => $type,
			size        => $size,
			longitude   => $longitude,
			latitude    => $latitude,
			description => $buff,
			data        => $data
		);
	} else {
		croak "Unknown type of POI.";
	}
	return \%poi;
}

sub poiwriteall {
	my $self     = shift;
	my @pois     = @_;
	#printf STDERR "%d %d\n", $self->repartition, $self->deareize;
	@pois = @{$self->deareizator( @pois )} if ( $self->repartition or $self->deareize );
	@pois = @{$self->split_area( 0, @pois )} if $self->repartition;
	foreach my $poi (@pois) {
		$self->poiwrite($poi);
	}
}

sub poireadall {
	my $self = shift;
	my @pois;
	while ( my $poi = $self->poiread() ) {
		my %poi = %$poi;
		push @pois, \%poi;
	}
	return \@pois;
}

sub poitruncate {

	# TODO
	my $self   = shift;
	my $amount = shift;
	croak "Not implemented yet.";
}

sub poiseek {

	# TODO
	my $self   = shift;
	my $amount = shift;
	croak "Not implemented yet.";
}

sub area_envelope {
	my $self = shift;
	my @pois = @_;
	my ( $longitude2, $longitude, $latitude2, $latitude ) = ( undef, undef, undef, undef );
	my $size = 21;
	foreach my $i (@pois) {
		my %poi = %$i;
		$longitude2 = $poi{longitude} unless defined $longitude2;
		$longitude = $poi{longitude} unless defined $longitude;
		$latitude2 = $poi{latitude} unless defined $latitude2;
		$latitude = $poi{latitude} unless defined $latitude;
		$longitude2 = $poi{longitude} if $poi{longitude} < $longitude2;
		$latitude2  = $poi{latitude} if $poi{latitude} < $latitude2;
		$longitude = $poi{longitude} if $poi{longitude} > $longitude;
		$latitude  = $poi{latitude} if $poi{latitude} > $latitude;
		my $type = $poi{type};
		if ( $type == 0x01 ) {
			$size += 21;
		} elsif ( $type == 0x02 ) {
			$poi{size} = 13 + length $poi{description} unless $poi{size};
			$size += $poi{size};
		} elsif ( $type == 0x04 ) {
			$size += 7;
		} elsif ( $type == 0x05 or $type == 0x15 ) {
			$size += 9;
		} elsif ( $type == 0x06 ) {
			$size += 10;
		} elsif ( $type == 0x07
			or $type == 0x08
			or $type == 0x18
			or $type == 0x09
			or $type == 0x19
			or $type == 0x0a
			or $type == 0x1a
			or $type == 0x0c )
		{
			$poi{size} = length $poi{description} unless $poi{size};
			$size += $poi{size} + 8;
		} else {
			croak "Unknown type of POI.";
		}
	}
	my $data = pack( "CVVVVV", 1, $size, $longitude, $latitude, $longitude2, $latitude2 );
	my %poi = ( type => 1, size => $size, longitude => $longitude, latitude => $latitude, longitude2 => $longitude2, latitude2 => $latitude2, data => $data );
	#printf "debug: %d %d %d %d\n", $longitude, $latitude, $longitude2, $latitude2;
	return \%poi;
}

sub deareizator {
	my $self = shift;
	my @pois = @_;
	my @poiout;
	foreach my $i ( @pois ) {
		if ( ${$i}{type} != 1 ) {
			push @poiout, \%{$i} 
		}
	}
	return \@poiout;
}

sub split_area {
	my $self = shift;
	my $orientation = shift;
	my @pois = @_;
	$orientation++;
	#@pois = @{_sortpois( $orientation, @pois)};
	my $dimension = "longitude";
	$dimension = "latitude" if $orientation % 2;
	@pois = sort { ${$a}{$dimension} <=> ${$b}{$dimension} } @pois;
=cut
	foreach my $i ( @pois ) {
		printf STDERR "sort: %s: %d\n", $dimension, ${$i}{$dimension};
	}
	printf STDERR "========================\n";
=cut
	my $blocksize = ( ( $#pois + 1 ) / ( $self->repart_size - 1 ) ) + 1;
	if ( $#pois > $self->repart_size and $orientation < 10 ) {
		my @poiout;
		my $i = 0;
		while ( ( $i + $blocksize - 1 ) <= $#pois ) {
			my $tmp = $i;
			$i += $blocksize;
			my @tmp = @pois[$tmp ..  $i - 1 ];
			my $pois = $self->split_area($orientation, @tmp );
			push @poiout, @$pois;
		}
		if ( $i < $#pois + 1) {
			my @tmp = @pois[$i .. $#pois];
			my $pois = $self->split_area($orientation, @tmp );
			push @poiout, @$pois;
		}
		@pois = @poiout;
	}
	my %poi = %{$self->area_envelope( @pois )};
	unshift @pois, \%poi; 
	return \@pois;
}

1;
