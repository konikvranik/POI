package net.suteren.navigation;

public class Speed implements Cloneable {

	public static final float SU_MPH = 1.609344F;
	public static final float SU_KNT = 1.852F;
	public static final float SU_KPH = 1;
	public static final float SU_MPS = 3.6F;

	private float speed;
	private float speedConvertRatio;

	public Speed(float value, float speedConvertRatio) {
		this.speed = value;
		this.speedConvertRatio = speedConvertRatio;
	}

	public Speed(float value) {
		this.speed = value;
		this.speedConvertRatio = 1;
	}

	public float getSpeed() {
		return this.speed;
	}

	public float getSpeed(float speedConvertRatio) {
		return this.speed * this.speedConvertRatio / speedConvertRatio;
	}

	public void setSpeed(float speed) {
		this.speed = speed;
	}

	public void setSpeed(float speed, float speedConvertRatio) {
		this.speed = speed;
		this.speedConvertRatio = speedConvertRatio;
	}

	public void setSpeedMPH(float speed) {
		setSpeed(speed, SU_MPH);
	}

	public void setSpeedKPH(float speed) {
		setSpeed(speed, SU_KPH);
	}

	public void setSpeedKNT(float speed) {
		setSpeed(speed, SU_KNT);
	}

	public void setSpeedMPS(float speed) {
		setSpeed(speed, SU_MPS);
	}

	public float getSpeedKPH() {
		return getSpeed(SU_KPH);
	}

	public float getSpeedMPH() {
		return getSpeed(SU_MPH);
	}

	public float getSpeedMPS() {
		return getSpeed(SU_MPS);
	}

	public float getSpeedKNT() {
		return getSpeed(SU_KNT);
	}

	@Override
	public boolean equals(Object obj) {

		try {
			Speed s = (Speed) obj;
			return Math.abs(this.getSpeed()
					- s.getSpeed(this.speedConvertRatio)) < 0.000001;
		} catch (ClassCastException e) {
			return super.equals(obj);
		}
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	@Override
	public String toString() {
		String unit;
		if (speedConvertRatio == SU_KNT) {
			unit = " knots";
		} else if (speedConvertRatio == SU_KPH) {
			unit = " km/h";
		} else if (speedConvertRatio == SU_MPH) {
			unit = " mph";
		} else if (speedConvertRatio == SU_MPS) {
			unit = " m/s";
		} else {
			unit = "";
		}
		return "" + speed + unit;
	}
}
