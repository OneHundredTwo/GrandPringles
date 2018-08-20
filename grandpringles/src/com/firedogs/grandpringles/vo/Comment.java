package com.firedogs.grandpringles.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Comment {
	// 댓글

	private int no, userNo, boardNo, liking;
	// no 댓글번호, userNo 사용자번호
	// boardNo 게시판 번호, liking 좋아요수
	// profile, nickname 추가
	private String content, profile, nickname;
	// 내용
	private Timestamp regDate;
	private Calendar cal;
	
	
	public Comment() {
		cal = Calendar.getInstance();
		// TODO Auto-generated constructor stub
	}
	
	public int getYear() {
		return cal.get(Calendar.YEAR);
	}
	
	public int getMonth() {
		return cal.get(Calendar.MONTH)+1;
	}
	
	public int getDate() {
		return cal.get(Calendar.DATE);
	}
	
	public int getHour() {
		return cal.get(Calendar.HOUR);
	}
	
	public int getMinute() {
		return cal.get(Calendar.MINUTE);
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


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getLiking() {
		return liking;
	}


	public void setLiking(int liking) {
		this.liking = liking;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public Timestamp getRegDate() {
		return regDate;
	}

	public String getRegDateStr() {
		
		return String.format("%d-%02d-%02d %02d:%02d", this.getYear(), this.getMonth(), this.getDate(), this.getHour(), this.getMinute());
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
		cal.setTime(regDate);
	}


	
}