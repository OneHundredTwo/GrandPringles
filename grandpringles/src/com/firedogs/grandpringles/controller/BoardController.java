package com.firedogs.grandpringles.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.firedogs.grandpringles.service.BoardsService;
import com.firedogs.grandpringles.service.GrandprixNamesService;
import com.firedogs.grandpringles.service.GrandprixesService;
import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Comment;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.User;

@Controller
public class BoardController {

	private BoardsService boardsService;
	private GrandprixNamesService grandprixNamesService;
	private GrandprixesService grandprixesService;
	
	public void setBoardsService(BoardsService boardsService) {
		this.boardsService = boardsService;
	}
	
	public void setGrandprixNamesService(GrandprixNamesService grandprixNamesService) {
		this.grandprixNamesService = grandprixNamesService;
	}
	
	public void setGrandprixesService(GrandprixesService grandprixesService) {
		this.grandprixesService = grandprixesService;
	}
	
	// GET 커뮤니티 게시판
	@RequestMapping(value="/{grndNo}/{grndNum}/community/{type}/{order}/page/{pageNo}", method=RequestMethod.GET)
	public String boardsForm(@PathVariable int grndNo, @PathVariable int grndNum, @PathVariable String type, @PathVariable String order,@PathVariable int pageNo, Model model) {				
		model.addAllAttributes(boardsService.getBoards(grndNo, grndNum, type, order, pageNo));
		model.addAttribute("grndName", grandprixNamesService.getName(grndNo));
		model.addAttribute("grndInfo", grandprixesService.selectGrandprixesNoM(grndNo));
		model.addAttribute("grandprix", grandprixesService.getOneGrnd(new Grandprix(grndNo, grndNum)));
		
		model.addAttribute("name", grandprixesService.getGrndName(grndNo));
		return "community_Board";
	}

	// 상세글
	@RequestMapping(value="/{grndNo}/{grndNum}/community/{type}/{boardNo}", method=RequestMethod.GET)
	public String boardDetail(@PathVariable int grndNo, @PathVariable int grndNum, @PathVariable String type, @PathVariable int boardNo, Model model, Board board) {			
		Map<String, Object> post = new HashMap<>();
		
		Board detail = new Board();
		detail.setGrndNo(grndNo);
		detail.setGrndNum(grndNum);
		detail.setBoardNo(boardNo);
		
		post = boardsService.getArticle(detail);
		board = (Board)post.get("article");
	
		model.addAttribute("grndName", grandprixNamesService.getName(grndNo));
		model.addAttribute("grndInfo", grandprixesService.selectGrandprixesNoM(grndNo));
		model.addAttribute("grndNo",grndNo);
		model.addAttribute("grndNum",grndNum);
		model.addAttribute("grandprix", grandprixesService.getOneGrnd(new Grandprix(grndNo, grndNum)));

		model.addAttribute("name", grandprixesService.getGrndName(grndNo));
		
		if(board.getCategory().equals("B") && board.getBoardNo() <= 8) {	
			model.addAllAttributes(boardsService.getBetting(detail));
			return "community_Betting";
		} else if (board.getCategory().equals("B") && board.getBoardNo() > 8) {
			model.addAllAttributes(boardsService.getBetting(detail));
			return "community_Betting2";
		} else {
			model.addAllAttributes(boardsService.getArticle(detail));
			return "community_ArticleForm";
		}		
	}
	
	@RequestMapping(value="/ajax/boardLiking")
	@ResponseBody
	public Map<String, Object> boardLiking(int boardNo, String type, int userNo) {
				
		return boardsService.likeBoard(boardNo, type, userNo);
	}
	
	@RequestMapping(value="/ajax/commentLiking")
	@ResponseBody
	public Map<String, Object> commentLiking(int boardNo, String type, int userNo, int commentNo) {
		
		return boardsService.likeComment(boardNo, type, userNo, commentNo);
	}
	
	@RequestMapping(value="/ajax/addComment")
	@ResponseBody
	public String addComment(String content, int boardNo, int userNo, String nickname, String profile) {
	
		int result = boardsService.addComment(content, boardNo, userNo, nickname, profile);
		
		return "{\"result\":" +result + "}"; 
				
	}
	
