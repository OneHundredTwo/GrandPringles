package com.firedogs.grandpringles.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.firedogs.grandpringles.dao.AnnounceUpdateLogsDAO;
import com.firedogs.grandpringles.dao.GamesDAO;
import com.firedogs.grandpringles.dao.GrandprixNamesDAO;
import com.firedogs.grandpringles.dao.GrandprixesDAO;
import com.firedogs.grandpringles.dao.ManagersDAO;
import com.firedogs.grandpringles.dao.MatchsDAO;
import com.firedogs.grandpringles.dao.ParticipationsDAO;
import com.firedogs.grandpringles.dao.RecordsDAO;
import com.firedogs.grandpringles.dao.ParticipantApplicationsDAO;
import com.firedogs.grandpringles.dao.ParticipantConditionsDAO;
import com.firedogs.grandpringles.util.PaginateUtil;
import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.Manager;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;
import com.firedogs.grandpringles.vo.Record;

public class GrandManagementServiceImpl implements GrandManagementService {
	private AnnounceUpdateLogsDAO auLogsDAO;

	public void setAuLogsDAO(AnnounceUpdateLogsDAO auLogsDAO) {
		this.auLogsDAO = auLogsDAO;
	}

	private ParticipationsDAO partsDAO;

	public void setPartsDAO(ParticipationsDAO partsDAO) {
		this.partsDAO = partsDAO;
	}

	private ParticipantApplicationsDAO paDAO;

	public void setPaDAO(ParticipantApplicationsDAO paDAO) {
		this.paDAO = paDAO;
	}

	private ParticipantConditionsDAO pcDAO;

	public void setPcDAO(ParticipantConditionsDAO pcDAO) {
		this.pcDAO = pcDAO;
	}

	private GrandprixesDAO grandprixDAO;

	public void setGrandprixDAO(GrandprixesDAO grandprixDAO) {
		this.grandprixDAO = grandprixDAO;
	}

	private MatchsDAO matchsDAO;

	public void setMatchsDAO(MatchsDAO matchsDAO) {
		this.matchsDAO = matchsDAO;
	}

	private GamesDAO gamesDAO;

	public void setGamesDAO(GamesDAO gamesDAO) {
		this.gamesDAO = gamesDAO;
	}

	private RecordsDAO recordsDAO;

	public void setRecordsDAO(RecordsDAO recordsDAO) {
		this.recordsDAO = recordsDAO;
	}
	
	public GrandprixNamesDAO grandprixNamesDAO;
	public void setGrandprixNamesDAO(GrandprixNamesDAO grandprixNamesDAO) {
		this.grandprixNamesDAO = grandprixNamesDAO;
	}
	
	public ManagersDAO managersDAO;
	public void setManagersDAO(ManagersDAO managersDAO) {
		this.managersDAO = managersDAO;
	}
	
	@Override
	public Map<String, Object> getAnnounceUpdateLogs(Grandprix grnd) {
		// TODO Auto-generated method stub
		Map<String, Object> announceData = new HashMap();
		List<AnnounceUpdateLog> updateLogs = auLogsDAO.selectList(grnd);
		
		GrandprixName name = grandprixNamesDAO.selectName(grnd.getGrndNo());
		grnd = grandprixDAO.selectGrandprixesNo(grnd);
		List<Manager> managers = managersDAO.selectList(grnd);
		
		announceData.put("name", name);
		announceData.put("grandprix", grnd);
		announceData.put("managers", managers);
		announceData.put("name", grandprixNamesDAO.selectName(grnd.getGrndNo()));
		announceData.put("updateLogs", updateLogs);
		announceData.put("lastModifiedAnn", updateLogs.get(0));

		return announceData;
	}

	@Override
	public boolean updateAnnounce(AnnounceUpdateLog log) {
		// TODO Auto-generated method stub
		return auLogsDAO.insertLog(log) == 1;
	}

