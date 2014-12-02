package net.suteren.navigation.domain.camera;

import net.suteren.navigation.exceptions.camera.InvalidAngleException;
import net.suteren.navigation.exceptions.camera.InvalidCameraDirectionException;
import net.suteren.navigation.exceptions.camera.InvalidCameraTypeException;

public class Camera {

	public static final short CT_FIXED = 0;
	public static final short CT_MOBILE = 1;
	public static final short CT_SECTION = 2;
	public static final short CT_BUILTIN = 3;
	public static final short CT_REDLIGHT = 4;

	public static final short CD_SINGLE_DIRECTION = 0;
	public static final short CD_BIDIRECTION = 1;
	public static final short CD_ALLDIRECTION = 2;

	private short cameraType;
	private short cameraDirection;
	private short cameraAngle;

	public Camera() {
	}

	public Camera(short cameraType, short cameraDirection, short cameraAngle)
			throws InvalidCameraTypeException, InvalidCameraDirectionException,
			InvalidAngleException {
		this.setCameraType(cameraType);
		this.setCameraDirection(cameraDirection);
		this.setCameraAngle(cameraAngle);
	}

	/**
	 * @return the cameraType
	 */
	public short getCameraType() {
		return cameraType;
	}

	/**
	 * @param cameraType
	 *            the cameraType to set
	 * @throws InvalidCameraTypeException
	 */
	public void setCameraType(short cameraType)
			throws InvalidCameraTypeException {
		if (cameraType < 0 || cameraType > 4)
			throw new InvalidCameraTypeException(cameraType);
		this.cameraType = cameraType;
	}

	public void setCameraTypeFixed() {
		try {
			setCameraType(CT_FIXED);
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraTypeMobile() {
		try {
			setCameraType(CT_MOBILE);
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraTypeSection() {
		try {
			setCameraType(CT_SECTION);
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraTypeBuiltIn() {
		try {
			setCameraType(CT_BUILTIN);
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraTypeRedLight() {
		try {
			setCameraType(CT_REDLIGHT);
		} catch (InvalidCameraTypeException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @return the cameraDirection
	 */
	public short getCameraDirection() {
		return cameraDirection;
	}

	/**
	 * @param cameraDirection
	 *            the cameraDirection to set
	 * @throws InvalidCameraDirectionException
	 * @throws InvalidAngleException
	 */
	public void setCameraDirection(short cameraDirection)
			throws InvalidCameraDirectionException {
		if (cameraDirection < 0 || cameraDirection > 2)
			throw new InvalidCameraDirectionException(cameraDirection);
		this.cameraDirection = cameraDirection;
	}

	public void setCameraDirectionUni() {
		try {
			setCameraDirection(CD_SINGLE_DIRECTION);
		} catch (InvalidCameraDirectionException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraDirectionBi() {
		try {
			setCameraDirection(CD_BIDIRECTION);
		} catch (InvalidCameraDirectionException e) {
			throw new RuntimeException(e);
		}
	}

	public void setCameraDirectionAll() {
		try {
			setCameraDirection(CD_ALLDIRECTION);
		} catch (InvalidCameraDirectionException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @return the cameraAngle
	 */
	public short getCameraAngle() {
		return cameraAngle;
	}

	/**
	 * @param cameraAngle
	 *            the cameraAngle to set
	 * @throws InvalidAngleException
	 */
	public void setCameraAngle(short cameraAngle) throws InvalidAngleException {
		if (cameraAngle < 0 || cameraAngle > 360)
			throw new InvalidAngleException(cameraAngle);
		this.cameraAngle = cameraAngle;
	}

	@Override
	public String toString() {
		String output = "";
		switch (cameraType) {
		case CT_FIXED:
			output = "Fixed ";
			break;

		case CT_MOBILE:
			output = "Mobile ";
			break;

		case CT_SECTION:
			output = "Section ";
			break;

		case CT_REDLIGHT:
			output = "Red light ";
			break;

		case CT_BUILTIN:
			output = "Built in ";
			break;

		default:
			output = "Unknown ";
			break;
		}

		switch (cameraDirection) {
		case CD_SINGLE_DIRECTION:
			output += "single-directional ";
			break;

		case CD_BIDIRECTION:
			output += "bi-directional ";
			break;

		case CD_ALLDIRECTION:
			output += "all-directional ";
			break;

		default:
			break;
		}

		return output + "camera in angle of " + cameraAngle + " degrees";
	}

	@Override
	public boolean equals(Object obj) {
		try {
			Camera cam = (Camera) obj;
			return this.getCameraAngle() == cam.getCameraAngle()
					&& this.getCameraDirection() == cam.getCameraDirection()
					&& this.getCameraType() == cam.getCameraType();
		} catch (ClassCastException e) {
			return false;
		}

	}
}
