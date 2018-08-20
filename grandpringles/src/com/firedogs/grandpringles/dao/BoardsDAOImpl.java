package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.util.SqlSessionUtil;
import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.PageVO;

public class BoardsDAOImpl extends DAO implements BoardsDAO{
	

	
	
	public int insert(Board board){
		return session.insert("boards.insertBoard", board);
	}

	public int updateHit(int no) {
		return session.update("boards.updateHit",no);
	}
	
	public   Board selectOne(int no) {
		return session.selectOne("boards.selectOne",no);
	}
	
	public   List<Board> selectList(PageVO pageVO) {
		return session.selectList("boards.selectList",pageVO);
	}
	
	public   List<Board> selectSortList(PageVO pageVO) {
		return session.selectList("boards.selectSortPop",pageVO);
	}
	
	public   int selectTotal() {
		return session.selectOne("boards.selectTotal");
	}
	
	public   List<Board> boardPopular(int grndNo) {
		return session.selectList("boards.boardPopular", grndNo);
	}
	
	public   List<Board> boardNew(int grndNo) {
		
		return session.selectList("boards.boardNew", grndNo);
	}
	
	@Override
	public List<Board> boardList(Map<String, Object> pageRange) {
		// TODO Auto-generated method stub
		return session.selectList("boards.selectBoardList",pageRange);
	}
	
	@Override
	public int total(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.total",map);
	}
	
	@Override
	public Board selectArticle(Board board) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.selectArticle",board);
	}
	
	@Override
	public Board selectBetting(Board board) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.selectBetting",board);
	}
	
	@Override
	public int viewCount(int no) {
		// TODO Auto-generated method stub
		return session.update("boards.viewCount",no);
	}
	
	@Override
	public int plusLike(int no) {
		// TODO Auto-generated method stub
		return session.update("boards.plusLike",no);
	}
	
	@Override
	public int minusLike(int no) {
		// TODO Auto-generated method stub
		return session.update("boards.minusLike",no);
	}
	
	@Override
	public int getBoardLike(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("boards.getBoardLike",no);
	}
	
	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return session.insert("boards.insertBoard",board);
	}
	
	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return session.update("boards.updateBoard",board);
	}
	
	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return session.delete("boards.deleteBoard",no);
	}
	
	
	

}
