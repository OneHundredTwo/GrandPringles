package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Clause {
	private int grndNo, grndNum, num;
	//grndNo-���쉶 NO , grndNum-���쉶 �쉶李�
	private String title, content, isNecessary;
	//title - �빟愿��씠由�, content- �빟愿��궡�슜, isNecessary-�븘�닔�궗�빆
	private Date regDate;
	
	
	public Clause() {
		// TODO Auto-generated constructor stub
	}

	
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getIsNecessary() {
		return isNecessary;
	}


	public void setIsNecessary(String isNecessary) {
		this.isNecessary = isNecessary;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
