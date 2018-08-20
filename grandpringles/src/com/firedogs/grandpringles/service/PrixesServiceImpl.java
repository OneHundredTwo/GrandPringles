package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.PrixesDAO;
import com.firedogs.grandpringles.vo.Prix;

public class PrixesServiceImpl implements PrixesService{
	
	private PrixesDAO prixesDAO;
	
	public void setPrixesDAO(PrixesDAO prixesDAO) {
		this.prixesDAO = prixesDAO;
	}
	
	@Override
	public boolean addPrix(Prix prix) {
		// TODO Auto-generated method stub
		return prixesDAO.insert(prix);
	}

}
