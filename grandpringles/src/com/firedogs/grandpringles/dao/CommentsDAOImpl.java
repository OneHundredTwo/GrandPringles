package com.firedogs.grandpringles.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Comment;

public class CommentsDAOImpl implements CommentsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Comment> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("comments.selectList", map);
	}
	
	@Override
	public int add(int no) {
		// TODO Auto-generated method stub
		return session.update("comments.plusLike",no);
	}
	
	@Override
	public int sub(int no) {
		// TODO Auto-generated method stub
		return session.update("comments.minusLike",no);
	}
	
	@Override
	public int searchLikes(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.getCommentLike",no);
	}
	
	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return session.insert("comments.insertComment",comment);
	}
	
	@Override
	public int deleteComments(int no) {
		// TODO Auto-generated method stub
		return session.delete("comments.deleteComments",no);
	}
}
