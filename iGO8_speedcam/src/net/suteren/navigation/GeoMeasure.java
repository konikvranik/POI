package net.suteren.navigation;

public abstract class GeoMeasure implements Cloneable {

	private double value;

	public GeoMeasure(double degrees) throws InvalidDegreeValueException {
		validate(degrees);
		this.value = degrees;
	}

	public GeoMeasure(int degrees, float minutes)
			throws InvalidDegreeValueException, InvalidMinuteValueException {
		validate(degrees, minutes);
		this.value = (double) ((double) minutes / 60) + degrees;
	}

	public GeoMeasure(int degree, int minutes, float seconds)
			throws InvalidDegreeValueException, InvalidMinuteValueException,
			InvalidSecondValueException {
		validate(degree, minutes, seconds);
		this.value = (double) ((double) seconds / 3600)
				+ (double) ((double) minutes / 60) + Math.abs(degree);
		this.value = Math.signum(degree) * this.value;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) throws InvalidDegreeValueException {
		validate(value);
		this.value = value;
	}

	public int getDegrees() {
		return (int) Math.floor(this.value);
	}

	public void setDegrees(int degrees) throws InvalidDegreeValueException {
		if (degrees < 0)
			throw new InvalidDegreeValueException();
		validateDegrees(degrees);
		this.value = Math.signum(this.value) * degrees + this.value
				- Math.floor(this.value);
	}

	public int getMinutes() {
		return (int) Math.floor((this.value - Math.floor(this.value)) * 60);
	}

	public void setMinutes(int minutes) throws InvalidMinuteValueException,
			InvalidDegreeValueException {
		if (minutes < 0)
			throw new InvalidMinuteValueException();
		validateMinutes(minutes);
		double degrees = (int) Math.floor(this.value);
		double originalMinutes = (this.value - degrees) * 60;
		double seconds = ((originalMinutes - Math.floor(originalMinutes)) / 60);
		validate(degrees + minutes + seconds);
		this.value = seconds + minutes + degrees;
	}

	public float getSeconds() {
		double minutes = this.value * 60;
		return (float) (double) (((double) minutes - Math.floor(minutes)) * 60);
	}

	public void setSeconds(int seconds) throws InvalidSecondValueException,
			InvalidDegreeValueException {
		if (seconds < 0)
			throw new InvalidSecondValueException();
		validateSeconds(seconds);
		double minutes = Math.floor(this.value * 60);
		double degrees = minutes / 60 + seconds / 3600;
		validate(degrees);
		this.value = degrees;
	}

	public void toggleSign() {
		this.value = -this.value;
	}

	@Override
	public String toString() {

		return "" + this.getDegrees() + "°" + this.getMinutes() + "'"
				+ this.getSeconds() + "\"";
	}

	@Override
	protected GeoMeasure clone() throws CloneNotSupportedException {
		return (GeoMeasure) super.clone();
	}

	@Override
	public boolean equals(Object obj) {
		try {
			GeoMeasure gm = (GeoMeasure) obj;
			return this.value == gm.value;
		} catch (ClassCastException e) {
			return false;
		}
	}

	protected boolean validate(double degrees)
			throws InvalidDegreeValueException {
		return validateDegrees(degrees);
	}

	protected boolean validate(int degrees, float minutes)
			throws InvalidDegreeValueException, InvalidMinuteValueException {
		return validateDegrees(degrees + minutes / 60)
				&& validateMinutes(minutes);
	}

	protected boolean validate(int degrees, int minutes, float seconds)
			throws InvalidDegreeValueException, InvalidMinuteValueException,
			InvalidSecondValueException {
		return validateDegrees((double) ((double) seconds / 3600)
				+ (double) ((double) minutes / 60) + degrees)
				&& validateMinutes((float) ((float) seconds / 60)
						+ (float) minutes) && validateSeconds(seconds);
	}

	protected abstract boolean validateDegrees(double degrees)
			throws InvalidDegreeValueException;

	protected abstract boolean validateMinutes(float minutes)
			throws InvalidMinuteValueException;

	protected abstract boolean validateSeconds(float seconds)
			throws InvalidSecondValueException;

}
