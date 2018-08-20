package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Game {
	private int matchNo, seq, winnerNo;
	//matchNo - 경기번호, seq - 시퀸스 , 
	// winnerNo- 승리팀
	private Date regDate;
	
	public Game() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getWinnerNo() {
		return winnerNo;
	}
	public void setWinnerNo(int winnerNo) {
		this.winnerNo = winnerNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
