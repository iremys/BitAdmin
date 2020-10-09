package com.bitacademy.vo;

import java.util.List;

public class CurriStepVo {

	private int curriStep_id;
	private int curri_id;
	private String stepName;
	private String stepOrder;

	private List<CurriSubjectVo> curriSubjectList;

	public CurriStepVo() {
	}

	public CurriStepVo(int curriStep_id, int curri_id, String stepName, String stepOrder, List<CurriSubjectVo> curriSubjectList) {
		this.curriStep_id = curriStep_id;
		this.curri_id = curri_id;
		this.stepName = stepName;
		this.stepOrder = stepOrder;
		this.curriSubjectList = curriSubjectList;
	}

	public int getCurriStep_id() {
		return curriStep_id;
	}

	public void setCurriStep_id(int curriStep_id) {
		this.curriStep_id = curriStep_id;
	}

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public String getStepOrder() {
		return stepOrder;
	}

	public void setStepOrder(String stepOrder) {
		this.stepOrder = stepOrder;
	}

	public List<CurriSubjectVo> getCurriSubjectList() {
		return curriSubjectList;
	}

	public void setCurriSubjectList(List<CurriSubjectVo> curriSubjectList) {
		this.curriSubjectList = curriSubjectList;
	}

	@Override
	public String toString() {
		return "CurriStepVo [curriStep_id=" + curriStep_id + ", curri_id=" + curri_id + ", stepName=" + stepName + ", stepOrder=" + stepOrder + ", curriSubjectList=" + curriSubjectList + "]";
	}

}
