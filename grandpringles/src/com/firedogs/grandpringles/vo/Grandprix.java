package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class Grandprix {
	private int grndNo, num, ownerNo, membersPerTeam, 
//	grndNo ���쉶湲곕낯�궎, num �쉶李�(�뿰�냽�꽦), ownerNo 媛쒖턀�옄 �븘�씠�뵒,  membersPerTeam �븳���떦 紐뉖챸
	maxParticipant, waitParticipant, numberOfParticipant, winner;
	//maxParticipant 理쒕�李멸��씤�썝 , waitParicipant ��湲곗씤�썝, numberOfParticipant ���쉶 李멸��씤�썝,  winner �슦�듅�옄
	
	private String participantAnnounce, partType, 
	// participantAnnounce-李멸��옄怨듭��궗�빆 ,partType 李멸��쑀�삎(��,媛쒖씤), 
	isShowParticipant , isWantedParticipant , isApplication,
	//isShowParticipant - 李멸��옄 怨듦컻�뿬遺� , isWantedParticipant - 李멸��옄 紐⑥쭛�뿬遺�, isApplication - 李멸��옄 �젒�닔�뿬遺�
	channelId, intro, rule, isShow ,image, type, seedingType,
	//channelId �듃�쐞移섏콈�꼸id , intro-���쉶�냼媛�, isShow-���쉶怨듦컻�뿬遺� ,image-���쉶�씠誘몄�, type-���쉶�쑀�삎, seedingType-�떆�뱶諛⑹떇
	status;
	//status-���쉶�긽�깭
	
	
	private Date startDate, endDate, endDateApplication, 
	//startDate-���쉶�떆�옉�떆媛�, endDate-���쉶醫낅즺�궇吏� , endDateApplication- �젒�닔留덇컧�씪
	regDate;
	//�벑濡앹씪

	public Grandprix() {
		// TODO Auto-generated constructor stub
	}
	
	

	
	public int getWaitParticipant() {
		return waitParticipant;
	}




	public void setWaitParticipant(int waitParticipant) {
		this.waitParticipant = waitParticipant;
	}




	public Grandprix(int grndNo, int num) {
		this.grndNo = grndNo;
		this.num = num;
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

	public int getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}

	public int getMembersPerTeam() {
		return membersPerTeam;
	}

	public void setMembersPerTeam(int membersPerTeam) {
		this.membersPerTeam = membersPerTeam;
	}

	public int getMaxParticipant() {
		return maxParticipant;
	}

	public void setMaxParticipant(int maxParticipant) {
		this.maxParticipant = maxParticipant;
	}


	public int getNumberOfParticipant() {
		return numberOfParticipant;
	}

	public void setNumberOfParticipant(int numberOfParticipant) {
		this.numberOfParticipant = numberOfParticipant;
	}

	public int getWinner() {
		return winner;
	}

	public void setWinner(int winner) {
		this.winner = winner;
	}

	public String getParticipantAnnounce() {
		return participantAnnounce;
	}

	public void setParticipantAnnounce(String participantAnnounce) {
		this.participantAnnounce = participantAnnounce;
	}

	public String getPartType() {
		return partType;
	}

	public void setPartType(String partType) {
		this.partType = partType;
	}

	public String getIsShowParticipant() {
		return isShowParticipant;
	}

	public void setIsShowParticipant(String isShowParticipant) {
		this.isShowParticipant = isShowParticipant;
	}

	public String getIsWantedParticipant() {
		return isWantedParticipant;
	}

	public void setIsWantedParticipant(String isWantedParticipant) {
		this.isWantedParticipant = isWantedParticipant;
	}

	public String getIsApplication() {
		return isApplication;
	}

	public void setIsApplication(String isApplication) {
		this.isApplication = isApplication;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSeedingType() {
		return seedingType;
	}

	public void setSeedingType(String seedingType) {
		this.seedingType = seedingType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Date getEndDateApplication() {
		return endDateApplication;
	}

	public void setEndDateApplication(Date endDateApplication) {
		this.endDateApplication = endDateApplication;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	

}