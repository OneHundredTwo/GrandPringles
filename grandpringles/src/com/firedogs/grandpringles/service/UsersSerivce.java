package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.vo.User;

public interface UsersSerivce {

	
	public User login(User user);
	public User selectSearchManager(String nickname); 
	public boolean register(User user);
	public int updateChips(User user);
}
