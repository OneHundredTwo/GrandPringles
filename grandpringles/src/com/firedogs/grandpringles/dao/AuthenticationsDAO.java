package com.firedogs.grandpringles.dao;

import com.firedogs.grandpringles.vo.Authentication;

public interface AuthenticationsDAO {

	public int insertCode(Authentication authentication);
	
	public int selectCode(Authentication authentication);
}
