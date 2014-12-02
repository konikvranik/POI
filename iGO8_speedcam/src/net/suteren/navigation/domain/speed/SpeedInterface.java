package net.suteren.navigation.domain.speed;

public interface SpeedInterface {
	
	public float getSpeed() ;

	public float getSpeed(float speedConvertRatio);

	public void setSpeed(float speed) ;

	public void setSpeed(float speed, float speedConvertRatio) ;

}
