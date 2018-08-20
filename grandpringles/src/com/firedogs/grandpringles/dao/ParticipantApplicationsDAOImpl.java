package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.Participation;

public class ParticipantApplicationsDAOImpl implements ParticipantApplicationsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public Grandprix selectAnnounce(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectOne("grandprixes.selectAnnounceList",grandprix);
	}
	
	
	@Override
	public int insert(ParticipantApplication participantApplication) {
		// TODO Auto-generated method stub
		return session.insert("participant_applications.insert",participantApplication);
	}
	
	@Override
	public int deleteApply(ParticipantApplication participantApplication) {
		// TODO Auto-generated method stub
		return session.delete("participant_applications.delete",participantApplication);
	}
	
//	±â¿øÀÌ²¨
	public List<ParticipantApplication> selectList(Participation applicant) {
		// TODO Auto-generated method stub
		return session.selectList("participant_applications.selectList", applicant);
	}
}
