package com.firedogs.grandpringles.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.firedogs.grandpringles.dao.BoardsDAO;
import com.firedogs.grandpringles.dao.CommentsDAO;
import com.firedogs.grandpringles.dao.LikingsDAO;
import com.firedogs.grandpringles.dao.MatchsDAO;
import com.firedogs.grandpringles.dao.UsersDAO;
import com.firedogs.grandpringles.util.PaginateUtil;
import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Comment;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Liking;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.User;

public class BoardsServiceImpl implements BoardsService {

	private BoardsDAO boardsDAO;
	private CommentsDAO commentsDAO;
	private LikingsDAO likingsDAO;
	private MatchsDAO matchsDAO;
	
	public void setBoardsDAO(BoardsDAO boardsDAO) {
		this.boardsDAO = boardsDAO;
	}
	
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	
	public void setLikingsDAO(LikingsDAO likingsDAO) {
		this.likingsDAO = likingsDAO;
	}
	
	public void setMatchsDAO(MatchsDAO matchsDAO) {
		this.matchsDAO = matchsDAO;
	}
	
	@Override
	public Map<String, Object> getBoards(int grndNo, int grndNum, String type, String order, int pageNo) {
		// TODO Auto-generated method stub
		
		// 한 페이지에 보여질 게시물 수
		int numPage = 3;
		// 하단에 <-1,2,3,4,5-> 갯수가 한 페이제 보여질 페이징 블록갯수
		int numBlock = 3;

		// 페이징 처리용 맵
		Map<String, Object> pageRange = new HashMap<String, Object>();

		int end = pageNo * numPage;
		int start = end - (numPage - 1);

		pageRange.put("grndNo", grndNo);
		pageRange.put("grndNum", grndNum);
		pageRange.put("start", start);
		pageRange.put("end", end);
		pageRange.put("type", type);
		pageRange.put("order", order);

		// 유저 목록
		List<Board> list = boardsDAO.boardList(pageRange);
		
		
		// 모델(View에 출력할)용 맵
		Map<String, Object> model = new HashMap<>();
		
		
		// 페이지네이션 처리
		int total = boardsDAO.total(pageRange);
		String url = "/"+grndNo+"/"+grndNum+"/community/"+type+"/"+order+"/page/";
				
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		model.put("grndNo", grndNo);
		model.put("grndNum", grndNum);		
		model.put("boards", list);
		model.put("type", type);
		model.put("order", order);
		model.put("page", pageNo);
		model.put("paginate", paginate);
				
		return model;
	}	

	@Override
	public Map<String, Object> getArticle(Board board) {
		
		
		// 조회수 갱신 
		boardsDAO.viewCount(board.getBoardNo());		
		
		// 게시글 상세 목록
		board = boardsDAO.selectArticle(board);
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNo", board.getBoardNo());
		map.put("order", "new");

		// 게시글의 댓글 목록
		List<Comment> list = commentsDAO.selectList(map);
	
		// TODO Auto-generated method stub
		// 모델(View에 출력할)용 맵
		Map<String, Object> post = new HashMap<>();
		
		post.put("article", board);
		post.put("comments", list);
		
		return post;
		
	}
	
	@Override
	public Map<String, Object> getBetting(Board board) {
		// TODO Auto-generated method stub
		// 조회수 갱신 
		boardsDAO.viewCount(board.getBoardNo());
		// 게시글 상세 목록
		board = boardsDAO.selectBetting(board);
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNo", board.getBoardNo());
		map.put("order", "new");

		// 게시글의 댓글 목록
		List<Comment> list = commentsDAO.selectList(map);
	
		// TODO Auto-generated method stub
		// 모델(View에 출력할)용 맵
		Map<String, Object> post = new HashMap<>();
		
		post.put("article", board);
		post.put("comments", list);
		
		return post;
	}
	
