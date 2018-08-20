package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.ParticipantApplicationsDAO;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantApplication;

public class ParticipantApplicationsServiceImpl implements ParticipantApplicationsService{
	
	
	private ParticipantApplicationsDAO applicationsDAO;
	
	public void setApplicationsDAO(ParticipantApplicationsDAO applicationsDAO) {
		this.applicationsDAO = applicationsDAO;
	}
	
	@Override
	public Grandprix getAnnounce(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return applicationsDAO.selectAnnounce(grandprix);
	}
	


}
