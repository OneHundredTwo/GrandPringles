package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.PageVO;

public interface BoardsDAO {
//	기원이꺼
	public int insert(Board board);
	public int updateHit(int no);
	public Board selectOne(int no);
	public List<Board> selectList(PageVO pageVO);
	public List<Board> selectSortList(PageVO pageVO);
	public int selectTotal();
	public List<Board> boardPopular(int grndNo);
	public List<Board> boardNew(int grndNo);
	
	//민호꺼
	
	public List<Board> boardList(Map<String, Object> pageRange);
	
	public int total(Map<String, Object> map);
	
	public Board selectArticle(Board board);
	
	public Board selectBetting(Board board);
	
	public int viewCount(int no);
	
	public int plusLike(int no);
	
	public int minusLike(int no);
	
	public int getBoardLike(int no);

	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int no);
	
	
}
