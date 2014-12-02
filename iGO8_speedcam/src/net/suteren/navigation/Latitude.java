package net.suteren.navigation;

public class Latitude extends GeoMeasure {

	public Latitude(double degrees) throws InvalidDegreeValueException {
		super(degrees);
		// TODO Auto-generated constructor stub
	}

	public Latitude(int degrees, float minutes)
			throws InvalidDegreeValueException, InvalidMinuteValueException {
		super(degrees, minutes);
		// TODO Auto-generated constructor stub
	}

	public Latitude(int degrees, int minutes, float seconds)
			throws InvalidDegreeValueException, InvalidMinuteValueException,
			InvalidSecondValueException {
		super(degrees, minutes, seconds);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected boolean validateDegrees(double degrees)
			throws InvalidDegreeValueException {
		boolean result = (degrees <= 90);
		result = (result && (degrees >= -90));
		if (!result)
			throw new InvalidDegreeValueException();
		return result;
	}

	@Override
	protected boolean validateMinutes(float minutes)
			throws InvalidMinuteValueException {
		boolean result = (minutes <= 60);
		result = (result && (minutes >= 0));
		if (!result)
			throw new InvalidMinuteValueException();
		return result;
	}

	@Override
	protected boolean validateSeconds(float seconds)
			throws InvalidSecondValueException {
		boolean result = (seconds <= 60);
		result = (result && (seconds >= 0));
		if (!result)
			throw new InvalidSecondValueException();
		return result;
	}

}
