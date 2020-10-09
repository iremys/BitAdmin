package com.bitacademy.vo;


public class FileVo {
	
	private int file_id;
	private int parent_id;
	private String orgName;
	private String exName;
	private String saveName;
	private String filePath;
	private long fileSize;
	
	public FileVo() {
	}


	public FileVo(int file_id, int parent_id, String orgName, String exName, String saveName, String filePath, long fileSize) {
		this.file_id = file_id;
		this.parent_id = parent_id;
		this.orgName = orgName;
		this.exName = exName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}


	public int getFile_id() {
		return file_id;
	}


	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}


	public int getParent_id() {
		return parent_id;
	}


	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}


	public String getOrgName() {
		return orgName;
	}


	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}


	public String getExName() {
		return exName;
	}


	public void setExName(String exName) {
		this.exName = exName;
	}


	public String getSaveName() {
		return saveName;
	}


	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public long getFileSize() {
		return fileSize;
	}


	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}


	@Override
	public String toString() {
		return "FileVo [file_id=" + file_id + ", parent_id=" + parent_id + ", orgName=" + orgName + ", exName=" + exName + ", saveName=" + saveName + ", filePath=" + filePath + ", fileSize=" + fileSize + "]";
	}

}
