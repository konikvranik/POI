package net.suteren.navigation.exceptions.camera;

public class InvalidCameraTypeException extends Exception {

	private short cameraType;

	public InvalidCameraTypeException(short cameraType) {
		this.cameraType = cameraType;
	}

	@Override
	public String getMessage() {
		return "Camera type " + cameraType + " is not acceptable.";
	}
}
