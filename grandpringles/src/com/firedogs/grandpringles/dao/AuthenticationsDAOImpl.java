package com.firedogs.grandpringles.dao;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Authentication;

public class AuthenticationsDAOImpl implements AuthenticationsDAO {

	
private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
		public int insertCode(Authentication authentication) {
			return session.insert("authentications.insertAuthentications",authentication);
		}
	
	@Override
		public int selectCode(Authentication authentication) {
			return session.selectOne("authentications.selectListCode",authentication);
		}
	
	
}
