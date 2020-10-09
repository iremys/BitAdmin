package com.bitacademy.vo;

public class HContentVo {

	private int hContent_id;
	private int hCate_id;
	private int user_no;
	private int header_id;
	private int aside_id; //hInclude_id
	private String title;
	private String contentHtml;
	private String regDate;

	private String cateName;
	private String asideName; //hIncludeName
	
	
	public HContentVo() {
	}

	public HContentVo(int hContent_id, int hCate_id, int user_no, int header_id, int aside_id, String title, String contentHtml, String regDate, String cateName, String asideName) {
		this.hContent_id = hContent_id;
		this.hCate_id = hCate_id;
		this.user_no = user_no;
		this.header_id = header_id;
		this.aside_id = aside_id;
		this.title = title;
		this.contentHtml = contentHtml;
		this.regDate = regDate;
		this.cateName = cateName;
		this.asideName = asideName;
	}

	public int gethContent_id() {
		return hContent_id;
	}

	public void sethContent_id(int hContent_id) {
		this.hContent_id = hContent_id;
	}

	public int gethCate_id() {
		return hCate_id;
	}

	public void sethCate_id(int hCate_id) {
		this.hCate_id = hCate_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getHeader_id() {
		return header_id;
	}

	public void setHeader_id(int header_id) {
		this.header_id = header_id;
	}

	public int getAside_id() {
		return aside_id;
	}

	public void setAside_id(int aside_id) {
		this.aside_id = aside_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentHtml() {
		return contentHtml;
	}

	public void setContentHtml(String contentHtml) {
		this.contentHtml = contentHtml;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getAsideName() {
		return asideName;
	}

	public void setAsidName(String asideName) {
		this.asideName = asideName;
	}

	@Override
	public String toString() {
		return "HContentVo [hContent_id=" + hContent_id + ", hCate_id=" + hCate_id + ", user_no=" + user_no + ", header_id=" + header_id + ", aside_id=" + aside_id + ", title=" + title + ", contentHtml=" + contentHtml + ", regDate=" + regDate + ", cateName=" + cateName + ", asideName=" + asideName + "]";
	}

}
