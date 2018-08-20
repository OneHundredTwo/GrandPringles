package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Participation;

public interface ParticipationsDAO {
	
	public int insert(Participation participation);
	public Participation selectApplication(Participation participation);
	
//	±â¿øÀÌ²¨
	public List<Participation> selectApplyList(Map<String,Object> param);
	public int selectTotal(Map<String,Object> param);
	public int updateStatus(Participation partInfo);
	public int delete(Participation partInfo);
	public int delete(Map<String, Object> param);
	public int updateRank(Participation part);
	

}
