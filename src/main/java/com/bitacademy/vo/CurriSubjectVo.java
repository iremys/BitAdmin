package com.bitacademy.vo;

public class CurriSubjectVo {

	private int curriSubject_id;
	private int curriStep_id;
	private int subject_id;
	private int subjectTime;
	private int stepInOrder;

	private String subjectName;
	private String subjectDesc;
	
	private int curri_id;

	public CurriSubjectVo() {
	}

	public CurriSubjectVo(int curriSubject_id, int curriStep_id, int subject_id, int subjectTime, int stepInOrder, String subjectName, String subjectDesc, int curri_id) {
		this.curriSubject_id = curriSubject_id;
		this.curriStep_id = curriStep_id;
		this.subject_id = subject_id;
		this.subjectTime = subjectTime;
		this.stepInOrder = stepInOrder;
		this.subjectName = subjectName;
		this.subjectDesc = subjectDesc;
		this.curri_id = curri_id;
	}

	public int getCurriSubject_id() {
		return curriSubject_id;
	}

	public void setCurriSubject_id(int curriSubject_id) {
		this.curriSubject_id = curriSubject_id;
	}

	public int getCurriStep_id() {
		return curriStep_id;
	}

	public void setCurriStep_id(int curriStep_id) {
		this.curriStep_id = curriStep_id;
	}

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public int getSubjectTime() {
		return subjectTime;
	}

	public void setSubjectTime(int subjectTime) {
		this.subjectTime = subjectTime;
	}

	public int getStepInOrder() {
		return stepInOrder;
	}

	public void setStepInOrder(int stepInOrder) {
		this.stepInOrder = stepInOrder;
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

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	@Override
	public String toString() {
		return "CurriSubjectVo [curriSubject_id=" + curriSubject_id + ", curriStep_id=" + curriStep_id + ", subject_id=" + subject_id + ", subjectTime=" + subjectTime + ", stepInOrder=" + stepInOrder + ", subjectName=" + subjectName + ", subjectDesc=" + subjectDesc + ", curri_id=" + curri_id + "]";
	}

}
