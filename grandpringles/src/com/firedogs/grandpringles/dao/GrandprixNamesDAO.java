package com.firedogs.grandpringles.dao;

import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.ParticipantApplication;

public interface GrandprixNamesDAO {
	
	public int selectMax();
	public boolean insert(GrandprixName grandprixName);
	public boolean updateTitle(GrandprixName grandprixName);
	public GrandprixName selectName(int no);
	

}
