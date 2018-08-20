package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Liking {
		//좋아요
	
	private int no, userNo, contentId;
	//no 좋아요NO ,userNo 사용자번호
	//contentId 활동Id
	private String type;
	//타입(G대회/B게시글/C댓글)
	private Date regDate;
	
	
	public Liking() {
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
