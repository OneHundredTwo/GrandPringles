package com.firedogs.grandpringles.dao;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Liking;

public class LikingsDAOImpl implements LikingsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Liking liking) {
		// TODO Auto-generated method stub
		return session.insert("likings.insert",liking);
	}
	
	@Override
	public int getLiking(Liking liking) {
		// TODO Auto-generated method stub
		return session.selectOne("likings.confileLiking",liking);
	}
	
	@Override
	public int removeBoardsLike(int contentID) {
		// TODO Auto-generated method stub
		return session.delete("likings.deleteBoardLike", contentID);
	}
	
	@Override
	public int removeCommentsLike(int boardNo) {
		// TODO Auto-generated method stub
		return session.delete("likings.deleteCommentLike", boardNo);
	}
	
	@Override
	public int removeLiking(Liking liking) {
		// TODO Auto-generated method stub
		return session.delete("likings.cancelLiking",liking);
	}
}
