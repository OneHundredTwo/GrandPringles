package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Manager;

public interface ManagersDAO {
	
	public boolean insert(Manager manager);
	public List<Manager> selectList(Grandprix grandprix);

}