	@RequestMapping(value="/ajax/getComments")
	@ResponseBody
	public List<Comment> getComments(int boardNo, String order) {
		return boardsService.getComments(boardNo, order);
	}
	
	
	
	// 글쓰기 폼으로 이동
	@RequestMapping(value="/{grndNo}/{grndNum}/community/writeForm", method=RequestMethod.GET)
	public String writeForm(@PathVariable int grndNo, @PathVariable int grndNum, Model model) {		
		
		Grandprix grandprix = new Grandprix();
			
		grandprix.setGrndNo(grndNo);
		grandprix.setNum(grndNum);
		
		List<Match> list = boardsService.selectList(grandprix);
		
		model.addAttribute("update",false);
		model.addAttribute("grndNo",grndNo);
		model.addAttribute("grndNum",grndNum);
		model.addAttribute("matchs",list);
		model.addAttribute("grandprix", grandprixesService.getOneGrnd(new Grandprix(grndNo, grndNum)));

		model.addAttribute("name", grandprixesService.getGrndName(grndNo));
		
		
		return "community_WriteForm";
	}
	
	// 글수정 폼으로 이동
	@RequestMapping(value="/{grndNo}/{grndNum}/community/updateForm", method=RequestMethod.POST)
	public String updateForm(@PathVariable int grndNo, @PathVariable int grndNum, int boardNo, RedirectAttributes ra, Model model) {		

		Grandprix grandprix = new Grandprix();
		
		Board detail = new Board();
		detail.setGrndNo(grndNo);
		detail.setGrndNum(grndNum);
		detail.setBoardNo(boardNo);
		
		grandprix.setGrndNo(grndNo);
		grandprix.setNum(grndNum);
		
		List<Match> list = boardsService.selectList(grandprix);
		
		model.addAttribute("update",true);
		model.addAttribute("matchs",list);
		model.addAllAttributes(boardsService.getArticle(detail));
		model.addAttribute("grandprix", grandprixesService.getOneGrnd(new Grandprix(grndNo, grndNum)));

		model.addAttribute("name", grandprixesService.getGrndName(grndNo));
		
		return "community_WriteForm";
	}	
	
	// 글쓰기 
	@RequestMapping(value="/ajax/write", method=RequestMethod.POST)
	@ResponseBody
	public String write(String title, String content, int grndNo, int grndNum, String category, int userNo, Integer matchNo) {	
		
		Board board = new Board();
		board.setUserNo(userNo);
		board.setGrndNo(grndNo);
		board.setGrndNum(grndNum);
		board.setContent(content);
		board.setTitle(title);
		board.setCategory(category);	
		board.setMatchNo(matchNo);
		
		boardsService.insertBoard(board);
			

		return "{\"no\":"+board.getBoardNo()+", \"grndNo\":"+grndNo+", \"grndNum\":"+grndNum+", \"category\":\""+category+"\"}";
	}
	
	// 글수정 
	@RequestMapping(value="/ajax/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(int boardNo, String title, String content, int grndNo, int grndNum, String category, int userNo, Integer matchNo) {		
			
		Board board = new Board();
		board.setBoardNo(boardNo);	
		board.setContent(content);
		board.setTitle(title);
		board.setCategory(category);	
		board.setMatchNo(matchNo);
			
		boardsService.updateBoard(board);
				

		return "{\"no\":"+boardNo+", \"grndNo\":"+grndNo+", \"grndNum\":"+grndNum+", \"category\":\""+category+"\"}";
	}
	
	// 글삭제
	@RequestMapping(value="/{grndNo}/{grndNum}/community/{category}/{boardNo}", method=RequestMethod.DELETE)
	public String delete(@PathVariable int grndNo, @PathVariable int grndNum, @PathVariable String category, @PathVariable int boardNo) {
		
		boardsService.deleteBoard(boardNo);
		
		if(category.equals("T")) {
			category="free";
		} else if(category.equals("M")) {
			category="media";
		} else if(category.equals("B")) {
			category="bet";
		} else if(category.equals("D")) {
			category="debate";
		}
		
		return "redirect:/"+grndNo+"/"+grndNum+"/community/"+category+"/new/page/1";
	}
	
}
