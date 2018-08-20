package com.firedogs.grandpringles.dao;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.GrandprixName;

public class GrandprixNamesDAOImpl  implements GrandprixNamesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	
	@Override
	public int selectMax() {
		// TODO Auto-generated method stub
		return session.selectOne("grandprix_names.selectMax");
	}

	
	@Override
	public boolean insert(GrandprixName grandprixName) {
		// TODO Auto-generated method stub
		return 1==session.insert("grandprix_names.insert",grandprixName);
	}
	
	
	@Override
	public boolean updateTitle(GrandprixName grandprixName) {
		// TODO Auto-generated method stub
		return 1==session.update("grandprix_names.updateTitle",grandprixName);
	}
	
	@Override
	public GrandprixName selectName(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprix_names.selectName",no);
	}
	
	
}
