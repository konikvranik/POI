#!/usr/bin/env perl

package Geo::Ov2;

require IO::Handle;
use Carp;
our @ISA = qw(IO::Handle);

use POSIX;
use locale;
use Data::Dumper;
use Getopt::Long;
use Locale::TextDomain 'net.suteren.POI.todevice', '/usr/share/locale/', '/usr/local/share/locale/';
use Pod::Text::Termcap;
use Pod::Usage;
use Config::General;
use File::Basename;
use GPS::Poi;
use File::Copy;

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

sub print {
	my $self = shift;
	my $filemode = $self->{filemode};
	return undef if $filemode =~ /[r+]/; 
	my $filedescriptor = $self->{filedescriptor};
	my $type = unpack "C", $buff;
}

sub sysread {
	my $self = shift;
	my $filemode = $self->{filemode};
	return undef if $filemode =~ /[r+]/; 
	my $filedescriptor = $self->{filedescriptor};
	my $type = unpack "C", $buff;
}

sub syswrite {
	my $self = shift;
	my $filemode = $self->{filemode};
	return undef if $filemode =~ /[r+]/; 
	my $filedescriptor = $self->{filedescriptor};
	my $type = unpack "C", $buff;
}

sub read {
	my $self = shift;
	my $filemode = $self->{filemode};
	return undef if $filemode =~ /[r+]/; 
	my $filedescriptor = $self->{filedescriptor};
	read FROMCAT, my $buff, 1;
	my $type = unpack "C", $buff;
	if ( $type == 0x01 ) {
		seek $self, 20, 1;
		next;
	} elsif ( $type == 0x02 ) {
		read ( $self, $buff, 4 ) == 4
			or croak "Unexpected end of file $srcDir/$file";
		my $size = unpack "V", $buff;
		read ( $self, $buff, 8 ) == 8
			or croak "Unexpected end of file $srcDir/$file" ;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read ( $self, $buff, $size - 13 ) == $size - 13
			or croak STDERR "Unexpected end of file $srcDir/$file";
		%poi = ( type => $type, longitude => $longitude, latitude => $latitude, description => $buff );
	} elsif ( $type == 0x04 ) {
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		my $data = "00".$buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		$data = $data."00".$buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		%poi = ( type => $type, longitude => $longitude, latitude => $latitude );
	} elsif ( $type == 0x05 or $type == 0x15 ) {
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		my $data = "00".$buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		$data = $data."00".$buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read ( $self, $buff, 2 ) == 2
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		%poi = ( type => $type, longitude => $longitude, latitude => $latitude, description => $buff );
	} elsif ( $type == 0x06 ) {
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		my $data = "00".$buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		$data = $data."00".$buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		%poi = ( type => $type, longitude => $longitude, latitude => $latitude, description => $buff );
	} elsif ( $type == 0x07 or $type == 0x08 or $type == 0x18 or $type == 0x09 or $type == 0x19 or $type == 0x0a or $type == 0x1a or $type == 0x0c ) {
		read ( $self, $buff, 1 ) == 1
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		my $size = unpack "C", $buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		my $data = "00".$buff;
		read ( $self, $buff, 3 ) == 3
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		$data = $data."00".$buff;
		my ( $longitude, $latitude ) = unpack "VV", $buff;
		read ( $self, $buff, $size ) == $size
			or ( printf STDERR "Unexpected end of file $srcDir/$file", last ) ;
		%poi = ( type => $type, longitude => $longitude, latitude => $latitude, description => $buff );
	}
	push @records, \%poi;
}

sub getc {
	my $self = shift;
	croak "This method is not suported on ov2.";
}

sub truncate {
	# TODO 
	my $self = shift;
	croak "This method is not suported on ov2.";	
}

sub area_envelope {
	my $self = shift;
	my @pois = @_;
	my ( $maxlong, $minlong, $maxlat, $minlat );
	foreach $i ( @pois ) {
		my %poi = %$i;
		$maxlong = $minlong = $poi{longitude} if undef($maxlong) or undef($minlong);
		$maxlat= $minlat = $poi{latitude} if undef($maxlat) or undef($minlat);
		
	}
}

sub split_area {
	my $self = shift;
	
}

1;