package com.firedogs.grandpringles.dao;

import java.util.Map;

import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Match;

public interface GamesDAO {
	public Map<String, Object> selectMatchInfo(Match match);
	public int insert(Match match);
	public Game selectLatestMatchsGame(int matchNo);
	public int delete(Game game);
	public int updateWinner(Game game);
}


