package com.firedogs.grandpringles.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;

public interface GrandManagementService {
	public Map<String, Object> getAnnounceUpdateLogs(Grandprix grnd);
	public boolean updateAnnounce(AnnounceUpdateLog log);
	public Map<String,Object> getParticipationInfo(int applyPage, int partPage,int grndNo, int grndNum);
	public List<ParticipantApplication> getApplyInfo(Participation applicant);
	public List<ParticipantCondition> getConditions(int grndNo, int grndNum);
	public boolean changeMaxParts(Grandprix grnd);
	public boolean partConfirm(Participation partInfo);
	public boolean partReject(Participation partInfo);
	public boolean extinguishParts(int[] userNo, Grandprix grndInfo);
	public Map<String,Object> getManageMatchChart(Grandprix grndInfo);
	public Map<String, Object> createNextGame(Match match);
	public Map<String, Object> cancelGame(Match match);
	public Map<String, Object> startGame(Match match);
	public boolean saveScore(Game game, int[] redScore, int[] blueScore);
	public Map<String, Object> endGame(Game game, int[] redScore, int[] blueScore, String winner);
	public boolean endMatch(Match match);
	public boolean saveMatchSchedule(Match match);
	public boolean startMatch(Match match);
	public void winByDefault(Match match);
	public void endFinalMatch(Match match);
	
	
	
	
	
	
	
	
	
	public void test();
}
