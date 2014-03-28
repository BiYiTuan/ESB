package eab.util;

import java.io.File;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class EABFile {
	
	public EABFile(String filePath){		
		traverseFile(filePath);
	}
	
	public EABFile(File myFile){
		traverseFile(myFile);
	}
	
	public Boolean getIsFolder() {
		return isFolder;
	}
	
	public void setIsFolder(Boolean isFolder) {
		this.isFolder = isFolder;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getAbsoluteFilePath() {
		return absoluteFilePath;
	}
	
	public void setAbsoluteFilePath(String absoluteFilePath) {
		this.absoluteFilePath = absoluteFilePath;
	}

	public EABFile[] getSubFiles() {
		return subFiles;
	}

	public void setSubFiles(EABFile[] subFiles) {
		this.subFiles = subFiles;
	}
	
	public Element toXMLElement(){
		Element element = DocumentHelper.createElement("File");
		element.addAttribute("isFolder", isFolder.toString());
		element.addAttribute("fileName", fileName);
		element.addAttribute("absoluteFilePath", absoluteFilePath);
		if(isFolder){
			for (EABFile subFile : subFiles) {
				element.add(subFile.toXMLElement());
			}
		}
		
		return element;
	}

	protected void traverseFile(String filePath){	
		traverseFile(new File(filePath));
	}
	
	protected void traverseFile(File myFile){
		if(!myFile.exists())
			return;
		
		this.absoluteFilePath = myFile.getAbsolutePath().replaceAll("\\\\", "/");
		this.isFolder = myFile.isDirectory();
		this.fileName = myFile.getName();
		if(!isFolder)
			return;
		
		File[] files = myFile.listFiles();
		subFiles = new EABFile[files.length];
		for (int i = 0; i < files.length; i++) {
			subFiles[i] = new EABFile(files[i]);
		}
	}
	
	private Boolean isFolder = false;
	private String fileName;
	private String absoluteFilePath;
	private EABFile[] subFiles = null;
}
