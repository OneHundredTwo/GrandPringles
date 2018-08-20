package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.dao.CommentsDAO;

public class CommentsServiceImpl implements CommentsService {

	private CommentsDAO commentsDAO;
	
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	
	
	
}
