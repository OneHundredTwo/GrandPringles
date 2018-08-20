package com.firedogs.grandpringles.service;

import com.firedogs.grandpringles.vo.Authentication;

public interface MailService {

	/** ���� ����
	 *  @param subject ���� 
	 * 	@param text ����
	 * 	@param from ������ �����ּ�
	 * 	@param to �޴� ���� �ּ�
	 * 	@param filePath ÷�� ���� ���: ÷������ ������ null 
	 * **/
	
	public int send(String no, String filePath);

	public boolean selectCodeKey(Authentication authentication);
	

}//MailService end
