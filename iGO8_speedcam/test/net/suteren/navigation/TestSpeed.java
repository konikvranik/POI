package net.suteren.navigation;

import static org.junit.Assert.*;
import junit.framework.TestCase;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestSpeed extends TestCase {

	Speed speed1;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		speed1 = new Speed(10, Speed.SU_MPH);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSpeedFloatFloat() {
		Speed speed = new Speed(10, Speed.SU_MPH);
		assertNotNull(speed);
	}

	@Test
	public void testSpeedFloat() {
		Speed speed = new Speed(10);
		assertNotNull(speed);
	}

	@Test
	public void testGetSpeed() {
		Speed s = new Speed(10, Speed.SU_MPH);
		assertEquals((float)4.4704, s.getSpeed(Speed.SU_MPS));
	}

	@Test
	public void testSetSpeedFloat() {
		speed1.setSpeed(12);
		assertEquals((float)12.0F, speed1.getSpeed());
	}

	@Test
	public void testSetSpeedFloatFloat() {
		speed1.setSpeed(12, Speed.SU_KNT);
		assertEquals((float)22.224, speed1.getSpeed(Speed.SU_KPH));
	}

	@Test
	public void testSetSpeedMPH() {
		speed1.setSpeedMPH(10);
		assertEquals(16.09344F, speed1.getSpeed(Speed.SU_KPH));
	}

	@Test
	public void testSetSpeedKPH() {
		speed1.setSpeedKPH(9);
		assertEquals(2.5F, speed1.getSpeed(Speed.SU_MPS));
	}

	@Test
	public void testSetSpeedKNT() {
		speed1.setSpeedKNT(9);
		assertEquals(4.63F, speed1.getSpeed(Speed.SU_MPS));
	}

	@Test
	public void testSetSpeedMPS() {
		speed1.setSpeedMPS(10);
		assertEquals(36F, speed1.getSpeed(Speed.SU_KPH));
	}

	@Test
	public void testGetSpeedKPH() {
		assertEquals(16.09344F, speed1.getSpeedKPH());
	}

	@Test
	public void testGetSpeedMPH() {
		assertEquals(10F, speed1.getSpeedMPH());
	}

	@Test
	public void testGetSpeedMPS() {
		assertEquals(4.4704F, speed1.getSpeedMPS());
	}

	@Test
	public void testGetSpeedKNT() {
		assertEquals(8.68976242F, speed1.getSpeedKNT());

	}

	@Test
	public void testEquals() {
		Speed s1 = new Speed(10, Speed.SU_MPH);
		Speed s2 = new Speed(8.68976242F, Speed.SU_KNT);
		assertEquals(s1, s2);
		assertTrue(s1.equals(s2));
		s2 = new Speed(10, Speed.SU_KNT);
		assertFalse(s1.equals(s2));
	}

	@Test
	public void testClone() throws CloneNotSupportedException {
		Speed s1 = new Speed(8.68976242F, Speed.SU_KNT);
		Speed s2 = (Speed) s1.clone();
		assertNotSame(s1, s2);
		assertEquals(s1, s2);
	}

	@Test
	public void testToString() {
		Speed s = new Speed(12.5F, Speed.SU_KNT);
		assertEquals("12.5 knots", s.toString());
		s.setSpeedKPH(13.5F);
		assertEquals("13.5 km/h", s.toString());
		s.setSpeedMPH(11.2F);
		assertEquals("11.2 mph", s.toString());
		s.setSpeedMPS(9.1F);
		assertEquals("9.1 m/s", s.toString());
	}

	private void assertEquals(float expected, float actual) {
		if (Math.abs(expected - actual) > 0.00001)
			fail("expected:<" + expected + "> but was:<" + actual + ">");

	}
}
