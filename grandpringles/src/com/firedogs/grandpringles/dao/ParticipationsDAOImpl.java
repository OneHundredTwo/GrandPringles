package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Participation;

public class ParticipationsDAOImpl implements ParticipationsDAO {

	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public int insert(Participation participation) {
		// TODO Auto-generated method stub
		return session.insert("participations.insertParticipation",participation);
	}
	
	@Override
	public Participation selectApplication(Participation participation) {
		// TODO Auto-generated method stub
		return session.selectOne("participations.selectApplication",participation);
	}
	
	@Override
	public int delete(Participation participation) {
		// TODO Auto-generated method stub
		return session.delete("participations.delete",participation);
	}
	
	
	public List<Participation> selectApplyList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("participations.selectApplyList",param);
	}
	@Override
	public int selectTotal(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("participations.selectGrndTotal",param);
	}
	
	@Override
	public int updateStatus(Participation partInfo) {
		// TODO Auto-generated method stub
		return session.update("participations.updateStatus", partInfo);
	}
	
	@Override
	public int delete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.delete("participations.deleteAsUserNoList", param);
	}
	
	@Override
	public int updateRank(Participation part) {
		// TODO Auto-generated method stub
		return session.update("participations.updateRank", part);
	}
	
	
}