	@Override
	public Map<String, Object> getParticipationInfo(int applyPage, int partPage, int grndNo, int grndNum) {
		// TODO Auto-generated method stub
		GrandprixName name = grandprixNamesDAO.selectName(grndNo);
		Grandprix grnd = grandprixDAO.selectGrandprixesNo(new Grandprix(grndNo, grndNum));
		List<Manager> managers = managersDAO.selectList(grnd);
		
		

		Map<String, Object> result = new HashMap();

		String grndParam = "/"+grndNo + "/" + grndNum + "/management/participations";
		Map<String, Object> param = new HashMap();
		param.put("grndNo", grndNo);
		param.put("grndNum", grndNum);
		result.put("grnd", grnd);

		// ���θ�� : 4��, ����� : 5����
		int pageNum = 5, blockNum = 3;

		// ��û���
		param.put("type", "W");
		param.put("start", pageNum * (applyPage - 1) + 1);
		param.put("end", pageNum * applyPage);

		result.put("applyList", partsDAO.selectApplyList(param));
		result.put("applyPaginate", PaginateUtil.getPaginate(applyPage, partsDAO.selectTotal(param), pageNum, blockNum,
				grndParam, "partPage=" + partPage + "&applyPage="));
		// ���θ��
		pageNum = 4;
		param.put("type", "C");
		param.put("start", pageNum * (partPage - 1) + 1);
		param.put("end", pageNum * partPage);

		result.put("partList", partsDAO.selectApplyList(param));
		result.put("partPaginate", PaginateUtil.getPaginate(partPage, partsDAO.selectTotal(param), pageNum, blockNum,
				grndParam, "applyPage=" + applyPage + "&partPage="));
		
		result.put("name", name);
		result.put("grandprix", grnd);
		result.put("managers", managers);

		result.put("grndNo", grndNo);
		result.put("grndNum", grndNum);

		result.put("partPage", partPage);
		result.put("applyPage", applyPage);

		result.put("conditions", pcDAO.selectList(param));

		return result;
	}

	@Override
	public List<ParticipantApplication> getApplyInfo(Participation applicant) {
		// TODO Auto-generated method stub
		return paDAO.selectList(applicant);
	}

