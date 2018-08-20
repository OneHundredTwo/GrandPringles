package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Comment;

public interface CommentsDAO {
	
	public List<Comment> selectList(Map<String, Object> map);
	
	public int add(int no);
	
	public int sub(int no);	
	
	public int searchLikes(int no);

	public int insertComment(Comment comment);
	
	public int deleteComments(int no);
}
