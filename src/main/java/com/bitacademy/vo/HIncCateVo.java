package com.bitacademy.vo;

public class HIncCateVo {

	private int hIncCate_id;
	private String cateName;
	private int parent_id;
	private int cateOrder;

	public HIncCateVo() {
	}

	public HIncCateVo(int hIncCate_id, String cateName, int parent_id, int cateOrder) {
		this.hIncCate_id = hIncCate_id;
		this.cateName = cateName;
		this.parent_id = parent_id;
		this.cateOrder = cateOrder;
	}

	public int gethIncCate_id() {
		return hIncCate_id;
	}

	public void sethIncCate_id(int hIncCate_id) {
		this.hIncCate_id = hIncCate_id;
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
		return "HIncCateVo [hIncCate_id=" + hIncCate_id + ", cateName=" + cateName + ", parent_id=" + parent_id + ", cateOrder=" + cateOrder + "]";
	}

}
