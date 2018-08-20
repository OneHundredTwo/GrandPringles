package com.firedogs.grandpringles.service;

import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.fileupload.MultiImageUpload;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.Manager;

public interface GrandprixesService {
	
	public boolean makeGrndDetail(Grandprix grandprix);
	public boolean updateNecessary(GrandprixName grandprixName, Grandprix grandprix, Manager manager,String uploadPath,String grndLogoPath,MultipartFile upload);
	public boolean updateParticipant(Grandprix grandprix ,String[] title,String[] isNecessary,String[] isImage,
			String[] toUser, String[] content,String[] url,String[] image);
	public boolean updateMethod(Grandprix grandprix);
	public boolean updateComplete(Grandprix grandprix);
	public Grandprix getOneGrnd(Grandprix grandprix);
	
	public Map<String, Object> selectGrandprixesNo(Grandprix grandprix);
	
	public Map<String, Object> getGrandprixInfos(Grandprix grandprix); 
	
	public Grandprix selectGrandprixesNoM(int no);
	
	public GrandprixName getGrndName(int no);
	
	
}
