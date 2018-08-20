package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class TeamMember {
	//���썝
	
	private int grndNo, grndNum , leaderNo, memberNo;
	//���쉶踰덊샇 , ���쉶�쉶李�, ���옣踰덊샇, ���썝踰덊샇\
	private String nickname;
	private Date regDate;
	
	
	public TeamMember() {
		// TODO Auto-generated constructor stub
	}

	
	

	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
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


	public int getLeaderNo() {
		return leaderNo;
	}


	public void setLeaderNo(int leaderNo) {
		this.leaderNo = leaderNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

}
