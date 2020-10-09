package com.bitacademy.vo;

import java.util.List;

public class CurriVo {

	private int curri_id;
	private int curriCate_id;
	private String curriName;
	private String goal;
	private String content;
	private String target;
	private int totalTime;
	private String cateName;
	
	private List<CurriStepVo> curriStepList;
	
	public CurriVo() {
	}

	public CurriVo(int curri_id, int curriCate_id, String curriName, String goal, String content, String target, int totalTime, String cateName, List<CurriStepVo> curriStepList) {
		this.curri_id = curri_id;
		this.curriCate_id = curriCate_id;
		this.curriName = curriName;
		this.goal = goal;
		this.content = content;
		this.target = target;
		this.totalTime = totalTime;
		this.cateName = cateName;
		this.curriStepList = curriStepList;
	}

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	public int getCurriCate_id() {
		return curriCate_id;
	}

	public void setCurriCate_id(int curriCate_id) {
		this.curriCate_id = curriCate_id;
	}

	public String getCurriName() {
		return curriName;
	}

	public void setCurriName(String curriName) {
		this.curriName = curriName;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public List<CurriStepVo> getCurriStepList() {
		return curriStepList;
	}

	public void setCurriStepList(List<CurriStepVo> curriStepList) {
		this.curriStepList = curriStepList;
	}

	@Override
	public String toString() {
		return "CurriVo [curri_id=" + curri_id + ", curriCate_id=" + curriCate_id + ", curriName=" + curriName + ", goal=" + goal + ", content=" + content + ", target=" + target + ", totalTime=" + totalTime + ", cateName=" + cateName + ", curriStepList=" + curriStepList + "]";
	}

}
