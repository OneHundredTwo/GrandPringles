package com.firedogs.grandpringles.service;

import java.util.List;

import com.firedogs.grandpringles.dao.ParticipantConditionsDAO;
import com.firedogs.grandpringles.vo.ParticipantCondition;

public class ParticipantConditionServiceImpl implements ParticipantConditionService{
	
	private ParticipantConditionsDAO participantConditionDAO;
	
	public void setParticipantConditionDAO(ParticipantConditionsDAO participantConditionDAO) {
		this.participantConditionDAO = participantConditionDAO;
	}
	
	@Override
	public boolean addCondition(ParticipantCondition participantCondition) {
		// TODO Auto-generated method stub
		return participantConditionDAO.insert(participantCondition);
	}

	
	@Override
	public List<ParticipantCondition> getParticipantCondition(ParticipantCondition participantCondition) {
		// TODO Auto-generated method stub
		return participantConditionDAO.selectList(participantCondition);
	}
}
