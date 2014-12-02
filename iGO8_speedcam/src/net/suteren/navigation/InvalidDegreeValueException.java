package net.suteren.navigation;

public class InvalidDegreeValueException extends GeoMeasureException {

	@Override
	public String getMessage() {
		return "Input of degrees exceeds alowed limits.";
	}
}
