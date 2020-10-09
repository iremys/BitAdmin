package com.bitacademy.vo;

public class HIncludeVo {

	private int hInclude_id;
	private int hIncCate_id;
	private String hIncludeName;
	private String hIncludeHtml;
	private int user_no;
	private String regDate;
	private int hIncludeOrder;
	
	public HIncludeVo() {
	}

	public HIncludeVo(int hInclude_id, int hIncCate_id, String hIncludeName, String hIncludeHtml, int user_no, String regDate, int hIncludeOrder) {
		this.hInclude_id = hInclude_id;
		this.hIncCate_id = hIncCate_id;
		this.hIncludeName = hIncludeName;
		this.hIncludeHtml = hIncludeHtml;
		this.user_no = user_no;
		this.regDate = regDate;
		this.hIncludeOrder = hIncludeOrder;
	}

	public int gethInclude_id() {
		return hInclude_id;
	}

	public void sethInclude_id(int hInclude_id) {
		this.hInclude_id = hInclude_id;
	}

	public int gethIncCate_id() {
		return hIncCate_id;
	}

	public void sethIncCate_id(int hIncCate_id) {
		this.hIncCate_id = hIncCate_id;
	}

	public String gethIncludeName() {
		return hIncludeName;
	}

	public void sethIncludeName(String hIncludeName) {
		this.hIncludeName = hIncludeName;
	}

	public String gethIncludeHtml() {
		return hIncludeHtml;
	}

	public void sethIncludeHtml(String hIncludeHtml) {
		this.hIncludeHtml = hIncludeHtml;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int gethIncludeOrder() {
		return hIncludeOrder;
	}

	public void sethIncludeOrder(int hIncludeOrder) {
		this.hIncludeOrder = hIncludeOrder;
	}

	@Override
	public String toString() {
		return "HIncludeVo [hInclude_id=" + hInclude_id + ", hIncCate_id=" + hIncCate_id + ", hIncludeName=" + hIncludeName + ", hIncludeHtml=" + hIncludeHtml + ", user_no=" + user_no + ", regDate=" + regDate + ", hIncludeOrder=" + hIncludeOrder + "]";
	}
	

}
