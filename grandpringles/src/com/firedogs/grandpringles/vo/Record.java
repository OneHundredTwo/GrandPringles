package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Record {
	private int matchNo , seq, userNo, kill, death, assi;
	//matchNo-경기번호, seq-시퀀스,  userNo-참가자ID, 
	//킬 데스 어시
	private Date regdate;
	
	
	public Record() {
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


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getKill() {
		return kill;
	}


	public void setKill(int kill) {
		this.kill = kill;
	}


	public int getDeath() {
		return death;
	}


	public void setDeath(int death) {
		this.death = death;
	}


	public int getAssi() {
		return assi;
	}


	public void setAssi(int assi) {
		this.assi = assi;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
