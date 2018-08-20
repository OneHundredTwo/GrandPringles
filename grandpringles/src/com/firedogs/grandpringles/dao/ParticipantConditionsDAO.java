package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.ParticipantCondition;


public interface ParticipantConditionsDAO {
	
	public boolean insert (ParticipantCondition participantCondition);
	public List<ParticipantCondition> selectList(ParticipantCondition participantCondition);
	
	public List<ParticipantCondition> selectList(Map<String,Object> param); 

}
