package com.bitacademy.vo;

public class HCateVo {
	private int hCate_id;
	private String cateName;
	private int parent_id;
	private int cateOrder;
	
	public HCateVo() {
	}


	public HCateVo(int hCate_id, String cateName, int parent_id, int cateOrder) {
		this.hCate_id = hCate_id;
		this.cateName = cateName;
		this.parent_id = parent_id;
		this.cateOrder = cateOrder;
	}


	public int gethCate_id() {
		return hCate_id;
	}


	public void sethCate_id(int hCate_id) {
		this.hCate_id = hCate_id;
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


	public int getCateOrder() {
		return cateOrder;
	}


	public void setCateOrder(int cateOrder) {
		this.cateOrder = cateOrder;
	}


	@Override
	public String toString() {
		return "HCateVo [hCate_id=" + hCate_id + ", cateName=" + cateName + ", parent_id=" + parent_id + ", cateOrder=" + cateOrder + "]";
	}
	
}
