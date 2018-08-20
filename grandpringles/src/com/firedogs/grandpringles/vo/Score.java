package com.firedogs.grandpringles.vo;

public class Score {
	private int no, rank, total, win;
	private String nickname, profile;
	private double kill, death, assi, KDA, rate;	

	public Score() {
		
	}

	public int getNo() {
		return no;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public double getKill() {
		return kill;
	}

	public void setKill(double kill) {
		this.kill = kill;
	}

	public double getDeath() {
		return death;
	}

	public void setDeath(double death) {
		this.death = death;
	}

	public double getAssi() {
		return assi;
	}

	public void setAssi(double assi) {
		this.assi = assi;
	}

	public double getKDA() {
		return KDA;
	}

	public void setKDA(double kill, double death, double assi) {
		// 소수 2번째 자리에서 반올림
		this.KDA = (int)((kill+assi)/death*100);
		
	}

	public double getRate() {
		return rate;
	}

	public void setRate(int total, int win) {
		// 반올림하여 %로 나타낸다.
		this.rate = (int)((double)win/total*1000);
	}
	
	
	
}