	@Override
	public List<ParticipantCondition> getConditions(int grndNo, int grndNum) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap();
		params.put("grndNo", grndNo);
		params.put("grndNum", grndNum);
		return pcDAO.selectList(params);
	}

	@Override
	public boolean changeMaxParts(Grandprix grnd) {
		// TODO Auto-generated method stub
		Grandprix ori = grandprixDAO.selectOne(grnd);
		if (ori.getNumberOfParticipant() > grnd.getMaxParticipant()) {
			return false;
		} else
			return grandprixDAO.updateMaxparticipant(grnd) == 1;
	}

	@Override
	public boolean partConfirm(Participation partInfo) {
		// TODO Auto-generated method stub
		boolean updateStatus = true, updateParticipantNum = true;

		Grandprix grnd = grandprixDAO.selectOne(new Grandprix(partInfo.getGrndNo(), partInfo.getGrndNum()));
		if (grnd.getNumberOfParticipant() == grnd.getMaxParticipant()) {
			return false;
		} else {
			updateStatus = partsDAO.updateStatus(partInfo) == 1;
			updateParticipantNum = grandprixDAO.updatePresentParts(grnd) == 1;
		}
		return updateStatus && updateParticipantNum;
	}

	@Override
	public boolean partReject(Participation partInfo) {
		// TODO Auto-generated method stub
		return partsDAO.delete(partInfo) == 1;
	}

	@Override
	public boolean extinguishParts(int[] userNo, Grandprix grndInfo) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap();

		ArrayList<Integer> userNoList = new ArrayList();
		for (int i : userNo) {
			userNoList.add(i);
		}
		param.put("grndNo", grndInfo.getGrndNo());
		param.put("grndNum", grndInfo.getNum());
		param.put("userNoList", userNoList);
		// list�� �����ϴ� delete
		partsDAO.delete(param);
		// number_of_participant update
		grandprixDAO.updatePresentParts(grndInfo);
		return false;
	}
	

	@Override
	public Map<String, Object> getManageMatchChart(Grandprix grndInfo) {
		// TODO Auto-generated method stub
		Grandprix grnd = grandprixDAO.selectOne(grndInfo);
		boolean isPartType = grnd.getPartType().equals("P"); // T : ������ , F : ����

		Map<String, Object> competInfo = new HashMap();

		competInfo.put("isParticipants", true);
		competInfo.put("totParticipants", grnd.getNumberOfParticipant());

		// ArrayList : rounds , ��Ұ� �Ǵ� ArrayList : �� ���庰 matchs
		ArrayList<HashMap> rounds = new ArrayList();

		List<Match> matchList = matchsDAO.selectList(grnd);

		// ��� ��ȸ�� 1����� �ݵ�� �����Ƿ� 1���忡 ���� round�� ���� �־���
		// round�� ���ĵȻ��·� Match���� ��ȸ�����Ƿ�, ������� 1~ ����� ������� ���������� ����ǰ�, �������� ���� ������
		// �������尪���� Ŭ �� �ۿ� ����.
		HashMap<String, ArrayList> round1 = new HashMap<String, ArrayList>();
		rounds.add(round1);
		ArrayList<Map> roundMatchs1 = new ArrayList<Map>();
		rounds.get(0).put("matchs", roundMatchs1);
		int roundInx = 0;
		int k = 0;
		for (Match match : matchList) {
			k++;
			int roundNum = match.getRound() - 1;
			if (roundNum > roundInx) {
				roundInx = roundNum;
				// ���尡 �ٲ𶧸��� matchs �߰�
				HashMap<String, ArrayList> round = new HashMap<String, ArrayList>();
				rounds.add(round);
				// matchs�� list
				ArrayList<Map> roundMatchs = new ArrayList<Map>();
				rounds.get(roundInx).put("matchs", roundMatchs);
			}
			// match
			HashMap<String, Object> matchMap = (HashMap<String, Object>) getMatchBoxData(match);
			((ArrayList) (rounds.get(roundInx).get("matchs"))).add(matchMap);

		}

		competInfo.put("rounds", rounds);

		return competInfo;
	}

	@Transactional
	@Override
	public Map<String, Object> createNextGame(Match match) {
		// TODO Auto-generated method stub
		// 1.Match�� game_status�� WS�� �ٲٱ�
		match = matchsDAO.selectOne(match.getNo());
		match.setGameStatus("WS");
		
		matchsDAO.updateStatus(match);

		// 2.games�� ���������� �����Ѵ� .
		gamesDAO.insert(match);
		// �ϴ��� �Ǹ������� �߰��� game�� ���´�.
		Game game = gamesDAO.selectLatestMatchsGame(match.getNo());

		// 3.record�� �� ���ڵ带 �����Ѵ�.
		// �������ΰ��
		int corners[] = { match.getRed(), match.getBlue() };
		for (int cornerNo : corners) {
			Map<String, Object> param = new HashMap<>();
			param.put("cornerNo", cornerNo);
			param.put("matchNo", game.getMatchNo());
			param.put("seq", game.getSeq());
			recordsDAO.insert(param);
		}

		// ���Ƴ��� �����͸� �Ѱ��ش�.
		return getMatchBoxData(match);

		// �����ΰ��-> conrers�� team���� ��ȸ�ؼ� �� ���� userno��ȸ�ؼ� ���� insert�ϱ�
	}
	
	
	@Transactional
	//���ӽ��� �����¿��� -> ��Ҹ� �������
	@Override
	public Map<String, Object> cancelGame(Match match) {
		// TODO Auto-generated method stub
		// 1.Match�� game_status�� ���� ���ھ ������Ȳ���� Ȯ���ؼ� , ������ �ƴϸ� '���� ���ɻ���'�� ������Ȳ�̸� '���ھ� ���ºλ���(����Ұ�)'��
		match = matchsDAO.selectOne(match.getNo());
		Map<String, Object> matchInfo  = gamesDAO.selectMatchInfo(match);
		if(((BigDecimal)matchInfo.get("RED_SCORE")).intValue() != ((BigDecimal)matchInfo.get("BLUE_SCORE")).intValue())
			match.setGameStatus("CE");
		else
			match.setGameStatus("NE");
		matchsDAO.updateStatus(match);

		// �Ǹ������� �߰��� game�� ���´�.
		Game game = gamesDAO.selectLatestMatchsGame(match.getNo());

		
		//'�������� ����'�� �������� : fk�������ǿ� �ɸ��� �ʰ�
		// 2.game�� ���õ� record�� �߰��� �� ���ڵ���� �����Ѵ�.
		recordsDAO.delete(game);
		
		// 3.game�� �����Ѵ�.
		gamesDAO.delete(game);

		

		return getMatchBoxData(match);
	}
	
	@Transactional
	@Override
	public Map<String, Object> startGame(Match match) {
		// TODO Auto-generated method stub
		match.setGameStatus("PG");
		matchsDAO.updateStatus(match);
		
		return getMatchBoxData(matchsDAO.selectOne(match.getNo()));
	}
	
	//�����ϰ�쿣 Map���� �ްų�, 2�����迭�� ����
	@Transactional
	@Override
	public boolean saveScore(Game game, int[] redScore, int[] blueScore) {
		// TODO Auto-generated method stub
		Match match = matchsDAO.selectOne(game.getMatchNo());
		int scores[][] = {redScore, blueScore};
		int corners[] = {match.getRed(), match.getBlue()};
		Map<String, Object> param = new HashMap<>();
		
		param.put("matchNo", match.getNo());
		param.put("seq", game.getSeq());
		
		boolean updateStatus = true;
		for(int i=0; i<corners.length; i++) {
			param.put("corner", corners[i]);
			param.put("k", scores[i][0]);
			param.put("d", scores[i][1]);
			param.put("a", scores[i][2]);
			
			updateStatus &= recordsDAO.updateRecord(param)==1;
		}
		return updateStatus;
	}
	
	@Transactional
	@Override
	public Map<String, Object> endGame(Game game, int[] redScore, int[] blueScore, String winner) {
		// TODO Auto-generated method stub
		//1.match�� A�� Ȥ�� B�� no ������
		Match match = matchsDAO.selectOne(game.getMatchNo());
		int winnerNo;
		if(winner.equals("RED"))
			winnerNo = match.getRed();
		else
			winnerNo = match.getBlue();
		
		//2.game�� winner update�ϱ�
		boolean updateWinner = true;
		game.setWinnerNo(winnerNo);
		updateWinner = gamesDAO.updateWinner(game)==1;
		
		//3.���� record ������Ʈ�ϱ�
		int scores[][] = {redScore, blueScore};
		int corners[] = {match.getRed(), match.getBlue()};
		Map<String, Object> param = new HashMap<>();
		
		param.put("matchNo", match.getNo());
		param.put("seq", game.getSeq());
		
		boolean updateRecord = true;
		for(int i=0; i<corners.length; i++) {
			param.put("corner", corners[i]);
			param.put("k", scores[i][0]);
			param.put("d", scores[i][1]);
			param.put("a", scores[i][2]);
			
			updateRecord &= recordsDAO.updateRecord(param)==1;
		}
		
		//4.winner�� ������ �Ŀ� �����񱳷� ������� ������ Ȯ���� �ش��ϴ� ���ӻ��·� ����
		Map<String, Object> matchInfo  = gamesDAO.selectMatchInfo(match);
		if(((BigDecimal)matchInfo.get("RED_SCORE")).intValue() != ((BigDecimal)matchInfo.get("BLUE_SCORE")).intValue())
			match.setGameStatus("CE");
		else
			match.setGameStatus("NE");
		
		
		matchsDAO.updateStatus(match);

		return getMatchBoxData(match);
	}


	@Transactional
	@Override
	public boolean endMatch(Match match) {
		// TODO Auto-generated method stub
		
		//1.����� ��ȣ ���
		match  = matchsDAO.selectOne(match.getNo());
		System.out.println("<<<original>>>");
		System.out.println(match.toString());
		int winnerId = 0;
		// ���ھ�, ���̸� ������
		Map<String, Object> resultMap = gamesDAO.selectMatchInfo(match);

		int redScore = ((BigDecimal) resultMap.get("RED_SCORE")).intValue(),
				blueScore = ((BigDecimal) resultMap.get("BLUE_SCORE")).intValue();
		String redNickname = (String) resultMap.get("RED"), blueNickname = (String) resultMap.get("BLUE");
		
		if(redScore > blueScore) {
			winnerId = match.getRed();
		}else {
			winnerId = match.getBlue();
		}
		
		//2.���� match status end�� �����ϰ� ������Ʈ�ϱ�
		match.setStatus("E");
		match.setGameStatus(null);
		
		System.out.println("<<<<update info>>>>");
		System.out.println(match.toString());
		
		matchsDAO.update(match);
		
		
		//2.���������� match��ȣ, A������ B������ ���ϱ�
		//���� = ������� +1
		//match��ȣ : ���� ceil(match��ȣ/2) ex) 1���� 1,2��⿡�� �ö�»������ 1/2=0.5 -> ceil(0.5) -> match 1, 2/2=1 -> ceil(1) -> match 1 ��ư ��ʸ�Ʈ�� log2�� �����ؼ� �̰� ��.
		//A�� B�� : match��ȣ�� Ȧ���� A��, ¦���� B�� 
		int round = match.getRound()+1, matchNumber = (int)Math.ceil((double)match.getMatchNumber()/2.0);
		String corner = match.getMatchNumber()%2 == 1  ? "RED" : "BLUE";
		System.out.println(match.getMatchNumber()%2 == 1);
		System.out.println(corner);
		

		//3.�������忡 �ö� Match�� �ִ��� Ȯ���Ѵ�.
		match.setRound(round);
		match.setMatchNumber(matchNumber);
		Match nextRoundMatch = matchsDAO.selectRoundMatch(match);
		
		
	
		//���尡 ������ winner������ update
		//���尡 ������ ���� insert
		if(nextRoundMatch == null) {
			//4.�����Ѵ�
			System.out.println("<<<inserted data>>>>");
			System.out.println(match.toString());
			if(corner.equals("RED")) {
				//Ȧ���� �¸����� red���� ����
				match.setRed(winnerId);
				match.setBlue(null);
			}else {
				//¦���� �¸����� blue���� ����
				match.setRed(null);
				match.setBlue(winnerId);
			}
			match.setStatus("B");
			match.setGameStatus(null);
			
			matchsDAO.insert(match);
		}else {
			
			System.out.println("<<<<<next round match data>>>>>");
			System.out.println(nextRoundMatch.toString());
			if(corner.equals("RED")) {
				//Ȧ���� �¸����� red���� ����
				nextRoundMatch.setRed(winnerId);
			}else {
				//¦���� �¸����� blue���� ����
				nextRoundMatch.setBlue(winnerId);
			}
			
			System.out.println(nextRoundMatch.getNo());
			matchsDAO.updateCorner(nextRoundMatch);
		}

		
		
		return false;
	}
	
	@Transactional
	@Override
	public boolean saveMatchSchedule(Match match) {
		// TODO Auto-generated method stub
		Date startDate = match.getStartDate();
		match = matchsDAO.selectOne(match.getNo());
		match.setStartDate(startDate);
		
		return matchsDAO.update(match)==1;
	}
	
	@Transactional
	@Override
	public boolean startMatch(Match match) {
		// TODO Auto-generated method stub
		
		//�����¸� P�� ���ӻ��¸� MS ��
		match = matchsDAO.selectOne(match.getNo());
		match.setStatus("P");
		if(match.getRed()==null || match.getBlue()==null) {
			//�����۽� ���� �ϳ��ۿ� ������ - �����ڿ��� ������ó���Ұ����� ����� �״����� ������ó���ϴ� ajax ����
			return true;
		}else {
			match.setGameStatus("MS");
		}
		
		matchsDAO.update(match);
		return false;
		
	}
	
	@Transactional
	@Override
	public void winByDefault(Match match) {
		// TODO Auto-generated method stub
		//1.match���� ��������
		match = matchsDAO.selectOne(match.getNo());
		//2.�������� �ڳ� ���ϱ� : ���� �ƴ� �ڳ�
		int winnerId;
		if(match.getRed()!=null) {
			winnerId = match.getRed();
		}else {
			winnerId = match.getBlue();
		}
		
		//3.match�� status�� 'D' -> end�� win by default�� ���� ��Ⱑ ��������鼭, �������� ����
		match.setStatus("D");
		matchsDAO.update(match);
		
		
		//4.corner�� ��������� ������.
		int round = match.getRound()+1, matchNumber = (int)Math.ceil((double)match.getMatchNumber()/2.0);
		String corner = match.getMatchNumber()%2 == 1  ? "RED" : "BLUE";
		
		match.setRound(round);
		match.setMatchNumber(matchNumber);
		Match nextRoundMatch = matchsDAO.selectRoundMatch(match);
		
		
	
		//���尡 ������ winner������ update
		//���尡 ������ ���� insert
		if(nextRoundMatch == null) {
			//4.�����Ѵ�
			System.out.println("<<<inserted data>>>>");
			System.out.println(match.toString());
			if(corner.equals("RED")) {
				//Ȧ���� �¸����� red���� ����
				match.setRed(winnerId);
				match.setBlue(null);
			}else {
				//¦���� �¸����� blue���� ����
				match.setRed(null);
				match.setBlue(winnerId);
			}
			match.setStatus("B");
			match.setGameStatus(null);
			
			matchsDAO.insert(match);
		}else {
			
			System.out.println("<<<<<next round match data>>>>>");
			System.out.println(nextRoundMatch.toString());
			if(corner.equals("RED")) {
				//Ȧ���� �¸����� red���� ����
				nextRoundMatch.setRed(winnerId);
			}else {
				//¦���� �¸����� blue���� ����
				nextRoundMatch.setBlue(winnerId);
			}
			
			System.out.println(nextRoundMatch.getNo());
			matchsDAO.update(nextRoundMatch);
		}
		
	}
	
	@Override
	public void endFinalMatch(Match match) {
		// TODO Auto-generated method stub
		//1.����� ��ȣ ���
				match  = matchsDAO.selectOne(match.getNo());
				System.out.println("<<<original>>>");
				System.out.println(match.toString());
				int champion = 0;
				int semiChampion = 0;
				// ���ھ�, ���̸� ������
				Map<String, Object> resultMap = gamesDAO.selectMatchInfo(match);

				int redScore = ((BigDecimal) resultMap.get("RED_SCORE")).intValue(),
						blueScore = ((BigDecimal) resultMap.get("BLUE_SCORE")).intValue();
				String redNickname = (String) resultMap.get("RED"), blueNickname = (String) resultMap.get("BLUE");
				
				if(redScore > blueScore) {
					champion = match.getRed();
					semiChampion = match.getBlue();
				}else {
					champion = match.getBlue();
					semiChampion = match.getRed();
				}
				
				//2.���� match status end�� �����ϰ� ������Ʈ�ϱ�
				match.setStatus("E");
				match.setGameStatus(null);
				
				System.out.println("<<<<update info>>>>");
				System.out.println(match.toString());
				
				matchsDAO.update(match);
				
		//�� �ö� ���� �����Ƿ� ��������� �����Ű�� �ʴ´�.
				//���⿡ participantations�� �����ڵ��� ����� �����ϴ� ������ ����.
				//1���� ���� match���� ����� ���, 2���� 1���� �����, 3���� �������� �й��ڵ鳢�� �ٿ��� �����ϰų� �ƴϸ� �����̳� �̷��ɷ� ����ؾ߰����� �ð��̾����Ƿ� �׳� �� ������ 1����⿡�� �й��ѻ��
				//1��,2���� �� match���� ���������ѵ�, 3���� ��ȸ�ؾ���.
				
				match.setRound(match.getRound()-1);
				//matchNumber �������ϴ� ���� : ������ ���̺پ �ö󰡴� ��ʸ�Ʈ�� �ᱹ 4���� 2���, ����� 1���ϱ�... 
				match = matchsDAO.selectRoundMatch(match);
				int third;
				if(match.getRed()==champion | match.getRed() == semiChampion)
					third = match.getBlue();
				else {
					third = match.getRed();
				}
				int[] partNos = {champion, semiChampion, third};

				Participation part = new Participation();
				part.setGrndNo(match.getGrndNo());
				part.setGrndNum(match.getGrndNum());
				
				for(int rank=0; rank<partNos.length; rank++) {
					part.setUserNo(partNos[rank]);
					part.setRank(rank+1);
					partsDAO.updateRank(part);
					
				}
				
				//��ȸ���� ����-�ϴ� ����
				
	}
	
	
	
	
	private Map<String, Object> getMatchBoxData(Match match) {
		Grandprix grnd = grandprixDAO.selectOne(new Grandprix(match.getGrndNo(), match.getGrndNum()));
		boolean isPartType = grnd.getPartType().equals("P"); // T : ������ , F : ����

		// match
		HashMap<String, Object> matchMap = new HashMap();
		matchMap.put("start", match.getTimeForm());
		matchMap.put("status", match.getStatus());
		matchMap.put("matchNum", match.getMatchNumber());
		matchMap.put("gameStatus", match.getGameStatus());
		matchMap.put("partType", match.getPartType());
		matchMap.put("matchNo", match.getNo());
		ArrayList<Map> corners = new ArrayList<Map>();

		int winnerId = 0;
		// ���ھ�, ���̸� ������
		Map<String, Object> resultMap = gamesDAO.selectMatchInfo(match);

		int redScore = ((BigDecimal) resultMap.get("RED_SCORE")).intValue(),
				blueScore = ((BigDecimal) resultMap.get("BLUE_SCORE")).intValue();
		String redNickname = (String) resultMap.get("RED"), blueNickname = (String) resultMap.get("BLUE");

		// ��Ⱑ ����� ������ ��� isWin �� �� ã��
		if (match.getStatus().equals("E")) {
			if (redScore > blueScore) {
				// A���� Win ǥ��
				winnerId = match.getRed();
			} else {
				winnerId = match.getBlue();
			}
		}
		if (isPartType) {
			// �������ΰ��
			Integer[] cornerIds = { match.getRed(), match.getBlue() };
			// red -> blue�� Ȥ��

			for (int i = 0; i < cornerIds.length; i++) {
				HashMap<String, Object> corner = new HashMap<String, Object>();
				if (cornerIds[i] == null) { // cornerID �� null�̸� 0�̴�, �� null�̴�
					corners.add(null);
				} else {
					String win = "";
					if (cornerIds[i] == winnerId) {
						win = "win";
					}
					corner.put("isWin", win);

					String name = "";
					int score = 0;
					if (cornerIds[i] == match.getRed()) {
						name = redNickname;
						score = redScore;
					} else {
						name = blueNickname;
						score = blueScore;
					}
					corner.put("name", name);// ��... ������
					corner.put("score", score);

					Map<String, ArrayList> team = new HashMap();

					ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
					Map<String, String> member = new HashMap<String, String>();
					member.put("name", name);
					members.add(member);
					team.put("members", members);

					ArrayList<Map<String, Object>> games = new ArrayList<Map<String, Object>>();

					Map<String, Integer> recordSelectParams = new HashMap<String, Integer>();
					recordSelectParams.put("matchNo", match.getNo());
					recordSelectParams.put("userNo", cornerIds[i]);
					List<Record> records = recordsDAO.selectList(recordSelectParams);

					for (Record record : records) {
						// �̰� �������̴ϱ� �̷��� �ص� ��
						Map<String, Object> game = new HashMap<String, Object>();

						ArrayList<Map<String, Object>> recordValues = new ArrayList<Map<String, Object>>();
						// �����̸� ���⼭�� for�������� ������ �־�߰�����
						Map<String, Object> recordValue = new HashMap<String, Object>();
						recordValue.put("name", name);
						recordValue.put("kill", record.getKill());
						recordValue.put("death", record.getDeath());
						recordValue.put("assi", record.getAssi());

						recordValues.add(recordValue);

						game.put("record", recordValues);
						games.add(game);
					}

					team.put("games", games);

					corner.put("team", team);

					corners.add(corner);
				}
			}

		} else {
			// ����
			// �ϴ��� �̷����
		}
		;
		matchMap.put("corners", corners);

		return matchMap;

	}
	
	
	
	
	
	
	@Override
	public void test() {
		// TODO Auto-generated method stub
		 Match match = matchsDAO.selectOne(4);
		 System.out.println(match.getNo());
		 System.out.println(match.getRed());
		 System.out.println(match.getBlue());
		 
		Map<String, Object> result = gamesDAO.selectMatchInfo(match);
		
	}

}
