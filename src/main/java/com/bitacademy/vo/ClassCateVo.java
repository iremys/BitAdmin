package com.bitacademy.vo;

public class ClassCateVo {

	private int classCate_id;
	private String cateName;
	private int parent_id;

	public ClassCateVo() {
	}

	public ClassCateVo(int classCate_id, String cateName, int parent_id) {
		this.classCate_id = classCate_id;
		this.cateName = cateName;
		this.parent_id = parent_id;
	}

	public int getClassCate_id() {
		return classCate_id;
	}

	public void setClassCate_id(int classCate_id) {
		this.classCate_id = classCate_id;
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
		return "ClassCateVo [classCate_id=" + classCate_id + ", cateName=" + cateName + ", parent_id=" + parent_id + "]";
	}

}
