package net.suteren.navigation.exceptions.camera;

public class InvalidCameraDirectionException extends Exception {
	
	private short cameraDirection;

	public InvalidCameraDirectionException(short cameraDirection) {
		this.cameraDirection = cameraDirection;
	}

	@Override
	public String getMessage() {
		return "Camera direction " + cameraDirection + " is not acceptable.";
	}
}
