package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Betting {
		
	private int userNo, corner, boardNo, chips, matchNo;
	//userNo 사용자번호, corner 선택팀번호 ,boardNo - 게시글번호
	//chips 배팅액, matchNo 경기번호
	private Date regDate;
	
	
	
	public Betting() {
		// TODO Auto-generated constructor stub
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getCorner() {
		return corner;
	}



	public void setCorner(int corner) {
		this.corner = corner;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getChips() {
		return chips;
	}



	public void setChips(int chips) {
		this.chips = chips;
	}



	public int getMatchNo() {
		return matchNo;
	}



	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
