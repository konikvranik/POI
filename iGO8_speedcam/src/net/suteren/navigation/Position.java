package net.suteren.navigation;

public class Position {

	private Longitude longitude;
	private Latitude latitude;

	public Position(double latitude, double longitude ) throws InvalidDegreeValueException {
		this.longitude = new Longitude(longitude);
		this.latitude = new Latitude(latitude);
	}
	
	public Position(int latitudeDegree, float latitudeMinute, int longitudeDegree, float longitudeMinute) throws InvalidDegreeValueException, InvalidMinuteValueException {
		this.longitude = new Longitude(longitudeDegree, longitudeMinute);
		this.latitude = new Latitude(latitudeDegree, latitudeMinute);
	}

	public Position(int latitudeDegree, int latitudeMinute, float latitudeSecond, int longitudeDegree, int longitudeMinute, float longitudeSecond) throws InvalidDegreeValueException, InvalidMinuteValueException, InvalidSecondValueException {
		this.longitude = new Longitude(longitudeDegree, longitudeMinute, longitudeSecond);
		this.latitude = new Latitude(latitudeDegree, latitudeMinute, longitudeSecond);
	}
	
	public Longitude getLongitude() {
		return longitude;
	}

	public double getLongitudeValue() {
		return longitude.getValue();
	}

	public void setLongitude(long longitude) throws InvalidDegreeValueException {
		this.longitude = new Longitude(longitude);
	}

	public void setLongitude(Longitude longitude) throws InvalidDegreeValueException {
		this.longitude = longitude;
	}

	public Latitude getLatitude() {
		return latitude;
	}
	
	public double getLatitudeValue() {
		return latitude.getValue();
	}

	public void setLatitude(long latitude) throws InvalidDegreeValueException {
		this.latitude = new Latitude(latitude);
	}

	public void setLatitude(Latitude latitude) throws InvalidDegreeValueException {
		this.latitude = latitude;
	}

}
