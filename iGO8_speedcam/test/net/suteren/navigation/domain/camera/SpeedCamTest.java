package net.suteren.navigation.domain.camera;

import static org.junit.Assert.*;
import junit.framework.TestCase;

import net.suteren.common.InvalidByteArrayException;
import net.suteren.common.NumericOverflowException;
import net.suteren.geo.InvalidDegreeValueException;
import net.suteren.geo.Latitude;
import net.suteren.geo.Longitude;
import net.suteren.navigation.domain.speed.Speed;
import net.suteren.navigation.exceptions.camera.InvalidAngleException;
import net.suteren.navigation.exceptions.camera.InvalidCameraDirectionException;
import net.suteren.navigation.exceptions.camera.InvalidCameraTypeException;
import net.suteren.navigation.exceptions.camera.NotSpudDataException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class SpeedCamTest extends TestCase {

	SpeedCam sc1;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		sc1 = new SpeedCam(14.234123, 50.1234512, (short) 1, (float) 50,
				(short) 1, (short) 43, (short) 1);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSpeedCam() {
		assertNotNull(new SpeedCam());
	}

	@Test
	public void testSpeedCamDoubleDoubleShortFloatShortShortShort()
			throws InvalidDegreeValueException, InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException {
		assertNotNull(new SpeedCam(14.234123, 50.1234512, (short) 1,
				(float) 50, (short) 1, (short) 43, (short) 1));
	}

	@Test
	public void testSpeedCamDoubleDoubleShortFloatShortShort()
			throws InvalidDegreeValueException, InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException {
		assertNotNull(new SpeedCam(14.234123, 50.1234512, (short) 1,
				(float) 50, (short) 1, (short) 43));
	}

	@Test
	public void testSpeedCamIntArray() throws InvalidDegreeValueException,
			InvalidCameraTypeException, InvalidAngleException,
			InvalidCameraDirectionException, NotSpudDataException,
			InvalidByteArrayException {
		int[] buf = { 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 45, 1, 1 };
		assertNotNull(new SpeedCam(buf));
	}

	@Test
	public void testGetLatitude() throws InvalidDegreeValueException {
		assertEquals(new Latitude(50.1234512), sc1.getLatitude());
	}

	@Test
	public void testGetLatitudeValue() {
		assertEquals(50.1234512, sc1.getLatitudeValue());
	}

	@Test
	public void testGetLongitude() throws InvalidDegreeValueException {
		assertEquals(new Longitude(14.234123), sc1.getLongitude());

	}

	@Test
	public void testGetLongitudeValue() {
		assertEquals(14.234123, sc1.getLongitudeValue());
	}

	@Test
	public void testSetLatitudeLatitude() throws InvalidDegreeValueException {
		sc1.setLatitude(new Latitude(14));
		assertEquals(14.0, sc1.getLatitudeValue());
	}

	@Test
	public void testSetLatitudeDouble() throws InvalidDegreeValueException {
		sc1.setLatitude(16);
		assertEquals(16.0, sc1.getLatitudeValue());
	}

	@Test
	public void testSetLongitudeDouble() throws InvalidDegreeValueException {
		sc1.setLongitude(50);
		assertEquals(50.0, sc1.getLongitudeValue());
	}

	@Test
	public void testSetLongitudeLongitude() throws InvalidDegreeValueException {
		sc1.setLongitude(new Longitude(60));
		assertEquals(60.0, sc1.getLongitudeValue());
	}

	@Test
	public void testGetCamera() throws InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException {
		assertEquals(new Camera((short) 1, (short) 1, (short) 43), sc1
				.getCamera());
	}

	@Test
	public void testGetSpeedLimit() {
		assertEquals(new Speed(50), sc1.getSpeedLimit());
	}

	@Test
	public void testSetSpeedLimitSpeed() {
		sc1.setSpeedLimit(new Speed(70));
		assertEquals((float) 70.0, sc1.getSpeedLimitValue());
	}

	@Test
	public void testSetSpeedLimitFloat() {
		sc1.setSpeedLimit((float) 90);
		assertEquals((float) 90.0, sc1.getSpeedLimitValue());
	}

	@Test
	public void testSetSpeedLimitFloatFloat() {
		sc1.setSpeedLimit(101, Speed.SU_MPH);
		assertEquals((float) 101, sc1.getSpeedLimitValue(Speed.SU_MPH));
	}

	@Test
	public void testGetSpeedLimitValue() {
		assertEquals((float) 50, sc1.getSpeedLimitValue());
	}

	@Test
	public void testGetSpeedLimitValueFloat() {
		assertEquals((float) (50 / 3.6), sc1.getSpeedLimitValue(Speed.SU_MPS));
	}

	@Test
	public void testGetFlag() {
		assertEquals(1, sc1.getFlag());
	}

	@Test
	public void testSetFlag() {
		sc1.setFlag((short) 2);
		assertEquals(2, sc1.getFlag());
	}

	@Test
	public void testToSpud() throws NumericOverflowException {

		/*
		 * 14,234123 / 1,1920929E-07 = 119404477,62082971889187495370537 71DF7BD
		 * 
		 * 50,1234512 / 1.1920929E-07 = 420465982,13947923018415762731244
		 * 190FCD3E
		 * 
		 * 
		 * 1 43
		 */
		int[] cbuf = {

		0x3E, 0xCD, 0x0F, 0x19,

		0xBD, 0xF7, 0x1D, 0x07,

		50, 1, 43, 2, 1

		};
		assertArrayEquals(cbuf, sc1.toSpud());
	}

	@Test
	public void testToString() {

		assertEquals(
				"Mobile bi-directional camera in angle of 43 degrees, speed limit 50.0 km/h at 50°7'24.42432\"N 14°14'2.8428\"E",
				sc1.toString());
	}

}
