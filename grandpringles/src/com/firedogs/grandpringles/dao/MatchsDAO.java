package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Match;

public interface MatchsDAO {
	public int updateStatus(Match match);
	public Match selectOne(int no);
	public Match selectRoundMatch(Match match);
	public int updateCorner(Match match);
	public int update(Match match);
	public int insert(Match match);
	
	public List<Match> selectList(Grandprix grandprix);
	
	public List<Match> getMatchs(Grandprix grandprix);
	
	public List<Match> selectWeekMatchs(Grandprix grandprix);
}
