package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.ClausesDAO;
import com.firedogs.grandpringles.vo.Clause;

public class ClausesServiceImpl implements ClausesService {
	
	ClausesDAO clausesDAO;
	
	public void setClausesDAO(ClausesDAO clausesDAO) {
		this.clausesDAO = clausesDAO;
	}

	
	@Override
	public boolean addClause(Clause clause) {
		// TODO Auto-generated method stub
		return clausesDAO.insert(clause);
	}
}
