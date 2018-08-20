package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Manager {
	//관리자
	
	private int grndNo, grndNum , adminNo;
	//대회번호, 대회회차, 관리자번호(사용자번호)
	private Date regDate;
	
	
	public Manager() {
		// TODO Auto-generated constructor stub
	}


	public int getGrndNo() {
		return grndNo;
	}


	public void setGrndNo(int grndNo) {
		this.grndNo = grndNo;
	}


	public int getGrndNum() {
		return grndNum;
	}


	public void setGrndNum(int grndNum) {
		this.grndNum = grndNum;
	}


	public int getAdminNo() {
		return adminNo;
	}


	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
