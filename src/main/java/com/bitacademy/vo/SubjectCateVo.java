package com.bitacademy.vo;

public class SubjectCateVo {
	
	private int subjectCate_id;
	private String cateName;
	private int parent_id;

	public SubjectCateVo() {
	}

	public SubjectCateVo(int subjectCate_id, String cateName, int parent_id) {
		this.subjectCate_id = subjectCate_id;
		this.cateName = cateName;
		this.parent_id = parent_id;
	}

	public int getSubjectCate_id() {
		return subjectCate_id;
	}

	public void setSubjectCate_id(int subjectCate_id) {
		this.subjectCate_id = subjectCate_id;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	@Override
	public String toString() {
		return "SubjectCateVo [subjectCate_id=" + subjectCate_id + ", cateName=" + cateName + ", parent_id=" + parent_id + "]";
	}

}
