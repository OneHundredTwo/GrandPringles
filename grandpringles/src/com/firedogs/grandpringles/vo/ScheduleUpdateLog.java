package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class ScheduleUpdateLog {
	
	private int no, grndNo, num , managerNo,category;
	//no- 기본키, grndNo - 대회id, num -대회 회차
	//managerNo - 관리자Id
	//카테고리
	private Date regDate, startDate, endDate;
	//regDate 수정날짜 , startDate 대회시작날짜 ,endDate 대회종료날짜
	
	public ScheduleUpdateLog() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGrndNo() {
		return grndNo;
	}

	public void setGrndNo(int grndNo) {
		this.grndNo = grndNo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


}
