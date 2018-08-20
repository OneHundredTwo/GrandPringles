package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Grandprix;

public class GrandprixesDAOImpl implements GrandprixesDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	
	@Override
	public Grandprix selectGrandprixesNo(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectGrandprixesNo", grandprix);
	}
	public Grandprix selectGrandprixesNoM(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectGrandprixesNoM", no);
	}
	@Override
	public boolean insert(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return 1==session.insert("grandprixes.insert",grandprix);
	}
	
	@Override
	public boolean updateNecessary(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return 1==session.update("grandprixes.updateNecessary",grandprix);
	}
	
	@Override
	public boolean updateParticipant(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return 1==session.update("grandprixes.updateParticipant",grandprix);
	}
	
	@Override
	public boolean updateMethod(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return 1==session.update("grandprixes.updateMethod",grandprix);
	}
	
	@Override
	public boolean updateComplete(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return 1==session.update("grandprixes.updateComplete",grandprix);
	}
	
	@Override
	public Grandprix selectAnnounceList(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectAnnounceList",grandprix);
	}
	
	
	@Override
	public int updateNumberOfParticipant(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.update("grandprixes.updateNumberOfParticipant", grandprix);
	}
	
	public int updatePresentParts(Grandprix grandpirx) {
		return session.update("grandprixes.updatePresentParts", grandpirx);
	}
	
	@Override
	public int selectNumberOfParticipant(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectNumberOfParticipant",grandprix);
	}
	public List<Grandprix> selectRecentGrandprixesList() {
		// TODO Auto-generated method stub
		return session.selectList("grandprixes.selectRecentGrandprixesList");
	}
	
	@Override
	public Grandprix selecRecentGrnd(int grndNo) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selecRecentGrnd", grndNo);
	}
	
	@Override
	public Grandprix selectOne(Grandprix grndInfo) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectOne", grndInfo);
	}
	
	@Override
	public int updateMaxparticipant(Grandprix grndInfo) {
		// TODO Auto-generated method stub
		return session.update("grandprixes.updateMaxparticipant", grndInfo);
	}
	

}
