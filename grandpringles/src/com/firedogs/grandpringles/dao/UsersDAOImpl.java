package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.User;

public class UsersDAOImpl implements UsersDAO{
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectLoginUser",user);
	}
	
	@Override
	public User selectSearchManager(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectSearchManager",nickname);
	}
	
	
//	����̲�
	@Override
	public List<User> selectStreamer(String nickname) {
		// TODO Auto-generated method stub
		return session.selectList("users.selectStreamer",nickname);
	}
	@Override
	public List<User> selectStreamer() {
		// TODO Auto-generated method stub
		return session.selectList("users.selectStreamerDefault");
	}
	
	@Override
	public int join(User user) {
		return session.insert("users.insertUser",user);
	}
	
	@Override
	public int updateChips(User user) {
		// TODO Auto-generated method stub
		return session.update("users.updateChips", user);
	}
	
}
