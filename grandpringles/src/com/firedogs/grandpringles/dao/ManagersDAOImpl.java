package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Manager;

public class ManagersDAOImpl  implements ManagersDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public boolean insert(Manager manager) {
		// TODO Auto-generated method stub
		return 1==session.insert("managers.insert",manager);
	}
	
	@Override
	public List<Manager> selectList(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectList("managers.selectList", grandprix);
	}

}
