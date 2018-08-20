package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.LikingsDAO;
import com.firedogs.grandpringles.vo.Liking;

public class LikingsServiceImpl implements LikingsService{

	private LikingsDAO likingsDAO;
	
	public void setLikingsDAO(LikingsDAO likingsDAO) {
		this.likingsDAO = likingsDAO;
	}
	
}
