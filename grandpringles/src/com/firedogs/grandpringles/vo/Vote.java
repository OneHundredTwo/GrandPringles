package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Vote {
	
	private int boardNo, num, selections;
	//boardNo-게시판id , num- 항목번허, selections- 득표수
	private String title;
	//title 제목
	private Date regDate;
	
	public Vote() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSelections() {
		return selections;
	}

	public void setSelections(int selections) {
		this.selections = selections;
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
