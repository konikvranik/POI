package net.suteren.navigation;

public class Longitude extends GeoMeasure {

	public Longitude(double degrees) throws InvalidDegreeValueException {
		super(degrees);
	}

	public Longitude(int degrees, float minutes)
			throws InvalidDegreeValueException, InvalidMinuteValueException {
		super(degrees, minutes);
	}

	public Longitude(int degrees, int minutes, float seconds)
			throws InvalidDegreeValueException, InvalidMinuteValueException,
			InvalidSecondValueException {
		super(degrees, minutes, seconds);
	}

	@Override
	protected boolean validateDegrees(double degrees)
			throws InvalidDegreeValueException {
		boolean result = degrees <= 180;
		result = result && degrees >= -180;
		if (!result)
			throw new InvalidDegreeValueException();
		return result;
	}

	@Override
	protected boolean validateMinutes(float minutes)
			throws InvalidMinuteValueException {
		boolean result = minutes <= 60;
		result = result && minutes>= 0;
		if (!result)
			throw new InvalidMinuteValueException();
		return result;
	}

	@Override
	protected boolean validateSeconds(float seconds)
			throws InvalidSecondValueException {
		boolean result = seconds <= 60;
		result = result && seconds >= 0;
		if (!result)
			throw new InvalidSecondValueException();
		return result;
	}

}
