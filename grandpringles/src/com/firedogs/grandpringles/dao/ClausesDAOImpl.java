package com.firedogs.grandpringles.dao;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Clause;

public class ClausesDAOImpl implements ClausesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public boolean insert(Clause clause) {
		// TODO Auto-generated method stub
		return 1==session.insert("clauses.insert",clause);
	}

}
