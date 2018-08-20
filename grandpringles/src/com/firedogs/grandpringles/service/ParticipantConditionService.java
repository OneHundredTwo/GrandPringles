package com.firedogs.grandpringles.service;

import java.util.List;

import com.firedogs.grandpringles.vo.ParticipantCondition;

public interface ParticipantConditionService {
	
	public boolean addCondition(ParticipantCondition participantCondition);
	public List<ParticipantCondition> getParticipantCondition(ParticipantCondition participantCondition);

}
