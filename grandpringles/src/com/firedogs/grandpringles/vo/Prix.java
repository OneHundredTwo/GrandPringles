package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Prix {
	//상품
	private int no, grndNo, grndNum;
	//no 상품번호, grndNo 대회번호, grndNum 대회회차
	private String toUser, content, url, image;
	//toUser 누구에게, content 대회내용
	//url ~, image 이미지 이름
	private Date regDate;
	
	
	public Prix() {
		// TODO Auto-generated constructor stub
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


	public String getToUser() {
		return toUser;
	}


	public void setToUser(String toUser) {
		this.toUser = toUser;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	

}
