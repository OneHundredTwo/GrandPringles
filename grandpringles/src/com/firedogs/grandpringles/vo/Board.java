package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo, userNo, grndNo, grndNum,
	//boardNo-게시글번호 , userNo-사용자번호 , grndNo 대회번호
	//grndNum 대회회차
	viewCnt, liking,commentCount;
	private Integer matchNo;
	//viewCnt - 조회수, liking 좋아요수, commentCount-댓글갯수
	//matchNo경기번호
	private String content, category, title, isUpdate, nickname,
	red, blue, redName, blueName;
	//content 글내용, category 카테고리(T/M/B/D)
	//title 제목, isUpdate- 수정여부
	private Date lastModified, regDate;
//	/lastModified 최종수정 날짜
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
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


	public int getViewCnt() {
		return viewCnt;
	}


	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	public int getLiking() {
		return liking;
	}


	public void setLiking(int liking) {
		this.liking = liking;
	}


	public int getCommentCount() {
		return commentCount;
	}


	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}


	public Integer getMatchNo() {
		return matchNo;
	}


	public void setMatchNo(Integer matchNo) {
		this.matchNo = matchNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getIsUpdate() {
		return isUpdate;
	}


	public void setIsUpdate(String isUpdate) {
		this.isUpdate = isUpdate;
	}


	public Date getLastModified() {
		return lastModified;
	}


	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getRed() {
		return red;
	}


	public void setRed(String red) {
		this.red = red;
	}


	public String getBlue() {
		return blue;
	}


	public void setBlue(String blue) {
		this.blue = blue;
	}


	public String getRedName() {
		return redName;
	}


	public void setRedName(String redName) {
		this.redName = redName;
	}


	public String getBlueName() {
		return blueName;
	}


	public void setBlueName(String blueName) {
		this.blueName = blueName;
	}
	
	
	
	

}
