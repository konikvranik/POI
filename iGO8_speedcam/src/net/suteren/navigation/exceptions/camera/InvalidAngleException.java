package net.suteren.navigation.exceptions.camera;

public class InvalidAngleException extends Exception {

	public short cameraAngle;
	
	public InvalidAngleException(short cameraAngle) {
		this.cameraAngle=cameraAngle;
	}

	@Override
	public String getMessage() {
		return "Camera angle " + cameraAngle + " is not acceptable.";
	}
}
