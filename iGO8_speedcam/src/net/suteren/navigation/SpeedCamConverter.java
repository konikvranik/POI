package net.suteren.navigation;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

import net.suteren.common.Arrays;
import net.suteren.common.InvalidByteArrayException;
import net.suteren.common.NumericOverflowException;
import net.suteren.geo.InvalidDegreeValueException;
import net.suteren.navigation.domain.camera.SpeedCam;
import net.suteren.navigation.exceptions.camera.InvalidAngleException;
import net.suteren.navigation.exceptions.camera.InvalidCameraDirectionException;
import net.suteren.navigation.exceptions.camera.InvalidCameraTypeException;
import net.suteren.navigation.exceptions.camera.NotSpudDataException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csvreader.CsvReader;
import com.csvreader.CsvWriter;

public class SpeedCamConverter {

	private static Log log = LogFactory.getLog(SpeedCamConverter.class
			.getName());

	private Collection<SpeedCam> speedCameras = new HashSet<SpeedCam>();

	public SpeedCamConverter() {
	}

	public void readCSV(String fileName) throws IOException {
		speedCameras = csvReader(new CsvReader(fileName));
	}

	public void writeCSV(String fileName) throws IOException {
		csvWriter(new CsvWriter(fileName), speedCameras);
	}

	public void writeSpud(String fileName) throws IOException {
		spudWriter(new FileOutputStream(fileName), speedCameras);
	}

	public void readSpud(String fileName) throws IOException,
			InvalidByteArrayException {
		speedCameras = spudReader(new FileInputStream(fileName));
	}

	public Collection<SpeedCam> getSpeedCameras() {
		return speedCameras;
	}

	public void setSpeedCameras(Collection<SpeedCam> speedCameras) {
		this.speedCameras = speedCameras;
	}

	public void addSpeedCamera(SpeedCam camera) {
		this.speedCameras.add(camera);
	}

	public static Collection<SpeedCam> spudReader(InputStream r)
			throws IOException, InvalidByteArrayException {
		Collection<SpeedCam> cameras = new HashSet<SpeedCam>();
		int chunk;
		int counter = 0;
		int[] buf = new int[SpeedCam.SPUD_RECORD_LENGHTH];
		int count = 0;
		while ((chunk = r.read()) >= 0) {
			buf[counter++] = chunk;
			if (counter == SpeedCam.SPUD_RECORD_LENGHTH) {
				Exception ex = null;
				try {
					SpeedCam s = new SpeedCam(buf);
					cameras.add(s);
					log.debug("> " + s.toString());
				} catch (InvalidDegreeValueException e) {
					ex = e;
				} catch (InvalidCameraTypeException e) {
					ex = e;
				} catch (InvalidAngleException e) {
					ex = e;
				} catch (InvalidCameraDirectionException e) {
					ex = e;
				} catch (NotSpudDataException e) {
					ex = e;
				} catch (InvalidByteArrayException e) {
					ex = e;
				}
				if (ex != null) {
					log.error("Record " + count + ">>>"
							+ Arrays.toHexString(buf) + "<<< caused " + ex);
				}
				counter = 0;
				count++;
			}
		}
		if (counter != 0)
			log
					.warn("Unexpected end of spud file after " + count
							+ " records.");
		// throw new UnexpectedEndOfSpudFileException();
		r.close();
		log.info("Successfully read " + count + " iGO8 spud records.");
		return cameras;
	}

	public static void spudWriter(OutputStream w,
			Collection<SpeedCam> speedCameras) throws IOException {
		Iterator<SpeedCam> i = speedCameras.iterator();
		int count = 0;
		while (i.hasNext()) {
			SpeedCam cam = i.next();
			try {
				for (int chunk : cam.toSpud()) {
					w.write(chunk);
				}
			} catch (NumericOverflowException e) {
				log.error("Camera >>>" + cam + "<<< caused exception: " + e);
			}
			log.debug("< " + cam.toString());
			count++;
		}
		w.close();
		log.info("Successfully wrote " + count + " CSV records.");
	}

	public static Collection<SpeedCam> csvReader(CsvReader csvReader)
			throws IOException {

		Collection<SpeedCam> speedCameras = new HashSet<SpeedCam>();
		int count = 0;
		if (csvReader.readHeaders()) {
				String[] headers = csvReader.getHeaders();	while (csvReader.readRecord()) {
				Exception ex = null;
				try {
					SpeedCam s = new SpeedCam(Double
							.valueOf(csvReader.get("X")), Double
							.valueOf(csvReader.get("Y")), (short) (Short
							.valueOf(csvReader.get("TYPE")) - 1), Float
							.valueOf(csvReader.get("SPEED")), Short
							.valueOf(csvReader.get("DirType")), Short
							.valueOf(csvReader.get("Direction")));
					speedCameras.add(s);
					log.debug("> " + s.toString());
					count++;
				} catch (InvalidDegreeValueException e) {
					ex = e;
				} catch (InvalidCameraTypeException e) {
					ex = e;
				} catch (InvalidCameraDirectionException e) {
					ex = e;
				} catch (InvalidAngleException e) {
					ex = e;
				}
				if (ex != null) {
					log.error("Row >>>" + csvReader.getRawRecord()
							+ "<<< caused " + ex);
				}
			}
		}
		csvReader.close();
		log.info("Successfully read " + count + " iCSV records.");
		return speedCameras;
	}

	public static void csvWriter(CsvWriter w, Collection<SpeedCam> speedCameras)
			throws IOException {
		w.write("X");
		w.write("Y");
		w.write("TYPE");
		w.write("SPEED");
		w.write("DirType");
		w.write("Direction");
		w.endRecord();
		Iterator<SpeedCam> i = speedCameras.iterator();
		int count = 0;
		while (i.hasNext()) {
			SpeedCam camera = i.next();
			String[] record = { "" + (float) camera.getLongitudeValue(),
					"" + (float) camera.getLatitudeValue(),
					"" + camera.getCameraType(),
					"" + (short) Math.round(camera.getSpeedLimitValue()),
					"" + camera.getCameraDirection(),
					"" + camera.getCameraAngle() };
			w.writeRecord(record);
			log.debug("< " + camera.toString());
			count++;
		}
		w.close();
		log.info("Successfully wrote " + count + " CSV records.");
	}

	public static void main(String[] args) throws IOException,
			NumberFormatException, InvalidCameraTypeException,
			InvalidCameraDirectionException, InvalidAngleException,
			InvalidByteArrayException {

		log.debug("Program start.");
		log.debug("Logger: " + log.getClass());

		SpeedCamConverter spdc = new SpeedCamConverter();

		File fileFrom = new File(args[0]);
		String[] buf = fileFrom.getName().split("\\.");
		String extFrom = buf[buf.length - 1];

		if ("spud".equals(extFrom)) {
			spdc.readSpud(fileFrom.getPath());
		} else if ("csv".equals(extFrom) || "txt".equals(extFrom)) {
			spdc.readCSV(fileFrom.getPath());
		}

		File fileTo = new File(args[1]);
		buf = fileTo.getName().split("\\.");
		String extTo = buf[buf.length - 1];

		if ("spud".equals(extTo)) {
			spdc.writeSpud(fileTo.getPath());
		} else if ("csv".equals(extTo) || "txt".equals(extTo)) {
			spdc.writeCSV(fileTo.getPath());
		}
		log.debug("Program end.");
	}
}
