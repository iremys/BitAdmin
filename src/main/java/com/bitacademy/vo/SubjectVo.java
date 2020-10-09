package com.bitacademy.vo;

public class SubjectVo {

	private int subject_id;
	private int subjectCate_id;
	private String subjectName;
	private String subjectDesc;
	private String cateName;
	
	
	public SubjectVo() {
	}

	public SubjectVo(int subject_id, int subjectCate_id, String subjectName, String subjectDesc, String cateName) {
		this.subject_id = subject_id;
		this.subjectCate_id = subjectCate_id;
		this.subjectName = subjectName;
		this.subjectDesc = subjectDesc;
		this.cateName = cateName;
	}

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public int getSubjectCate_id() {
		return subjectCate_id;
	}

	public void setSubjectCate_id(int subjectCate_id) {
		this.subjectCate_id = subjectCate_id;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectDesc() {
		return subjectDesc;
	}

	public void setSubjectDesc(String subjectDesc) {
		this.subjectDesc = subjectDesc;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	@Override
	public String toString() {
		return "SubjectVo [subject_id=" + subject_id + ", subjectCate_id=" + subjectCate_id + ", subjectName=" + subjectName + ", subjectDesc=" + subjectDesc + ", cateName=" + cateName + "]";
	}

}
