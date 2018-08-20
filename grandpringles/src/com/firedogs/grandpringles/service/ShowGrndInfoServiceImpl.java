package com.firedogs.grandpringles.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.dao.BoardsDAO;
import com.firedogs.grandpringles.dao.GrandprixNamesDAO;
import com.firedogs.grandpringles.dao.GrandprixesDAO;
import com.firedogs.grandpringles.dao.UsersDAO;
import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.PageVO;
import com.firedogs.grandpringles.vo.User;

public class ShowGrndInfoServiceImpl implements ShowGrndInfoService{
	//DAO의존성 주입블록
	private BoardsDAO boardsDAO;
	public void setBoardsDAO(BoardsDAO boardsDAO) {
		this.boardsDAO = boardsDAO;
	}
	private GrandprixNamesDAO grandprixNamesDAO;
	public void setGrandprixNamesDAO(GrandprixNamesDAO grandprixNamesDAO) {
		this.grandprixNamesDAO = grandprixNamesDAO;
	}
	private GrandprixesDAO grandprixesDAO;
	public void setGrandprixesDAO(GrandprixesDAO grandprixesDAO) {
		this.grandprixesDAO = grandprixesDAO;
	}
	private UsersDAO usersDAO;
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	//DAO의존성 주입블록 끝
	
	public Map<String,Object> getMainContents(){
		Map<String,Object> mainContents = new HashMap<>();
		
		//1.메인에 표시할 대회리스트 불러오기(지금은 수정안함, 나중에 다른페이지에서도 쓰이는지 물어보고 수정:Map이든 Grandprix vo에 멤버필드추가든)
		List<Grandprix> grndList = grandprixesDAO.selectRecentGrandprixesList();
		//진행중인 대회가 있으면 컨텐츠들 추가
		if(grndList.size()==0) {
			mainContents.put("isEmpty", true);
		}else {
		//2.첫번째 대회 정보 불러오기
		//-선택된 리스트중 첫번째대회의 정보를 첫화면에 보여줄것이기때문에(다른대회들은 클릭했을때 ajax로) 첫대회정보를 씀
		Grandprix grandprix = grndList.get(0);
		int grndNo = grandprix.getGrndNo();
		//3.첫번째 게임대회 이름 갖고오기
		GrandprixName grndName = grandprixNamesDAO.selectName(grndNo); 
		//4.첫번째 게임대회 새 게시글 리스트 얻어오기
		List<Board> boardNew = boardsDAO.boardNew(grndNo);
		//5.첫번째 게임대회 인기글 리스트 얻어오기
		List<Board> boardPopular = boardsDAO.boardPopular(grndNo);
		
		//6.메인컨텐츠에 추가
		mainContents.put("grndList", grndList);
		mainContents.put("grandprix", grandprix);
		mainContents.put("grndName", grndName);
		mainContents.put("boardNew", boardNew);
		mainContents.put("boardPopular", boardPopular);
		}
		return mainContents;
	}
	
	@Override
	public Map<String,Object> getMainContents(int grndNo) {
		// TODO Auto-generated method stub
		Map<String,Object> mainContents = new HashMap<>();
		
		//리스트얻어오는거빼곤 다 똑같네;;
		Grandprix grandprix = grandprixesDAO.selecRecentGrnd(grndNo);
		GrandprixName grndName = grandprixNamesDAO.selectName(grndNo); 
		List<Board> boardNew = boardsDAO.boardNew(grndNo);
		List<Board> boardPopular = boardsDAO.boardPopular(grndNo);
		
		mainContents.put("grandprix", grandprix);
		mainContents.put("grndName", grndName);
		mainContents.put("boardNew", boardNew);
		mainContents.put("boardPopular", boardPopular);
		
		return mainContents;
	}
	
	@Override
	public List<User> getStreamerList(String nickname) {
		// TODO Auto-generated method stub
		if(nickname.equals("")) {
			return usersDAO.selectStreamer();
		}else {
			return usersDAO.selectStreamer(nickname);
		}
	}
	
	
}
