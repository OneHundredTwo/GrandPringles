package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class PrixUpdateLog {
	//상품변경이력
	
	private int no, prixNo, managerNo;
	//변경이력 기본키no, 상푼번호, 관리자번호
	private String toUser,content, url, image;
	//누구에게, 상품내용
	private Date regDate;
	
	public PrixUpdateLog() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrixNo() {
		return prixNo;
	}

	public void setPrixNo(int prixNo) {
		this.prixNo = prixNo;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getToUser() {
		return toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	

}
