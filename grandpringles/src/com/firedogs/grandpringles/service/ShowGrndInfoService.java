package com.firedogs.grandpringles.service;

import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.PageVO;
import com.firedogs.grandpringles.vo.User;

public interface ShowGrndInfoService {
	public Map<String,Object> getMainContents();
	public Map<String,Object> getMainContents(int grndNo);
	
	public List<User> getStreamerList(String nickname);
}
