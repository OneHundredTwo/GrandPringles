package com.firedogs.grandpringles.vo;

import java.sql.Date;

public class User {

		private int no ,potatochip;
		//no - 기본키 , potatochip - 감자칩
		private String email, password,nickname,profile, phone, sex, gameNickname, gameTier;
		//profile 이미지이름 , gameNickname 롤닉네임, gameTier 롤티어
		private Date regDate;
		
		public User() {
			// TODO Auto-generated constructor stub
		}
		public User(String email, String pwd) {
			this.email = email;
			this.password = pwd;
		}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public int getPotatochip() {
			return potatochip;
		}

		public void setPotatochip(int potatochip) {
			this.potatochip = potatochip;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
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

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getSex() {
			return sex;
		}

		public void setSex(String sex) {
			this.sex = sex;
		}

		public String getGameNickname() {
			return gameNickname;
		}

		public void setGameNickname(String gameNickname) {
			this.gameNickname = gameNickname;
		}

		public String getGameTier() {
			return gameTier;
		}

		public void setGameTier(String gameTier) {
			this.gameTier = gameTier;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		
		
}
