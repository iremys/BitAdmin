package com.bitacademy.vo;

import java.util.List;

public class ClassVo {

	private int class_id;
	private int classCate_id;
	private int curri_id;
	private String className;
	private String startDate;
	private String endDate;
	private String lectureTime;
	private int maxCnt;
	private int price;
	private String support;
	private String managerInfo;
	private String operState;
	private String gisuName;
	private String classCode;
	private String pageURL;
	private String cateName;
	private String curriName;

	private List<TestDateVo> testDateList;

	public ClassVo() {
	}

	public ClassVo(int class_id, int classCate_id, int curri_id, String className, String startDate, String endDate, String lectureTime, int maxCnt, int price, String support, String managerInfo, String operState, String gisuName, String classCode, String pageURL, String cateName, String curriName,
			List<TestDateVo> testDateList) {
		this.class_id = class_id;
		this.classCate_id = classCate_id;
		this.curri_id = curri_id;
		this.className = className;
		this.startDate = startDate;
		this.endDate = endDate;
		this.lectureTime = lectureTime;
		this.maxCnt = maxCnt;
		this.price = price;
		this.support = support;
		this.managerInfo = managerInfo;
		this.operState = operState;
		this.gisuName = gisuName;
		this.classCode = classCode;
		this.pageURL = pageURL;
		this.cateName = cateName;
		this.curriName = curriName;
		this.testDateList = testDateList;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public int getClassCate_id() {
		return classCate_id;
	}

	public void setClassCate_id(int classCate_id) {
		this.classCate_id = classCate_id;
	}

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLectureTime() {
		return lectureTime;
	}

	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}

	public int getMaxCnt() {
		return maxCnt;
	}

	public void setMaxCnt(int maxCnt) {
		this.maxCnt = maxCnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSupport() {
		return support;
	}

	public void setSupport(String support) {
		this.support = support;
	}

	public String getManagerInfo() {
		return managerInfo;
	}

	public void setManagerInfo(String managerInfo) {
		this.managerInfo = managerInfo;
	}

	public String getOperState() {
		return operState;
	}

	public void setOperState(String operState) {
		this.operState = operState;
	}

	public String getGisuName() {
		return gisuName;
	}

	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getPageURL() {
		return pageURL;
	}

	public void setPageURL(String pageURL) {
		this.pageURL = pageURL;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCurriName() {
		return curriName;
	}

	public void setCurriName(String curriName) {
		this.curriName = curriName;
	}

	public List<TestDateVo> getTestDateList() {
		return testDateList;
	}

	public void setTestDateList(List<TestDateVo> testDateList) {
		this.testDateList = testDateList;
	}

	@Override
	public String toString() {
		return "ClassVo [class_id=" + class_id + ", classCate_id=" + classCate_id + ", curri_id=" + curri_id + ", className=" + className + ", startDate=" + startDate + ", endDate=" + endDate + ", lectureTime=" + lectureTime + ", maxCnt=" + maxCnt + ", price=" + price + ", support=" + support + ", managerInfo="
				+ managerInfo + ", operState=" + operState + ", gisuName=" + gisuName + ", classCode=" + classCode + ", pageURL=" + pageURL + ", cateName=" + cateName + ", curriName=" + curriName + ", testDateList=" + testDateList + "]";
	}

}
