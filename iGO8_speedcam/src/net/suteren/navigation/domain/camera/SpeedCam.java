package net.suteren.navigation.domain.camera;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.suteren.common.Arrays;
import net.suteren.common.InvalidByteArrayException;
import net.suteren.common.NumericOverflowException;
import net.suteren.common.RawData;
import net.suteren.geo.GeoPosition;
import net.suteren.geo.GeoPositionInterface;
import net.suteren.geo.InvalidDegreeValueException;
import net.suteren.geo.Latitude;
import net.suteren.geo.Longitude;
import net.suteren.navigation.SpeedCamConverter;
import net.suteren.navigation.domain.speed.Speed;
import net.suteren.navigation.exceptions.camera.InvalidAngleException;
import net.suteren.navigation.exceptions.camera.InvalidCameraDirectionException;
import net.suteren.navigation.exceptions.camera.InvalidCameraTypeException;
import net.suteren.navigation.exceptions.camera.NotSpudDataException;

public class SpeedCam extends Camera implements GeoPositionInterface {

	private static double EPSILON = 1.1920929E-07;
	public static int SPUD_RECORD_LENGHTH = 0x0D;

	private GeoPosition position;
	private Speed speedLimit;
	private short flag;

	private static Log log = LogFactory.getLog(SpeedCamConverter.class
			.getName());

	public SpeedCam() {
		try {
			this.position = new GeoPosition(0, 0);
		} catch (InvalidDegreeValueException e) {
			throw new RuntimeException(e);
		}
		this.speedLimit = new Speed(0);
		this.flag = 0;
	}

	public SpeedCam(double x, double y, short cameraType, float speed,
			short cameraDirection, short cameraAngle, short flag)
			throws InvalidDegreeValueException, InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException {

		this();
		this.setLongitude(x);
		this.setLatitude(y);
		this.setCameraType(cameraType);
		this.setCameraDirection(cameraDirection);
		this.speedLimit = new Speed(speed);
		this.setCameraAngle(cameraAngle);
		this.flag = flag;
	}

	public SpeedCam(double x, double y, short cameraType, float speed,
			short cameraDirection, short cameraAngle)
			throws InvalidDegreeValueException, InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException {
		this(x, y, cameraType, speed, cameraDirection, cameraAngle, (short) 0);
	}

	public SpeedCam(int[] buf) throws InvalidDegreeValueException,
			InvalidCameraTypeException, InvalidAngleException,
			InvalidCameraDirectionException, NotSpudDataException,
			InvalidByteArrayException {
		this();
		if (buf.length != SPUD_RECORD_LENGHTH)
			throw new NotSpudDataException(buf);
		setLongitude((double) RawData
				.fromFourBytesReverse(java.util.Arrays.copyOfRange(buf, 0x00,
						0x04))
				* EPSILON);
		setLatitude((double) RawData
				.fromFourBytesReverse(java.util.Arrays.copyOfRange(buf, 0x04,
						0x08))
				* EPSILON);

		setSpeedLimit(RawData.fromOneByte(buf[0x08]));
		log.debug("type: " + Integer.toHexString(buf[0x09]));
		setCameraType(RawData.fromOneByte(buf[0x09]));
		int[] directionBytes = { buf[0x0B], buf[0x0A] };
		int direction = RawData.fromTwoBytes(directionBytes);
		setCameraAngle((short) (0x000001FF & direction));
		log.debug("direction: " + Integer.toHexString(0x00000600 & direction)
				+ " " + Integer.toHexString((0x00000600 & direction) >> 9));
		setCameraDirection((short) ((0x00000600 & direction) >> 9));

		setFlag(RawData.fromOneByte(buf[0x0C]));

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#getLatitude()
	 */
	@Override
	public Latitude getLatitude() {
		return position.getLatitude();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#getLatitudeValue()
	 */
	@Override
	public double getLatitudeValue() {
		return position.getLatitudeValue();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#getLongitude()
	 */
	@Override
	public Longitude getLongitude() {
		return position.getLongitude();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#getLongitudeValue()
	 */
	@Override
	public double getLongitudeValue() {
		return position.getLongitudeValue();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seenet.suteren.navigation.GeoPositionInterface#setLatitude(net.suteren.
	 * navigation.Latitude)
	 */
	@Override
	public void setLatitude(Latitude latitude)
			throws InvalidDegreeValueException {
		position.setLatitude(latitude);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#setLatitude(long)
	 */
	@Override
	public void setLatitude(double latitude) throws InvalidDegreeValueException {
		position.setLatitude(latitude);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.suteren.navigation.GeoPositionInterface#setLongitude(long)
	 */
	@Override
	public void setLongitude(double longitude)
			throws InvalidDegreeValueException {
		position.setLongitude(longitude);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.suteren.navigation.GeoPositionInterface#setLongitude(net.suteren.
	 * navigation.Longitude)
	 */
	@Override
	public void setLongitude(Longitude longitude)
			throws InvalidDegreeValueException {
		position.setLongitude(longitude);

	}

	@Deprecated
	public Camera getCamera() {
		try {
			return new Camera(this.getCameraType(), this.getCameraDirection(),
					this.getCameraAngle());
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		} catch (InvalidCameraDirectionException e) {
			throw new RuntimeException(e);
		} catch (InvalidAngleException e) {
			throw new RuntimeException(e);
		}
	}

	public Speed getSpeedLimit() {
		return speedLimit;
	}

	public void setSpeedLimit(Speed speedLimit) {
		this.speedLimit = speedLimit;
	}

	public void setSpeedLimit(float speed) {
		this.speedLimit.setSpeed(speed);
	}

	public void setSpeedLimit(float speed, float speedConvertRatio) {
		this.speedLimit.setSpeed(speed, speedConvertRatio);
	}

	public float getSpeedLimitValue() {
		return speedLimit.getSpeed();
	}

	public float getSpeedLimitValue(float speedConvertRatio) {
		return speedLimit.getSpeed(speedConvertRatio);
	}

	/**
	 * @return the flag
	 */
	public short getFlag() {
		return flag;
	}

	/**
	 * @param flag
	 *            the flag to set
	 */
	public void setFlag(short flag) {
		this.flag = flag;
	}

	public int[] toSpud() throws NumericOverflowException {

		int[] record;

		int latitude = (int) (getLatitudeValue() / EPSILON);
		int longitude = (int) (getLongitudeValue() / EPSILON);

		record = RawData.toFourBytesReverse(latitude);

		record = Arrays.concatenate(record, RawData
				.toFourBytesReverse(longitude));

		record = Arrays.concatenate(record, RawData
				.toOneByte((short) Math.round(getSpeedLimitValue())));

		record = Arrays.concatenate(record, RawData
				.toOneByte(getCameraType()));

		record = Arrays.concatenate(record, RawData
				.toTwoBytesReverse(getCameraAngle()
						| (getCameraDirection() << 9)));

		record = Arrays.concatenate(record, RawData
				.toOneByte(getFlag()));

		return record;
	}

	@Override
	public String toString() {
		return super.toString() + ", speed limit " + getSpeedLimit().toString()
				+ " at " + getLatitude().toString() + " "
				+ getLongitude().toString();
	}

}
