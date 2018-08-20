package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Record;

public class RecordsDAOImpl extends DAO implements RecordsDAO{
	public List<Record> selectList(Map<String, Integer> map){
		return session.selectList("records.selectList", map);
	}
	@Override
	public int insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("records.insert",param);
	}
	
	@Override
	public int delete(Game game) {
		// TODO Auto-generated method stub
		return session.delete("records.delete", game);
	}
	
	@Override
	public int updateRecord(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("records.updateRecord", param);
	}
}
