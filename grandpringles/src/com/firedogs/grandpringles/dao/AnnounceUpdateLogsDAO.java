package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Grandprix;

public interface AnnounceUpdateLogsDAO {
	public List<AnnounceUpdateLog> selectList(Grandprix grnd);
	public int insertLog(AnnounceUpdateLog log);
}
