package net.suteren.navigation;

import net.suteren.navigation.domain.camera.CameraTest;
import net.suteren.navigation.domain.camera.SpeedCamTest;
import net.suteren.navigation.domain.speed.SpeedTest;
import junit.framework.Test;
import junit.framework.TestSuite;

public class AllTests {

	public static Test suite() {
		TestSuite suite = new TestSuite("Test for net.suteren.navigation");
		//$JUnit-BEGIN$
		
		suite.addTestSuite(CameraTest.class);
		suite.addTestSuite(SpeedCamTest.class);
		suite.addTestSuite(SpeedTest.class);
		
		suite.addTestSuite(SpeedCamConverterTest.class);
		//$JUnit-END$
		return suite;
	}

}
