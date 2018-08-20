package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Discussion {
	
	private int userNo, selection, boardNo;
	//userNo -유저번호, selection-항목번호,boardNo-게시판번호 
	private Date regDate;
	
	public Discussion() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSelection() {
		return selection;
	}

	public void setSelection(int selection) {
		this.selection = selection;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	

}
