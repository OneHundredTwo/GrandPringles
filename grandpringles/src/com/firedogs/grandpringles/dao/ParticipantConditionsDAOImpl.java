package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.ParticipantCondition;

public class ParticipantConditionsDAOImpl implements ParticipantConditionsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public boolean insert(ParticipantCondition participantCondition) {
		// TODO Auto-generated method stub
		return 1==session.insert("participant_conditions.insert",participantCondition);
	}
	
	@Override
	public List<ParticipantCondition> selectList(ParticipantCondition participantCondition) {
		// TODO Auto-generated method stub
		return session.selectList("participant_conditions.conditionList", participantCondition);
	}
	public List<ParticipantCondition> selectList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("participant_conditions.selectList", param);
	}

	
	
}
