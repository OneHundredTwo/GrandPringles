package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.ManagersDAO;
import com.firedogs.grandpringles.vo.Manager;

public class ManagersServiceImpl implements ManagersService{
	
	private ManagersDAO managersDAO;
	
	public void setManagersDAO(ManagersDAO managersDAO) {
		this.managersDAO = managersDAO;
	}

}
