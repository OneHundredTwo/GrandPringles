package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Team {
	//팀
	private int grndNo, grndNum, leaderNo,password;
	//대회이름, 대회회차, 팀장No, 팀비밀번호
	private String isShow, name, logo;
	//공개여부, 팀이름, 팀로고
	private Date regDate;
	
	public Team() {
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

	public int getLeaderNo() {
		return leaderNo;
	}

	public void setLeaderNo(int leaderNo) {
		this.leaderNo = leaderNo;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

}
