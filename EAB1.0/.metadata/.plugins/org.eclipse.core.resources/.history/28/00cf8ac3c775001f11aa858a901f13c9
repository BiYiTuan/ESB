package eab.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

public class FileOperator {

	public static boolean createFolder(String folderName, String parentPath) {
		File file = new File(parentPath + File.separator + folderName);
		if (file.exists()) {
			return false;
		} else {
			file.mkdir();
			return true;
		}
	}

	public static boolean createFile(String fileName, String parentPath) {
		File file = new File(parentPath + File.separator + fileName);
		if (file.exists()) {
			return false;
		} else {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}

			return true;
		}
	}

	public static boolean delete(String path) {
		File f = new File(path);
		if (!f.exists())
			return false;

		if (f.isDirectory()) { // for folder
			String[] fileList = f.list();
			for (String file : fileList) {
				delete(path
						+ (path.endsWith(File.separator) ? "" : File.separator)
						+ file);
			}
		}

		f.delete();

		return true;
	}

	public static String read(String path) {
		StringBuffer sb = new StringBuffer();
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader(path));
			String s;
			while ((s = br.readLine()) != null) {
				sb.append(s);
				sb.append("\n");
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sb.toString();
	}

	public static boolean write(String path, String data) {
		File file = new File(path);
		try {
			DataOutputStream outs = new DataOutputStream(new FileOutputStream(
					file));
			outs.write(data.getBytes());
			outs.close();
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean copy(String sourcePath, String targetPath) {
		File source = new File(sourcePath);
		File target = new File(
				(targetPath.endsWith(File.separator) ? targetPath
						: (targetPath + File.separator))
						+ source.getName());

		return fileCopy(source, target);
	}

	public static boolean cut(String sourcePath, String targetPath) {
		if (!copy(sourcePath, targetPath))
			return false;

		return delete(sourcePath);
	}

	private static boolean fileCopy(File source, File target) {
		if (!source.exists()) {
			return false;
		}
		
		if (source.isFile()) {
			FileInputStream fis = null;
			FileOutputStream fos = null;
			try {
				if (!target.exists())
					target.createNewFile();

				fis = new FileInputStream(source);
				fos = new FileOutputStream(target);
				int byteread = 0;
				byte[] buffer = new byte[1024];
				while ((byteread = fis.read(buffer)) != -1) {
					fos.write(buffer, 0, byteread);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					fis.close();
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else if (source.isDirectory()) {
			if (!target.exists()) {
				target.mkdir();
			}
			
			File[] fileList = source.listFiles();
			
			for (File file : fileList) {
				fileCopy(file, new File(target.getAbsolutePath() + File.separator + file.getName()));
			}
		}
		
		return true;
	}

	public static void rename(String sourcePath, String newName) {
		String targetPath = sourcePath.substring(0, sourcePath.lastIndexOf(File.separator)) + File.separator + newName;
		File source = new File(sourcePath);
		File target = new File(targetPath);
		source.renameTo(target);
	}
}
