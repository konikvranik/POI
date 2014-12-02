package net.suteren.navigation.domain.camera;

import static org.junit.Assert.*;
import junit.framework.TestCase;

import net.suteren.navigation.domain.camera.Camera;
import net.suteren.navigation.exceptions.camera.InvalidAngleException;
import net.suteren.navigation.exceptions.camera.InvalidCameraDirectionException;
import net.suteren.navigation.exceptions.camera.InvalidCameraTypeException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class CameraTest extends TestCase {

	Camera c1;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		c1 = new Camera(Camera.CT_FIXED, Camera.CD_BIDIRECTION, (short) 250);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetCameraType() {
		assertEquals(Camera.CT_FIXED, c1.getCameraType());
	}

	@Test
	public void testSetCameraType() throws InvalidCameraTypeException {
		c1.setCameraType(Camera.CT_REDLIGHT);
		assertEquals(Camera.CT_REDLIGHT, c1.getCameraType());
	}

	@Test
	public void testSetCameraTypeFixed() {
		c1.setCameraTypeFixed();
		assertEquals(Camera.CT_FIXED, c1.getCameraType());
	}

	@Test
	public void testSetCameraTypeMobile() {
		c1.setCameraTypeMobile();
		assertEquals(Camera.CT_MOBILE, c1.getCameraType());
	}

	@Test
	public void testSetCameraTypeSection() {
		c1.setCameraTypeSection();
		assertEquals(Camera.CT_SECTION, c1.getCameraType());
	}

	@Test
	public void testSetCameraTypeBuiltIn() {
		c1.setCameraTypeBuiltIn();
		assertEquals(Camera.CT_BUILTIN, c1.getCameraType());
	}

	@Test
	public void testSetCameraTypeRedLight() {
		c1.setCameraTypeRedLight();
		assertEquals(Camera.CT_REDLIGHT, c1.getCameraType());
	}

	@Test
	public void testGetCameraDirection() {
		assertEquals(Camera.CD_BIDIRECTION, c1.getCameraDirection());
	}

	@Test
	public void testSetCameraDirection() throws InvalidCameraDirectionException {
		c1.setCameraDirection(Camera.CD_SINGLE_DIRECTION);
		assertEquals(Camera.CD_SINGLE_DIRECTION, c1.getCameraDirection());
	}

	@Test
	public void testSetCameraDirectionUni() {
		c1.setCameraDirectionUni();
		assertEquals(Camera.CD_SINGLE_DIRECTION, c1.getCameraDirection());
	}

	@Test
	public void testSetCameraDirectionBi() {
		c1.setCameraDirectionBi();
		assertEquals(Camera.CD_BIDIRECTION, c1.getCameraDirection());
	}

	@Test
	public void testSetCameraDirectionAll() {
		c1.setCameraDirectionAll();
		assertEquals(Camera.CD_ALLDIRECTION, c1.getCameraDirection());

	}

	@Test
	public void testGetCameraAngle() {
		assertEquals(250, c1.getCameraAngle());
	}

	@Test
	public void testSetCameraAngle() throws InvalidAngleException {
		c1.setCameraAngle((short) 360);
		assertEquals((short) 360, c1.getCameraAngle());
		c1.setCameraAngle((short) 0);
		assertEquals(0, c1.getCameraAngle());
		short value = 361;
		try {
			c1.setCameraAngle(value);
		} catch (InvalidAngleException e) {
			value = -1;
			try {
				c1.setCameraAngle(value);
			} catch (InvalidAngleException e1) {
				return;
			}
		}
		fail("Invalid angle value allowed: " + value);
	}

	@Test
	public void testToString() {
		assertEquals("Fixed bi-directional camera in angle of 250 degrees", c1
				.toString());

	}

}
