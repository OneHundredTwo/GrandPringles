package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.Prix;

public interface PrixesDAO {

	public boolean insert (Prix prix);
	
	public List<Prix> selectPrixes(int no);
}
