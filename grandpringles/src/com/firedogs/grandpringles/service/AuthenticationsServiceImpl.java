package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.AuthenticationsDAO;
import com.firedogs.grandpringles.vo.Authentication;

public class AuthenticationsServiceImpl implements AuthenticationsService {

	private AuthenticationsDAO authenticationsDAO;
	
	public void setAuthenticationsDAO(AuthenticationsDAO authenticationsDAO) {
		this.authenticationsDAO = authenticationsDAO;
	}
	
	
	
}
