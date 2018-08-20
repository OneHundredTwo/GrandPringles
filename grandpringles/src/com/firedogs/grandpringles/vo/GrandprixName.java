package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class GrandprixName {
	//대회목록
	
	private int no, ownerNo, liking;
	//대회No(여기가 기본키), owerNo 개최자번호, 
	//liking 좋아요수
	private String title;
	//title 대회제목
	private Date regDate;
	
	public GrandprixName() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public int getLiking() {
		return liking;
	}

	public void setLiking(int liking) {
		this.liking = liking;
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
