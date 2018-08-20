package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Participation {
	//李멸��옄
	
	private int  grndNo, userNo, grndNum ,rank;
	//���쉶 踰덊샇, �궗�슜�옄踰덊샇, ���쉶�쉶李�, �닚�쐞
	private String status, userNickname;
	//�긽�깭(W嫄곗젅 C�듅�씤 嫄곗젅 delete)
	private Date regDate;

	
	public Participation() {
		// TODO Auto-generated constructor stub
	}
	
	


	public String getUserNickname() {
		return userNickname;
	}




	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}




	public int getGrndNo() {
		return grndNo;
	}


	public void setGrndNo(int grndNo) {
		this.grndNo = grndNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getGrndNum() {
		return grndNum;
	}


	public void setGrndNum(int grndNum) {
		this.grndNum = grndNum;
	}


	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
