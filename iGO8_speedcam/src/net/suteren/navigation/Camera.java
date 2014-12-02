package net.suteren.navigation;

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
	public void setCameraType(short cameraType) throws InvalidCameraTypeException {
		if (cameraType < 0 || cameraType > 4)
			throw new InvalidCameraTypeException();
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
			throw new InvalidCameraDirectionException();
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
			throw new InvalidAngleException();
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
			output += "singledirectional ";
			break;

		case CD_BIDIRECTION:
			output += "bidirectional ";
			break;

		case CD_ALLDIRECTION:
			output += "alldirectional ";
			break;

		default:
			break;
		}

		return output + "camera in angle " + cameraAngle + " degrees";
	}
}
