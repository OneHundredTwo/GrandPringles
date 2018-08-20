package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Grandprix;

public class AnnounceUpdateLogsDAOImpl extends DAO implements AnnounceUpdateLogsDAO {
	@Override
	public List<AnnounceUpdateLog> selectList(Grandprix grnd) {
		// TODO Auto-generated method stub
		return session.selectList("announce_update_logs.selectList", grnd);
	}
	
	@Override
	public int insertLog(AnnounceUpdateLog log) {
		// TODO Auto-generated method stub
		log.setContent(log.getContent().replaceAll("\\n", "\\\\n"));
		return session.insert("announce_update_logs.insertLog", log);
	}
}
