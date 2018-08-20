package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.Grandprix;

public interface GrandprixesDAO {

	public boolean insert(Grandprix grandprix);
	public boolean updateNecessary(Grandprix grandprix);
	public boolean updateParticipant(Grandprix grandprix);
	public boolean updateMethod(Grandprix grandprix);
	public boolean updateComplete(Grandprix grandprix);
	public Grandprix selectAnnounceList(Grandprix grandprix);

	public int updateNumberOfParticipant(Grandprix grandprix);
	public int selectNumberOfParticipant(Grandprix grandprix); 
	
	public Grandprix selectGrandprixesNo(Grandprix grandprix);
	

	public List<Grandprix> selectRecentGrandprixesList();
	public Grandprix selecRecentGrnd(int grndNo);
	public Grandprix selectOne(Grandprix grndInfo);
	public int updateMaxparticipant(Grandprix grndInfo);
	
	public Grandprix selectGrandprixesNoM(int no);
	
	public int updatePresentParts(Grandprix grandpirx);

}
