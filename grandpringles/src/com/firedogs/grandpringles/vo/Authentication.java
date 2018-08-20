package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Authentication {
	
	private int key;
	private int code;
	private char isConfirm;
	private Date regDate;
	
	
	public Authentication() {
		// TODO Auto-generated constructor stub
	}
	
	public Authentication(int code, int key, char isConfirm) {
		this.code = code;
		this.key = key;
		this.isConfirm = isConfirm;
		
	}
	
	

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getKey() {
		return key;
	}


	public void setKey(int key) {
		this.key = key;
	}



	public char getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(char isConfirm) {
		this.isConfirm = isConfirm;
	}
	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	

}
