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
		//������ ���̺� ����ϱ�

		participation.setUserNo(grandprix.getOwnerNo());
		participation.setGrndNum(grandprix.getNum());

		//�����ο� ������Ʈ +1
		grandprix.setNumberOfParticipant(grandprixesDAO.selectNumberOfParticipant(grandprix)+1);
		grandprixesDAO.updateNumberOfParticipant(grandprix);

		
		
		//imgae ���߾��ε�
		MultipartFile[] upload = paticipationImage.getUpload();
		int count=0;

		
		//-------------------------�̹��� ���ε�-------------------------
		for(int i=0; i<content.length; i++) {
			//������ ��������
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
				
				//������ �̸��� ��ġ��
				fileName = uuid+fileName;
				System.out.println("fileName:"+fileName);
				File file = new File(uploadPath+fileName);
				
				try {
					//���ε� ó��
					upload[i-count].transferTo(file);
					
					//���ε������� ������
					//profile������ ����� �����
					ResizeImageUtil.resize(
							uploadPath+fileName, 
							applicationPath+fileName,
							120);
				
					//���̵� �̹��� �̸��� ����

					//mania.setProfile(fileName);
					participantApplication.setImage(fileName);
					//������û�������

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
		
		//������ ���̺��� ����
		participation.setUserNo(grandprix.getOwnerNo());
		participation.setGrndNum(grandprix.getNum());
		participationsDAO.delete(participation);
		
		//������ �������� �����
		ParticipantApplication participantApplication = new ParticipantApplication();
		participantApplication.setUserNo(grandprix.getOwnerNo());
		participantApplication.setGrndNo(grandprix.getGrndNo());
		participantApplication.setGrndNum(grandprix.getNum());
		participantApplicationsDAO.deleteApply(participantApplication);
		//��ȸ�ο� -1
		grandprix.setNumberOfParticipant(grandprixesDAO.selectNumberOfParticipant(grandprix)-1);
		grandprixesDAO.updateNumberOfParticipant(grandprix);
		
		return true;
	}
}
