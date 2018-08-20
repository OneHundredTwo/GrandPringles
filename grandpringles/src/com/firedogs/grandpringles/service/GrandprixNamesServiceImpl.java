package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.GrandprixNamesDAO;
import com.firedogs.grandpringles.vo.GrandprixName;

public class GrandprixNamesServiceImpl implements GrandprixNamesService{
	
	GrandprixNamesDAO grandprixNamesDAO;
	
	public void setGrandprixNamesDAO(GrandprixNamesDAO grandprixNamesDAO) {
		this.grandprixNamesDAO = grandprixNamesDAO;
	}
	
	@Override
	public int MaxGrndNo() {
		// TODO Auto-generated method stub
		return grandprixNamesDAO.selectMax();
	}
	

	public boolean makeGrand(GrandprixName grandprixName) {
		// TODO Auto-generated method stub
		return grandprixNamesDAO.insert(grandprixName);
	}

	
	@Override
	public GrandprixName getName(int no) {
		// TODO Auto-generated method stub
		return grandprixNamesDAO.selectName(no);
	}

}
