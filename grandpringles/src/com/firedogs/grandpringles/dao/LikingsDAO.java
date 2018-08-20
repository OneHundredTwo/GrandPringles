package com.firedogs.grandpringles.dao;

import com.firedogs.grandpringles.vo.Liking;

public interface LikingsDAO {
	
	// 입력
	public int insert(Liking liking);
		
	// 추천수를 가져오는 거
	public int getLiking(Liking liking);
		
	// DB에 있는 liking 정보를 지우는 것
	public int removeLiking(Liking liking);
		
	// 댓글의 추천을 모두 지우는 것
	public int removeCommentsLike(int boardNo);
		
	// 게시물의 추천을 모두 지우는 것
	public int removeBoardsLike(int contentID);

	
	
}
