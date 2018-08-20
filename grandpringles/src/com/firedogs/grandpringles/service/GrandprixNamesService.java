package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.vo.GrandprixName;

public interface GrandprixNamesService {

	
	public int MaxGrndNo();
	public boolean makeGrand(GrandprixName grandprixName);
	public GrandprixName getName(int no);
}
