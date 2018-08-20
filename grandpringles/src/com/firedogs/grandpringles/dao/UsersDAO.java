package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.User;

public interface UsersDAO {
	
	public User login(User user);
	public User selectSearchManager(String nickname);
	
//	����̲�
	public List<User> selectStreamer(String nickname);
	public List<User> selectStreamer();
//	형꺼
	public int join(User user);	

	// 민호꺼
	public int updateChips(User user);

}
