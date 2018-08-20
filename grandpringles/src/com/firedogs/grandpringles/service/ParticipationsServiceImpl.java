package com.firedogs.grandpringles.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.dao.GrandprixesDAO;
import com.firedogs.grandpringles.dao.ParticipantApplicationsDAO;
import com.firedogs.grandpringles.dao.ParticipationsDAO;
import com.firedogs.grandpringles.fileupload.MultiImageUpload;
import com.firedogs.grandpringles.util.ResizeImageUtil;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;

public class ParticipationsServiceImpl implements ParticipationsService{
	
	
	private ParticipationsDAO participationsDAO;
	private GrandprixesDAO grandprixesDAO;
	private ParticipantApplicationsDAO participantApplicationsDAO;
	
	
	public void setParticipationsDAO(ParticipationsDAO participationsDAO) {
		this.participationsDAO = participationsDAO;
	}
	
	public void setGrandprixesDAO(GrandprixesDAO grandprixesDAO) {
		this.grandprixesDAO = grandprixesDAO;
	}
	public void setParticipantApplicationsDAO(ParticipantApplicationsDAO participantApplicationsDAO) {
		this.participantApplicationsDAO = participantApplicationsDAO;
	}
	
	@Override
	public Participation applicationTF(Participation participation) {
		// TODO Auto-generated method stub
		return participationsDAO.selectApplication(participation);
	}

	@Transactional
	@Override
	public boolean participationAdd(Grandprix grandprix ,String[] content ,String[] imageTF, MultiImageUpload paticipationImage  ,Participation participation,
			String uploadPath,String applicationPath) {
		// TODO Auto-generated method stub
		
		
		ParticipantApplication participantApplication = new ParticipantApplication();
		participantApplication.setUserNo(grandprix.getOwnerNo());
		participantApplication.setGrndNo(grandprix.getGrndNo());
		participantApplication.setGrndNum(grandprix.getNum());
		//참가자 테이블에 등록하기

		participation.setUserNo(grandprix.getOwnerNo());
		participation.setGrndNum(grandprix.getNum());

		//참가인원 업데이트 +1
		grandprix.setNumberOfParticipant(grandprixesDAO.selectNumberOfParticipant(grandprix)+1);
		grandprixesDAO.updateNumberOfParticipant(grandprix);

		
		
		//imgae 다중업로드
		MultipartFile[] upload = paticipationImage.getUpload();
		int count=0;

		
		//-------------------------이미지 업로드-------------------------
		for(int i=0; i<content.length; i++) {
			//참가자 질문내용
			participantApplication.setContent(content[i]);
			participantApplication.setNum(i+1);
			if(imageTF[i].equals("T")) {
				UUID uuid = UUID.randomUUID();
				String fileName = upload[i-count].getOriginalFilename();
				System.out.println(fileName);
				int dotIdx = fileName.lastIndexOf(".");
				fileName = fileName.substring(
						dotIdx, 
						fileName.length());
				
				//랜덤한 이름과 합치기
				fileName = uuid+fileName;
				System.out.println("fileName:"+fileName);
				File file = new File(uploadPath+fileName);
				
				try {
					//업로드 처리
					upload[i-count].transferTo(file);
					
					//업로드폴더의 원본을
					//profile폴더로 썸네일 만들기
					ResizeImageUtil.resize(
							uploadPath+fileName, 
							applicationPath+fileName,
							120);
				
					//아이돌 이미지 이름을 세팅

					//mania.setProfile(fileName);
					participantApplication.setImage(fileName);
					//참가신청내용기입

					participantApplicationsDAO.insert(participantApplication);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
	
				
			}else {
				participantApplication.setImage(null);
	
				participantApplicationsDAO.insert(participantApplication);
				count+=1;
			}
				
		}
		participationsDAO.insert(participation);
		
		
		
		return true;
	}
	
	@Transactional
	@Override
	public Boolean participationRemove(Grandprix grandprix , ParticipantCondition participantCondition ,Participation participation) {
		// TODO Auto-generated method stub
		
		//참가자 테이블에서 삭제
		participation.setUserNo(grandprix.getOwnerNo());
		participation.setGrndNum(grandprix.getNum());
		participationsDAO.delete(participation);
		
		//참가자 질문내용 지우기
		ParticipantApplication participantApplication = new ParticipantApplication();
		participantApplication.setUserNo(grandprix.getOwnerNo());
		participantApplication.setGrndNo(grandprix.getGrndNo());
		participantApplication.setGrndNum(grandprix.getNum());
		participantApplicationsDAO.deleteApply(participantApplication);
		//대회인원 -1
		grandprix.setNumberOfParticipant(grandprixesDAO.selectNumberOfParticipant(grandprix)-1);
		grandprixesDAO.updateNumberOfParticipant(grandprix);
		
		return true;
	}
}
