package com.firedogs.grandpringles.vo;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Match {
		private int no, grndNo, grndNum, round, 
		//no ���NO, grndNo - ��ȸNO, grndNum - ��ȸȸ��
		//round - �ش� ��� ����, red,blue - a,b��
		matchNumber;
		
		private Integer red, blue;
		//matchNumber - ����ȣ
		private String partType, status, gameStatus;
		//partType-�������� , status-������,gameStatus-���ӻ���
		private String redName, blueName;
		private Date startDate, regDate;
		//startDate �������
		
		public Match() {
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

		public int getGrndNum() {
			return grndNum;
		}

		public void setGrndNum(int grndNum) {
			this.grndNum = grndNum;
		}

		public int getRound() {
			return round;
		}

		public void setRound(int round) {
			this.round = round;
		}
		
		

		public Integer getRed() {
			return red;
		}

		public void setRed(Integer red) {
			this.red = red;
		}

		public Integer getBlue() {
			return blue;
		}

		public void setBlue(Integer blue) {
			this.blue = blue;
		}

		public int getMatchNumber() {
			return matchNumber;
		}

		public void setMatchNumber(int matchNumber) {
			this.matchNumber = matchNumber;
		}

		public String getPartType() {
			return partType;
		}

		public void setPartType(String partType) {
			this.partType = partType;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getGameStatus() {
			return gameStatus;
		}

		public void setGameStatus(String gameStatus) {
			this.gameStatus = gameStatus;
		}

		public Date getStartDate() {
			return startDate;
		}

		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
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

		public String getTimeForm() {
			return new SimpleDateFormat("YYYY-MM-dd HH:mm").format(startDate);
			
		}
		
		public String toString() {
			return "no : "+no+"\n"+
					"grndNo : "+grndNo+"\n"+
					"grndNum : "+grndNum+"\n"+
					"round : "+round+"\n"+
					"matchNumber : "+matchNumber+"\n"+
					"red : "+red+"\n"+
					"blue : "+blue+"\n"+
					"partType : "+partType+"\n"+
					"status : "+status+"\n"+
					"gameStatus : "+gameStatus+"\n"+
					"startDate : "+startDate+"\n"+
					"regDate : "+regDate;
					
		}
		
		
		
		
}
