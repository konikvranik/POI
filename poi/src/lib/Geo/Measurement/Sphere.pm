package Geo::Measurement::Sphere;

#use Geo::Point;
#use Geo::Distance;
#use Geo::Shape;

# This module aims to be approximate, but fast.

$PI = 3.14159265358979;
$_DEG_RAD = 0.0174532925199433;
$_RAD_DEG = 57.2957795130823;

sub new {
	my $proto = shift;
	my $radius = shift;
	my $class = ref($proto) || $proto;
	my $self = {};
	bless $self, $class;
	$self->diameter( 12756270 ); # Diameter on Equator
	$self->diameter( $radius ) if $radius;
	return $self;
}

sub diameter() {
	my $self = shift;
	my $dameter = shift;
	$self->{'_DIAMETER_'} = $diameter if $diameter;
	$self->_recalc();
	$self->{'_EQUATOR_'} = $PI * $self->{'_DIAMETER_'} ;
	$self->{'_LATMUL_'} = $self->equator / 360;
	return $self->{'_DIAMETER_'};
}

sub latitude() {
	my $self = shift;
	my $latitude = shift;
	if ( $latitude && ( 3 < abs ( $self->{'_LATITUDE_'} - $latitude ) ) ) {
		$self->{'_LATITUDE_'} = $latitude;
		$self->_recalc();
	}
	return $self->{'_LATITUDE_'};
}

sub _recalc() {
	my $self = shift;
	$self->{'_PERIMETER_'} = $PI * $self->{'_DIAMETER_'} * cos( $self->{_LATITUDE_} * $_DEG_RAD );
	$self->{'_LONGMUL_'} = $self->perimeter / 360;
}

sub equator() {
	my $self = shift;
	return $self->{'_EQUATOR_'};
}

sub perimeter() {
	my $self = shift;
	return $self->{'_PERIMETER_'};
}

sub length_to_long() {
	my $self = shift;
	my $dist = shift;
	$self->latitude( shift );
	$dist = 1 unless $dist;
	return $dist / $self->{'_LONGMUL_'};
}

sub long_to_length() {
	my $self = shift;
	my $long = shift;
	$self->latitude( shift );
	$long = 1 unless $long;
	return $self->{'_LONGMUL_'} * $long;
}

sub length_to_lat() {
	my $self = shift;
	my $dist = shift;
	$dist = 1 unless $dist;
	return $dist / $self->{'_LATMUL_'};
}

sub lat_to_length() {
	my $self = shift;
	my $lat = shift;
	$lat = 1 unless $lat;
	return $self->{'_LATMUL_'} * $lat;
}

sub radius() {
	my $self = shift;
	my $radius = shift;
	$self->{'_RADIUS_'} = $radius if $radius;
	return $self->{'_RADIUS_'};
}

sub is_in_radius() {
	my $self = shift;
	my $long1 = shift;
	my $lat1 = shift;
	my $long2 = shift;
	my $lat2 = shift;
	$self->radius( shift );

	#$point1 = Geo::Point->latlong( $lat1, $long1 );
	#$point2 = Geo::Point->latlong( $lat2, $long2 );

	if ( $self->lat_to_length( abs ( $lat1 - $lat2 ) ) < $self->radius ) {
		if ( $self->long_to_length( abs ( $long1 - $long2 ) ) < $self->radius ) {
			#$point1 = Geo::Point->latlong( $lat1, $long1 );
			#$point2 = Geo::Point->latlong( $lat2, $long2 );
			#return 1 if $point1->distance( $point2, "meter" ) < $self->radius;
			return 1;
		}
	}

	return 0;
}
