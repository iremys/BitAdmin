package com.bitacademy.vo;

public class TestDateVo {

	private int testDate_id;
	private int class_id;
	private String testDate;
	private String testTime;
	
	public TestDateVo() {
	}

	public TestDateVo(int testDate_no, int class_id, String testDate, String testTime) {
		this.testDate_id = testDate_no;
		this.class_id = class_id;
		this.testDate = testDate;
		this.testTime = testTime;
	}

	public int getTestDate_id() {
		return testDate_id;
	}

	public void setTestDate_no(int testDate_id) {
		this.testDate_id = testDate_id;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public String getTestDate() {
		return testDate;
	}

	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}

	@Override
	public String toString() {
		return "TestDateVo [testDate_id=" + testDate_id + ", class_id=" + class_id + ", testDate=" + testDate + ", testTime=" + testTime + "]";
	}

}
