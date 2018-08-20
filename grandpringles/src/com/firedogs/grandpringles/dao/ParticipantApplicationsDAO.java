package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.Participation;

public interface ParticipantApplicationsDAO {
	
	public Grandprix selectAnnounce(Grandprix grandprix);
	public int insert(ParticipantApplication participantApplication);

	public int deleteApply(ParticipantApplication participantApplication );
	public List<ParticipantApplication> selectList(Participation applicant);
}
