package com.firedogs.grandpringles.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class AnnounceUpdateLog {
	//대회공지사항 변경이력
	
	private int no, grndNo, grndNum , managerNo;
	//no - 기본키, grndNo - 대회ID, grndNum- 회차
	//managerNo- 관리자ID
	private String content, managerImage, managerName;
     //content  변경내용
	private Timestamp regdate;
	//수정날짜
	
	
	public AnnounceUpdateLog() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}



	public String getManagerImage() {
		return managerImage;
	}




	public void setManagerImage(String managerImage) {
		this.managerImage = managerImage;
	}







	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
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


	public int getManagerNo() {
		return managerNo;
	}


	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}







	public Timestamp getRegdate() {
		return regdate;
	}







	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	
	
	
	

}
