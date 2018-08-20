package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.UsersDAO;
import com.firedogs.grandpringles.vo.User;

public class UsersSerivceImpl implements UsersSerivce {
	
	UsersDAO usersDAO ;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return usersDAO.login(user);
	}
	
	@Override
	public User selectSearchManager(String nickname) {
		// TODO Auto-generated method stub
		return usersDAO.selectSearchManager(nickname);
	}
	
	@Override
	public boolean register(User user) {
		return 1==usersDAO.join(user);
	}	
	
	@Override
	public int updateChips(User user) {
		// TODO Auto-generated method stub
		return usersDAO.updateChips(user);
	}
}
