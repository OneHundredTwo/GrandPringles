package com.firedogs.grandpringles.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.dao.AnnounceUpdateLogsDAO;
import com.firedogs.grandpringles.dao.GrandprixNamesDAO;
import com.firedogs.grandpringles.dao.GrandprixesDAO;
import com.firedogs.grandpringles.dao.ManagersDAO;
import com.firedogs.grandpringles.dao.MatchsDAO;
import com.firedogs.grandpringles.dao.ParticipantConditionsDAO;
import com.firedogs.grandpringles.dao.ParticipationsDAO;
import com.firedogs.grandpringles.dao.PrixesDAO;
import com.firedogs.grandpringles.util.ResizeImageUtil;
import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.Manager;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;
import com.firedogs.grandpringles.vo.Prix;

public class GrandprixesServiceImpl implements GrandprixesService{
	
	private GrandprixesDAO grandprixesDAO;
	private GrandprixNamesDAO grandprixNamesDAO;
	private ManagersDAO managersDAO;
	private PrixesDAO prixesDAO;
	private ParticipantConditionsDAO participantConditionDAO;
	private MatchsDAO matchsDAO;
	private AnnounceUpdateLogsDAO announceUpdateLogsDAO; 
	
	
	public void setGrandprixesDAO(GrandprixesDAO grandprixesDAO) {
		this.grandprixesDAO = grandprixesDAO;
	}
	public void setPrixesDAO(PrixesDAO prixesDAO) {
		this.prixesDAO = prixesDAO;
	}
	public void setParticipantConditionDAO(ParticipantConditionsDAO participantConditionDAO) {
		this.participantConditionDAO = participantConditionDAO;
	}

	public void setGrandprixNamesDAO(GrandprixNamesDAO grandprixNamesDAO) {
		this.grandprixNamesDAO = grandprixNamesDAO;
	}
	public void setManagersDAO(ManagersDAO managersDAO) {
		this.managersDAO = managersDAO;
	}
	public void setMatchsDAO(MatchsDAO matchsDAO) {
		this.matchsDAO = matchsDAO;
	}
	public void setAnnounceUpdateLogsDAO(AnnounceUpdateLogsDAO announceUpdateLogsDAO) {
		this.announceUpdateLogsDAO = announceUpdateLogsDAO;
	}
	
	

	/*-------------------------*/
	

	@Transactional
	@Override
	public boolean makeGrndDetail(Grandprix grandprix) {
		grandprixesDAO.insert(grandprix);
		Manager manager = new Manager();
		manager.setGrndNo(grandprixNamesDAO.selectMax());
		manager.setAdminNo(grandprix.getOwnerNo());
		manager.setGrndNum(1);

		managersDAO.insert(manager);
		return true;
	}
	
