package com.firedogs.grandpringles.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindingResult;

import com.firedogs.grandpringles.fileupload.MultiImageUpload;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;

public interface ParticipationsService {
	
	public Participation applicationTF(Participation participation);
	public boolean participationAdd(Grandprix grandprix ,String[] content ,String[] imageTF, MultiImageUpload paticipationImage  ,Participation participation,
			String uploadPath,String applicationPath);
	public Boolean participationRemove(Grandprix grandprix , ParticipantCondition participantCondition ,Participation participation);

}
