package eab.util;

import java.io.File;

public class EABPath {
	public static String getApplicationPath(){
		File file = new File("");
		String path = file.getAbsolutePath();
		return path.endsWith(File.separator) ? path : (path + File.separator);
	}
	
	public static String getDeployPath(){
		return getApplicationPath() + "deploy" + File.separator;
	}
	
	public static String getProtocolPath(){
		return getApplicationPath() + "protocol" + File.separator;
	}
	
	public static String getTemplatePath(){
		return getApplicationPath() + "template" + File.separator;
	}
	
	public static String getConfPath(){
		return getApplicationPath() + "conf" + File.separator;
	}
}