	@Transactional
	@Override
	public boolean updateNecessary(GrandprixName grandprixName, Grandprix grandprix, Manager manager,String uploadPath,String grndLogoPath,MultipartFile upload) {
		// TODO Auto-generated method stub
		
		grandprixNamesDAO.updateTitle(grandprixName);
		grandprixesDAO.updateNecessary(grandprix);
		
		manager.setGrndNo(grandprix.getGrndNo());
		manager.setGrndNum(grandprix.getNum());
		managersDAO.insert(manager);
		
		
		
		//UUID占쏙옙 占싱울옙占싹울옙 占싱몌옙占쏙옙 占쏙옙占쏙옙占싹곤옙
		UUID uuid = UUID.randomUUID();
		//System.out.println("1");
		//System.out.println(upload);
		String fileName = 
				upload.getOriginalFilename();
		System.out.println("2");
		//占쏙옙占쏙옙 index
		int dotIdx = fileName.lastIndexOf(".");
		
		//.占쏙옙占쏙옙 확占쏙옙占쌘몌옙 占쏙옙占쏙옙占쏙옙占쏙옙
		fileName = fileName.substring(
				dotIdx, 
				fileName.length());
		
		//占쏙옙占쏙옙占쏙옙 占싱몌옙占쏙옙 占쏙옙치占쏙옙
		fileName = uuid+fileName;

		//System.out.println("fileName:"+fileName);
		
		File file = new File(uploadPath+fileName);
		
		try {
			//占쏙옙占싸듸옙 처占쏙옙
			upload.transferTo(file);
			
			//占쏙옙占싸듸옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			//profile占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占�
			ResizeImageUtil.resize(
					uploadPath+fileName, 
					grndLogoPath+fileName,
					400);
		
			//占싱뱄옙占쏙옙 占쏙옙占쏙옙 占쏙옙 DB 占쏙옙占쏙옙
			grandprix.setImage(fileName);
			
			grandprixesDAO.updateNecessary(grandprix);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return true;
	}
	
	@Transactional
	@Override
	public boolean updateParticipant(Grandprix grandprix ,String[] title,String[] isNecessary,String[] isImage,
			String[] toUser, String[] content,String[] url,String[] image) {
		// TODO Auto-generated method stub
		
		AnnounceUpdateLog announceUpdateLog = new AnnounceUpdateLog();

		announceUpdateLog.setContent(grandprix.getParticipantAnnounce());
		announceUpdateLog.setGrndNo(grandprix.getGrndNo());
		announceUpdateLog.setGrndNum(1);
		announceUpdateLog.setManagerNo(grandprix.getOwnerNo());
		announceUpdateLogsDAO.insertLog(announceUpdateLog);
		
		grandprixesDAO.updateParticipant(grandprix);
		
		Prix prix = new Prix();
		//占쏙옙품 isnert
		for(int i=0; i<toUser.length; i++) {
			prix.setGrndNo(grandprix.getGrndNo());
			prix.setGrndNum(grandprix.getNum());
			prix.setContent(content[i]);
			prix.setToUser(toUser[i]);
			prix.setUrl(url[i]);
			prix.setUrl(image[i]);
			prixesDAO.insert(prix);
			//prixesService.addPrix(prix);
			
		}
		ParticipantCondition condition = new ParticipantCondition();
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 isnert
		for(int i=0; i<title.length; i++) {
			System.out.println("title: "+title[i]);
			condition.setGrndNo(grandprix.getGrndNo());
			condition.setGrndNum(grandprix.getNum());
			condition.setIsNecessary(isNecessary[i]);
			condition.setIsImage(isImage[i]);
			condition.setTitle(title[i]);
			condition.setNum(i+1);
			participantConditionDAO.insert(condition);
			//participantConditionService.addCondition(condition);
			
	
		}
		
		
		
		return true;
	}
	
	@Override
	public boolean updateMethod(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return grandprixesDAO.updateMethod(grandprix);
	}
	
	@Override
	public boolean updateComplete(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return grandprixesDAO.updateComplete(grandprix);
	}
	
	@Override
	public Grandprix getOneGrnd(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return grandprixesDAO.selectOne(grandprix);
	}

	
	@Override
	public Map<String, Object> selectGrandprixesNo(Grandprix grandprix) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		GrandprixName name = grandprixNamesDAO.selectName(grandprix.getGrndNo());
		map.put("name", name);
		Grandprix grandprixs = grandprixesDAO.selectGrandprixesNo(grandprix);
		List<Manager> managers = managersDAO.selectList(grandprix);
		
		List<Prix> prixes =  prixesDAO.selectPrixes(grandprix.getGrndNo());
		List<Match> weekMatchs = matchsDAO.selectWeekMatchs(grandprix);
		map.put("grandprix", grandprixs);
		map.put("prixes", prixes);
		map.put("matchs", weekMatchs);
		map.put("managers", managers);
		
		return map;
	}
	public Grandprix selectGrandprixesNoM(int no) {
		// TODO Auto-generated method stub
		return grandprixesDAO.selectGrandprixesNoM(no);
	}
	
	@Override
	public Map<String, Object> getGrandprixInfos(Grandprix grnd) {
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<>();
		
		GrandprixName name = grandprixNamesDAO.selectName(grnd.getGrndNo());
		grnd = grandprixesDAO.selectGrandprixesNo(grnd);
		List<Manager> managers = managersDAO.selectList(grnd);
		
		result.put("name", name);
		result.put("grandprix", grnd);
		result.put("managers", managers);
		
		return result;
	}
	@Override
	public GrandprixName getGrndName(int no) {
		// TODO Auto-generated method stub
		return grandprixNamesDAO.selectName(no);
	}
	

	
}
