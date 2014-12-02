package net.suteren.navigation;

public class InvalidSecondValueException extends GeoMeasureException {
	@Override
	public String getMessage() {
		return "Input of seconds exceeds alowed limits.";
	}

}
