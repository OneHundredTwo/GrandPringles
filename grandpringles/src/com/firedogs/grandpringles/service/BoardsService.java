package com.firedogs.grandpringles.service;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Comment;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Liking;
import com.firedogs.grandpringles.vo.Match;


public interface BoardsService {
	
	public Map<String, Object> getBoards(int grndNo, int grndNum, String type, String order, int pageNo);
	
	public Map<String, Object> getArticle(Board board);	
	
	public Map<String, Object> getBetting(Board board);
		
	public Map<String, Object> likeBoard(int boardNo, String type, int userNo);
	
	public Map<String, Object> likeComment(int boardNo, String type, int userNo, int commentNo);
	
	public int addComment(String content, int boardNo, int userNo, String nickname, String profile);
	
	public List<Comment>  getComments(int boardNo, String order);
	
	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int no);
	
	public List<Match> selectList(Grandprix grandprix);
}
