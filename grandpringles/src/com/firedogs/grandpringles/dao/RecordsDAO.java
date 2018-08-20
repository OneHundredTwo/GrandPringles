package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Record;

public interface RecordsDAO {
	public List<Record> selectList(Map<String, Integer> map);
	public int insert(Map<String, Object> param);
	public int delete(Game game);
	public int updateRecord(Map<String, Object> param);
}
