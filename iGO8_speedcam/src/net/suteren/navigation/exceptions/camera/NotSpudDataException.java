package net.suteren.navigation.exceptions.camera;

public class NotSpudDataException extends Exception {

	int[] buf;

	public NotSpudDataException(int[] buf) {
		this.buf = buf;
	}

	@Override
	public String getMessage() {
		return "Data chunk of length >>>" + buf + "<<< of length " + buf.length
				+ " does not represent iGO8 spud record.";
	}

}
