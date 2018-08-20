package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class ParticipantApplication {
	//참가신청응답내용
	
	private int userNo, grndNo, num, grndNum;
	//사용자번호, 대회번호, 
	//num - 항목번호
	//grndNum 대회회차
	private String image, content;
	//이미지 내용
	private Date regDate;
	
	
	public ParticipantApplication() {
		// TODO Auto-generated constructor stub
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getGrndNo() {
		return grndNo;
	}
	public void setGrndNo(int grndNo) {
		this.grndNo = grndNo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGrndNum() {
		return grndNum;
	}
	public void setGrndNum(int grndNum) {
		this.grndNum = grndNum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	
	

}
