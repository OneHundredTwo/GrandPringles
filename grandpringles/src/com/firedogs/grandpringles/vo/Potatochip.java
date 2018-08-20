package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Potatochip {
	private int no, userNo, vary, contentId;
	//no - 기본키 , userNo - 유저NO, vary - 입출력내역
	//contentId - 활동ID
	private String type;
	//type 활동타입
	private Date regDate;
	
	
	public Potatochip() {
		// TODO Auto-generated constructor stub
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getVary() {
		return vary;
	}


	public void setVary(int vary) {
		this.vary = vary;
	}


	public int getContentId() {
		return contentId;
	}


	public void setContentId(int contentId) {
		this.contentId = contentId;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
