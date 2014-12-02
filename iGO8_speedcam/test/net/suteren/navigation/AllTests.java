package net.suteren.navigation;

import junit.framework.Test;
import junit.framework.TestSuite;

public class AllTests {

	public static Test suite() {
		TestSuite suite = new TestSuite("Test for net.suteren.navigation");
		//$JUnit-BEGIN$
		suite.addTestSuite(TestLatitude.class);
		suite.addTestSuite(TestLongitude.class);
		suite.addTestSuite(TestCamera.class);
		suite.addTestSuite(TestSpeed.class);
		//$JUnit-END$
		return suite;
	}

}
