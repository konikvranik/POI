package net.suteren.navigation;

import static org.junit.Assert.*;
import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.sun.net.httpserver.Authenticator.Success;

public class TestLongitude extends TestCase {

	int degrees1 = 70;
	int degrees2 = -80;
	int minutes1 = 45;
	int minutes2 = 58;
	float seconds1 = 15.43245F;
	float seconds2 = 23.44564F;
	double value3 = 56.12312;

	Longitude longitude1;
	Longitude longitude2;
	Longitude longitude3;

	@Before
	public void setUp() throws Exception {
		longitude1 = new Longitude(degrees1, minutes1, seconds1);
		longitude2 = new Longitude(degrees2, minutes2, seconds2);
		longitude3 = new Longitude(value3);

	}

	@Test
	public void testLongitudeDouble() throws InvalidDegreeValueException {
		Longitude longitude = new Longitude(0);
		assertNotNull(longitude);
	}

	@Test
	public void testLongitudeIntFloat() throws InvalidDegreeValueException,
			InvalidMinuteValueException {
		Longitude longitude = new Longitude(0, 0);
		assertNotNull(longitude);
	}

	@Test
	public void testLongitudeIntIntFloat() throws InvalidDegreeValueException,
			InvalidMinuteValueException, InvalidSecondValueException {
		Longitude longitude = new Longitude(0, 0, 0);
		assertNotNull(longitude);
	}

	@Test
	public void testValidateDegrees() {
		try {
			longitude1.validateDegrees(180);
		} catch (Exception e) {
			fail("180 degrees not accepted: " + e);
		}
		try {
			longitude1.validateDegrees(180.001);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("180.001 degrees accepted.");
	}

	@Test
	public void testValidateMinutes() {
		try {
			longitude1.validateMinutes(60);
		} catch (Exception e) {
			fail("60 minutes not accepted: " + e);
		}
		try {
			longitude1.validateMinutes(60.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("60.001 minutes accepted.");
	}

	@Test
	public void testValidateSeconds() {
		try {
			longitude1.validateSeconds(60);
		} catch (Exception e) {
			fail("60 seconds not accepted: " + e);
		}
		try {
			longitude1.validateSeconds(60.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("60.001 seconds accepted.");
	}

	@Test
	public void testValidateDouble() {
		try {
			longitude1.validate(180);
		} catch (Exception e) {
			fail("180 degrees not accepted: " + e);
		}
		try {
			longitude1.validate(180.001F);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("180.001 degrees accepted.");
	}

	@Test
	public void testValidateIntFloat() {
		try {
			longitude1.validate(179, 60);
			longitude1.validate(180, 0);
		} catch (Exception e) {
			fail(e.toString());
		}
		try {
			longitude1.validate(180, 0.01F);
		} catch (GeoMeasureException e) {
			try {
				longitude1.validate(181, 0);
			} catch (GeoMeasureException e1) {
				return;
			}
		}
		fail("more than 180 degrees accepted.");
	}

	@Test
	public void testValidateIntIntFloat() {
		try {
			longitude1.validate(179, 60, 0);
			longitude1.validate(179, 59, 60);
			longitude1.validate(180, 0, 0);
		} catch (Exception e) {
			fail(e.toString());
		}
		String output = "";
		try {
			longitude1.validate(180, 0, 1);
			output += "(180,0,1) ";
		} catch (GeoMeasureException e) {
			try {
				longitude1.validate(181, 0, 0);
				output += "(181,0,0) ";
			} catch (GeoMeasureException e1) {
				try {
					longitude1.validate(180, 1, 0);
					output += "(180,1,0) ";
				} catch (GeoMeasureException e2) {
					return;
				}
			}
		}
		fail("more than 180 degrees accepted: " + output);
	}

	@Test
	public void testSetValue() throws InvalidDegreeValueException {
		longitude3.setValue(180);
		try {
			longitude3.setValue(180.001);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("180.001 degrees accepted.");
	}

	@Test
	public void testGetValue() {
		assertEquals(value3, longitude3.getValue());
	}

	@Test
	public void testSetDegrees() throws InvalidDegreeValueException {
		Longitude longitude = new Longitude(0);
		longitude.setDegrees(180);
		try {
			longitude.setDegrees(181);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("181 degrees accepted.");
	}

	@Test
	public void testGetDegrees() throws InvalidDegreeValueException {
		assertEquals(degrees1, longitude1.getDegrees());
	}

	@Test
	public void testSetMinutes() throws InvalidMinuteValueException,
			InvalidDegreeValueException {
		Longitude longitude = new Longitude(0);
		longitude.setMinutes(60);
		try {
			longitude.setMinutes(61);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("61 minutes accepted.");
	}

	@Test
	public void testGetMinutes() {
		assertEquals(minutes1, longitude1.getMinutes());
	}

	@Test
	public void testSetSeconds() throws InvalidSecondValueException,
			InvalidDegreeValueException {
		Longitude longitude = new Longitude(0);
		longitude.setSeconds(60);
		try {
			longitude.setSeconds(61);
		} catch (GeoMeasureException e) {
			return;
		}
		fail("61 minutes accepted.");
	}

	@Test
	public void testGetSeconds() {
		assertEquals(seconds1, longitude1.getSeconds());
	}

	@Test
	public void testToggleSign() {
		double value = longitude3.getValue();
		longitude3.toggleSign();
		assertEquals(-value, longitude3.getValue());
	}

	@Test
	public void testEquals() throws InvalidDegreeValueException,
			InvalidMinuteValueException, InvalidSecondValueException {
		assertFalse(longitude1.equals(longitude2));
		Longitude longitude = new Longitude(degrees1, minutes1, seconds1);
		assertTrue(longitude1.equals(longitude));
		assertEquals(longitude, longitude1);
	}

	@Test
	public void testClone() throws CloneNotSupportedException {
		Longitude longitude = (Longitude) longitude1.clone();
		assertNotSame(longitude, longitude1);
	}

	@Test
	public void testToString() {
		assertEquals("" + degrees1 + "°" + minutes1 + "'" + seconds1 + "\"",
				longitude1.toString());
	}

	@After
	public void tearDown() throws Exception {
	}

}