	@Override
	public Map<String, Object> likeBoard(int boardNo, String type, int userNo) {
		
		// liking라는 이름을 가진 객체하나를 만들고
		Liking liking = new Liking();
						
		// liking에 type이랑, 유저번호랑, 게시물 번호를 setting함
		liking.setType(type);
		liking.setUserNo(userNo);
		liking.setContentId(boardNo);

		// 추천 갯수를 확인
		int confirm = likingsDAO.getLiking(liking);
		
		// 변수 초기화
		int result = 0;
		
		if(confirm==0) {
					
			// 해당 정보를 insert한다.
			likingsDAO.insert(liking);
						
			// 추천 갯수를 1개 늘려주고 이를 수정하고
			boardsDAO.plusLike(boardNo);
						
			// 추천 수를 뽑는 SQL
			result = boardsDAO.getBoardLike(boardNo);			
					
		} else {
					
			//DB의 정보를 삭제하고
			likingsDAO.removeLiking(liking);
					
			// 추천 갯수를 1개 줄어들고 이를 수정하고
			boardsDAO.minusLike(boardNo);
				
			// 추천 수를 뽑는 SQL
			result = boardsDAO.getBoardLike(boardNo);

		}
		
		
		// TODO Auto-generated method stub
				// 모델(View에 출력할)용 맵
		Map<String, Object> map = new HashMap<>();
		
		map.put("count", result);
		map.put("isLike", confirm==0);
		
		return map;

	}
	
	@Override
	public Map<String, Object> likeComment(int boardNo, String type, int userNo, int commentNo) {
		// TODO Auto-generated method stub
		
		// liking라는 이름을 가진 객체하나를 만들고
		Liking liking = new Liking();

		
		// liking에 type이랑, 유저번호랑, 게시물 번호를 setting함
		liking.setType(type);
		liking.setUserNo(userNo);
		liking.setContentId(commentNo);
				
		// comment 객체에 유저 번호랑 게시물 번호를 setting함
		Comment comment = new Comment();
		comment.setUserNo(userNo);
		comment.setBoardNo(boardNo);

		// 댓글 번호 세팅
		comment.setNo(commentNo);			

		// 변수 초기화
		int result = 0;
		
		// 댓글 추천 갯수를 가져오는 SQL
		int confirm = likingsDAO.getLiking(liking);
				
		System.out.println("해당 댓글에 해당 사용자가 추천한 수 :"+confirm);
		if(confirm==0) {
					
			// 해당 정보를 insert한다.
			likingsDAO.insert(liking);	
								
			// 댓글 좋아요 숫자를 1개 늘려 준다.
			commentsDAO.add(commentNo);
	
			// 추천 수를 뽑는 SQL
			result = commentsDAO.searchLikes(commentNo); 			
					
		} else {
					
			// DB정보를 삭제하고
			likingsDAO.removeLiking(liking);
					
			// 추천 갯수를 1개 줄어들고 이를 수정하고
			commentsDAO.sub(commentNo);
											
			result = commentsDAO.searchLikes(commentNo);
		}			
		
		// TODO Auto-generated method stub
		// 모델(View에 출력할)용 맵
		Map<String, Object> map = new HashMap<>();
		
		map.put("count", result);
		map.put("isLike", confirm==0);
		
		return map;
	}
	
	@Override
	public int addComment(String content, int boardNo, int userNo, String nickname, String profile) {
		// TODO Auto-generated method stub
		
		// Comment 객체 생성
		Comment comment = new Comment();
		
		// 필요한 정보들을 직접 setter
		comment.setNickname(nickname);
		comment.setProfile(profile);
		comment.setUserNo(userNo);
		comment.setBoardNo(boardNo);
		comment.setContent(content);
		
		// 해당 정보를 insert 한다.
		int result = commentsDAO.insertComment(comment);
			
/*		// 해당 정보를 추가한 댓글 리스트를 다시 출력한다.
		List<Comment> commentList = commentsDAO.selectList(boardNo); 
		
		return commentList;*/
		return result;
	}
	
	@Override
	public List<Comment> getComments(int boardNo, String order) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardNo", boardNo);
		map.put("order", order);
		
		return commentsDAO.selectList(map);
		
	}
	
	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return boardsDAO.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return boardsDAO.updateBoard(board);
	}
	
	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub		
		
		// 추천 DB 정보 삭제
		likingsDAO.removeBoardsLike(no);
		likingsDAO.removeCommentsLike(no);
		
		// 댓글 DB 정보 삭제
		commentsDAO.deleteComments(no);
		
		// 게시판 DB 정보 삭제
		int result = boardsDAO.deleteBoard(no);
		
		
		return result;
	}
	
	@Override
	public List<Match> selectList(Grandprix grandprix) {
		// TODO Auto-generated method stub
		
		return matchsDAO.getMatchs(grandprix);
	}
}
