package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.vo.Authentication;

public interface MailService {

	/** 메일 전송
	 *  @param subject 제목 
	 * 	@param text 내용
	 * 	@param from 보내는 메일주소
	 * 	@param to 받는 메일 주소
	 * 	@param filePath 첨부 파일 경로: 첨부파일 없을시 null 
	 * **/
	
	public int send(String no, String filePath);

	public boolean selectCodeKey(Authentication authentication);
	

}//MailService end
