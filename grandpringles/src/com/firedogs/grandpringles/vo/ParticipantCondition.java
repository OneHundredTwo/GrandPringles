package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class ParticipantCondition {
	//참가신청조건
	
	private int grndNo, grndNum, num ;
	//grndNo-대회번호, grndNum- 대회회차, num- 항목번호
	private String isImage, isNecessary,title;
	//isImage- 이미지 여부, isNecessary- 필수여부 , title- 제목
	private Date regDate;
	
	
	public ParticipantCondition() {
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


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getIsImage() {
		return isImage;
	}


	public void setIsImage(String isImage) {
		this.isImage = isImage;
	}


	public String getIsNecessary() {
		return isNecessary;
	}


	public void setIsNecessary(String isNecessary) {
		this.isNecessary = isNecessary;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
