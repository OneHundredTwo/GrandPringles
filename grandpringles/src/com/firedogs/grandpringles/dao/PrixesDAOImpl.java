package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Prix;

public class PrixesDAOImpl implements PrixesDAO{
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public boolean insert(Prix prix) {
		// TODO Auto-generated method stub
		return 1==session.insert("prixes.insert",prix);
	}
	
	@Override
	public List<Prix> selectPrixes(int no) {
		// TODO Auto-generated method stub
		return session.selectList("prixes.selectPrixes", no);
	}
	
}
