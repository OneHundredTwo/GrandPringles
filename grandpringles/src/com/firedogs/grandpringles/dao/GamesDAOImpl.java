package com.firedogs.grandpringles.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.util.SqlSessionUtil;
import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Match;

public class GamesDAOImpl extends DAO implements GamesDAO{
	public Map<String, Object> selectMatchInfo(Match match) {
		return session.selectOne("games.selectMatchInfo", match);
	}
	@Override
	public int insert(Match match) {
		// TODO Auto-generated method stub
		return session.insert("games.insert", match);
	}
	
	
	@Override
	public Game selectLatestMatchsGame(int matchNo) {
		// TODO Auto-generated method stub
		return session.selectOne("games.selectLatestMatchsGame", matchNo);
	}
	
	@Override
	public int delete(Game game) {
		// TODO Auto-generated method stub
		return session.delete("games.delete", game);
		
	}
	
	@Override
	public int updateWinner(Game game) {
		// TODO Auto-generated method stub
		return session.update("games.updateWinner", game);
	}
}
