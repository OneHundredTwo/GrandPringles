package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.util.SqlSessionUtil;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Match;

public class MatchsDAOImpl extends DAO implements MatchsDAO{
	public List<Match> selectList(Grandprix grnd){
		return session.selectList("matchs.selectList", grnd);
	}
	
	
	@Override
	public List<Match> getMatchs(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectList("matchs.getMatchs", grandprix);
	}
	
	
	@Override
	public int updateStatus(Match match) {
		// TODO Auto-generated method stub
		return session.update("matchs.updateStatus", match);
	}
	
	@Override
	public Match selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("matchs.selectOne", no);
	}

	public Match selectRoundMatch(Match match){
		return session.selectOne("matchs.selectRoundMatch", match);
	}

	public int updateCorner(Match match){
		return session.update("matchs.updateCorner", match);
	}
	public int update(Match match){
		return session.update("matchs.update", match);
	}
	public int insert(Match match){
		return session.insert("matchs.insert", match);
	}
	
	@Override
	public List<Match> selectWeekMatchs(Grandprix grandprix) {
		// TODO Auto-generated method stub
		return session.selectList("matchs.selectWeekMatchs", grandprix);
	}
}
