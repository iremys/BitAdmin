package com.bitacademy.vo;

public class JSONResult {

	private String result; // "success" or "fail"
	private String failMsg;; // result가 "fail" 일 때  원인
	private Object data; // result가 "succes" 일 때  전달해야 할 데이터 객체

	/*실패일때 사용함수*/
	public static JSONResult error( String failMsg ) {
		return new JSONResult( false, null, failMsg );
	}
	
	/*성공일때 사용함수*/
	public static JSONResult success( Object data ) {
		return new JSONResult( true, data, null );
	}

	private JSONResult() {
	}
	
	private JSONResult( boolean isSuccess, Object data, String message ) {
		result = isSuccess ? "success" : "fail";
		this.data = data;
		this.failMsg = message;
	}

	public String getResult() {
		return result;
	}

	public String getFailMsg() {
		return failMsg;
	}

	public Object getData() {
		return data;
	}

	@Override
	public String toString() {
		return "JSONResult [result=" + result + ", failMsg=" + failMsg + ", data=" + data + "]";
	}

}
