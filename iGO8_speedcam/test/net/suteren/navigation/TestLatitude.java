package net.suteren.navigation;

import static org.junit.Assert.*;
import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.sun.net.httpserver.Authenticator.Success;

public class TestLatitude extends TestCase{

	int degrees1 = 70;
	int degrees2 = -80;
	int minutes1 = 45;
	int minutes2 = 58;
	float seconds1 = 15.43245F;
	float seconds2 = 23.44564F;
	double value3 = 56.12312;

	Latitude latitude1;
	Latitude latitude2;
	Latitude latitude3;

	@Before
	public void setUp() throws Exception {
		latitude1 = new Latitude(degrees1, minutes1, seconds1);
		latitude2 = new Latitude(degrees2, minutes2, seconds2);
		latitude3 = new Latitude(value3);

	}

	@Test
	public void testLatitudeDouble() throws InvalidDegreeValueException {
		Latitude latitude = new Latitude(0);
		assertNotNull(latitude);
	}

	@Test
	public void testLatitudeIntFloat() throws InvalidDegreeValueException,
			InvalidMinuteValueException {
		Latitude latitude = new Latitude(0, 0);
		assertNotNull(latitude);
	}

	@Test
	public void testLatitudeIntIntFloat() throws InvalidDegreeValueException,
			InvalidMinuteValueException, InvalidSecondValueException {
		Latitude latitude = new Latitude(0, 0, 0);
		assertNotNull(latitude);
	}

	@Test
	public void testValidateDegrees() {
		try {
			latitude1.validateDegrees(90);
		} catch (Exception e) {
			fail("90 degrees not accepted: " + e);
		}
		try {
			latitude1.validateDegrees(90.001);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("90.001 degrees accepted.");
	}

	@Test
	public void testValidateMinutes() {
		try {
			latitude1.validateMinutes(60);
		} catch (Exception e) {
			fail("60 minutes not accepted: " + e);
		}
		try {
			latitude1.validateMinutes(60.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("60.001 minutes accepted.");
	}

	@Test
	public void testValidateSeconds() {
		try {
			latitude1.validateSeconds(60);
		} catch (Exception e) {
			fail("60 seconds not accepted: " + e);
		}
		try {
			latitude1.validateSeconds(60.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("60.001 seconds accepted.");
	}

	@Test
	public void testValidateDouble() {
		try {
			latitude1.validate(90);
		} catch (Exception e) {
			fail("90 degrees not accepted: " + e);
		}
		try {
			latitude1.validate(90.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("90.001 degrees accepted.");
	}

	@Test
	public void testValidateIntFloat() {
		try {
			latitude1.validate(89, 60);
			latitude1.validate(90, 0);
		} catch (Exception e) {
			fail(e.toString());
		}
		try {
			latitude1.validate(90, 0.01F);
		} catch (GeoMeasureException e) {
			try {
				latitude1.validate(91, 0);
			} catch (GeoMeasureException e1) {
				return;
			}
		}
		fail("more than 90 degrees accepted.");
	}

	@Test
	public void testValidateIntIntFloat() {
		try {
			latitude1.validate(89, 60, 0);
			latitude1.validate(89, 59, 60);
			latitude1.validate(90, 0, 0);
		} catch (Exception e) {
			fail(e.toString());
		}
		String output = "";
		try {
			latitude1.validate(90, 0, 1);
			output += "(90,0,1) ";
		} catch (GeoMeasureException e) {
			try {
				latitude1.validate(91, 0, 0);
				output += "(91,0,0) ";
			} catch (GeoMeasureException e1) {
				try {
					latitude1.validate(90, 1, 0);
					output += "(90,1,0) ";
				} catch (GeoMeasureException e2) {
					return;
				}
			}
		}
		fail("more than 90 degrees accepted: " + output);
	}

	@Test
	public void testSetValue() throws InvalidDegreeValueException {
		latitude3.setValue(90);
		try {
			latitude3.setValue(90.001);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("90.001 degrees accepted.");
	}

	@Test
	public void testGetValue() {
		assertEquals(value3, latitude3.getValue());
	}

	@Test
	public void testSetDegrees() throws InvalidDegreeValueException {
		Latitude latitude = new Latitude(0);
		latitude.setDegrees(90);
		try {
			latitude.setDegrees(91);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("91 degrees accepted.");
	}

	@Test
	public void testGetDegrees() throws InvalidDegreeValueException {
		assertEquals(degrees1, latitude1.getDegrees());
	}

	@Test
	public void testSetMinutes() throws InvalidMinuteValueException,
			InvalidDegreeValueException {
		Latitude latitude = new Latitude(0);
		latitude.setMinutes(60);
		try {
			latitude.setMinutes(61);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("61 minutes accepted.");
	}

	@Test
	public void testGetMinutes() {
		assertEquals(minutes1, latitude1.getMinutes());
	}

	@Test
	public void testSetSeconds() throws InvalidSecondValueException,
			InvalidDegreeValueException {
		Latitude latitude = new Latitude(0);
		latitude.setSeconds(60);
		try {
			latitude.setSeconds(61);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("61 minutes accepted.");
	}

	@Test
	public void testGetSeconds() {
		assertEquals(seconds1, latitude1.getSeconds());
	}

	@Test
	public void testToggleSign() {
		double value = latitude3.getValue();
		latitude3.toggleSign();
		assertEquals(-value, latitude3.getValue());
	}

	@Test
	public void testEquals() throws InvalidDegreeValueException,
			InvalidMinuteValueException, InvalidSecondValueException {
		assertFalse(latitude1.equals(latitude2));
		Latitude latitude = new Latitude(degrees1, minutes1, seconds1);
		assertTrue(latitude1.equals(latitude));
		assertEquals(latitude, latitude1);
	}

	@Test
	public void testClone() throws CloneNotSupportedException {
		Latitude latitude = (Latitude) latitude1.clone();
		assertNotSame(latitude, latitude1);
	}

	@Test
	public void testToString() {
		assertEquals("" + degrees1 + "°" + minutes1 + "'" + seconds1 + "\"",
				latitude1.toString());
	}

	@After
	public void tearDown() throws Exception {
	}

}
