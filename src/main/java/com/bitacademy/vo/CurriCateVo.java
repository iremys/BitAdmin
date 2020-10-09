package com.bitacademy.vo;

public class CurriCateVo {
	
	private int curriCate_id;
	private String cateName;
	private int parent_id;
	
	public CurriCateVo() {
	}

	public CurriCateVo(int curriCate_id, String cateName, int parent_id) {
		this.curriCate_id = curriCate_id;
		this.cateName = cateName;
		this.parent_id = parent_id;
	}

	public int getCurriCate_id() {
		return curriCate_id;
	}

	public void setCurriCate_id(int curriCate_id) {
		this.curriCate_id = curriCate_id;
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
		return "CurriCateVo [curriCate_id=" + curriCate_id + ", cateName=" + cateName + ", parent_id=" + parent_id + "]";
	}

}
