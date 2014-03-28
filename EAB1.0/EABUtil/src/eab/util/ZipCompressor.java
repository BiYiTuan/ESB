package eab.util;

import java.util.zip.*;
import java.io.*;

import org.apache.log4j.Logger;

/**
 * Compressor for eab
 *   Sorry for that this class CAN NOT deal with empty folder
 * 
 * @author fangjt
 * @version 1.0 2010-1-21
 * @see java.util.zip
 * 
 */
public class ZipCompressor {
	/**
	 * Protect constructor since it is a static only class
	 */
	protected ZipCompressor() {
	}

	/**
	 * Compress File or Folder
	 * 
	 * @param inPaths
	 *            input file array
	 * @param outFile
	 *            Output file name
	 * @throws Exception
	 */
	public static void zip(String[] inPaths, String outFile) throws Exception {
		Logger log = Logger.getLogger(FileOperator.class);
		ZipOutputStream out = null;
		try {
			out = new ZipOutputStream(new FileOutputStream(outFile));
			for (String inPath : inPaths) {
				zip(new File(inPath), out, "");
			}
			log.debug("Compress file OK, output file: " + outFile);
		} catch (Exception e) {
			log.error("Compress file Error: \n  Exception: " + e.getMessage()
					+ "\n  Trace: " + e.getStackTrace());
			throw e;
		} finally {
			if (out != null)
				out.close();
		}
	}

	/**
	 * Compress File or Folder
	 * 
	 * @param inPath
	 *            input file name or folder path
	 * @param outFile
	 *            Output file name
	 * @throws Exception
	 */
	public static void zip(String inPath, String outFile) throws Exception {
		Logger log = Logger.getLogger(FileOperator.class);
		ZipOutputStream out = null;
		try {
			out = new ZipOutputStream(new FileOutputStream(outFile));
			zip(new File(inPath), out, "");
			log.debug("Compress file OK, output file: " + outFile);
		} catch (Exception e) {
			log.error("Compress file Error: \n  Exception: " + e.getMessage()
					+ "\n  Trace: " + e.getStackTrace());
			throw e;
		} finally {
			if (out != null)
				out.close();
		}
	}

	/**
	 * Recursive function
	 * 
	 * @param f
	 *            Input file name or folder path
	 * @param out
	 *            Output file stream
	 * @param base
	 *            Prior path reference
	 * @throws Exception
	 */
	private static void zip(File f, ZipOutputStream out, String base)
			throws Exception {
		Logger log = Logger.getLogger(FileOperator.class);
		base = base.length() == 0 ? "" : base + File.separator;
		if (f.isDirectory()) { // For directory, recurse down a directory
			try {
				File[] fl = f.listFiles();
				for (File file : fl) {
					zip(file, out, base + f.getName());
				}
			} catch (Exception e) {
				log.error("Compress folder Error: \n  Exception: "
						+ e.getMessage() + "\n  Trace: " + e.getStackTrace());
				throw e;
			}
		} else { // For single file, just add it into the ZipEntry
			FileInputStream in = null;
			try {
				out.putNextEntry(new ZipEntry(base + f.getName()));				
				in = new FileInputStream(f);
				byte []b = new byte[100];
				int len = 0;
				while ((len = in.read(b)) != -1)
					out.write(b, 0, len);
			} catch (Exception e) {
				log.error("Compress file Error: \n  Exception: "
						+ e.getMessage() + "\n  Trace: " + e.getStackTrace());
				throw e;
			} finally {
				if (in != null)
					in.close();
			}
		}
	}
}
