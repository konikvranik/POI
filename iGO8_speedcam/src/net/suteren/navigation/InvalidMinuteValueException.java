package net.suteren.navigation;

public class InvalidMinuteValueException extends GeoMeasureException {
	@Override
	public String getMessage() {
		return "Input of minutes exceeds alowed limits.";
	}

}
