package com.firedogs.grandpringles.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firedogs.grandpringles.service.GrandManagementService;
import com.firedogs.grandpringles.service.GrandprixesService;
import com.firedogs.grandpringles.service.ShowGrndInfoService;
import com.firedogs.grandpringles.vo.AnnounceUpdateLog;
import com.firedogs.grandpringles.vo.Board;
import com.firedogs.grandpringles.vo.Game;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.Match;
import com.firedogs.grandpringles.vo.ParticipantApplication;
import com.firedogs.grandpringles.vo.Participation;
import com.firedogs.grandpringles.vo.User;


//임시 컨트롤러이름.
@Controller
public class TmpController {
	//Service 의존성 주입 블록
	private ShowGrndInfoService showGrndInfoService;
	public void setShowGrndInfoService(ShowGrndInfoService showGrndInfoService) {
		this.showGrndInfoService = showGrndInfoService;
	}
	private GrandManagementService grandManagementService;
	public void setGrandManagementService(GrandManagementService grandManagementService) {
		this.grandManagementService = grandManagementService;
	}
	private GrandprixesService grandprixesService;
	public void setGrandprixesService(GrandprixesService grandprixesService) {
		this.grandprixesService = grandprixesService;
	}
	//Service 의존성주입 블록 끝
	
	//main 첫화면
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String grndMain(Model model) {
		
		model.addAllAttributes(showGrndInfoService.getMainContents());
		
		return "main";
	}
	
	//main ajax
	@RequestMapping(value="/ajax/mainGrandprixContent.json",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> mainGrandprixContent(int grndNo){
		return showGrndInfoService.getMainContents(grndNo);
	}
	@RequestMapping(value="/ajax/streamerList.json",method=RequestMethod.GET)
	@ResponseBody
	public List<User> streamerList(@RequestParam(defaultValue="") String nickname){
		return showGrndInfoService.getStreamerList(nickname);
	}
	
	@RequestMapping(value="/ajax/manageTest.json",method=RequestMethod.GET)
	@ResponseBody
	public String sdfsf(){
		return "[\r\n" + 
				"    {\r\n" + 
				"        \"who\":\r\n" + 
				"        {\r\n" + 
				"            \"userNickname\": \"관리자4\",\r\n" + 
				"            \"userImg\": \"img/template_default_user_logo.png\"\r\n" + 
				"        },\r\n" + 
				"        \"what\":\r\n" + 
				"        {\r\n" + 
				"            \"changeType\": 4,\r\n" + 
				"            \"startDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 3\r\n" + 
				"            },\r\n" + 
				"            \"endDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 13\r\n" + 
				"            },\r\n" + 
				"            \"startTime\":\r\n" + 
				"            {\r\n" + 
				"                \"hour\": 21,\r\n" + 
				"                \"minute\": 45\r\n" + 
				"            }\r\n" + 
				"        },\r\n" + 
				"        \"updateDate\": \"2018년 4월 2일 22:45:23\"\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"who\":\r\n" + 
				"        {\r\n" + 
				"            \"userNickname\": \"관리자3\",\r\n" + 
				"            \"userImg\": \"img/template_default_user_logo.png\"\r\n" + 
				"        },\r\n" + 
				"        \"what\":\r\n" + 
				"        {\r\n" + 
				"            \"changeType\": 3,\r\n" + 
				"            \"startDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 3\r\n" + 
				"            },\r\n" + 
				"            \"endDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 10\r\n" + 
				"            },\r\n" + 
				"            \"startTime\":\r\n" + 
				"            {\r\n" + 
				"                \"hour\": 16,\r\n" + 
				"                \"minute\": 30\r\n" + 
				"            }\r\n" + 
				"        },\r\n" + 
				"        \"updateDate\": \"2018년 4월 2일 21:45:23\"\r\n" + 
				"\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"who\":\r\n" + 
				"        {\r\n" + 
				"            \"userNickname\": \"관리자2\",\r\n" + 
				"            \"userImg\": \"img/template_default_user_logo.png\"\r\n" + 
				"        },\r\n" + 
				"        \"what\":\r\n" + 
				"        {\r\n" + 
				"            \"changeType\": 2,\r\n" + 
				"            \"startDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 4\r\n" + 
				"            },\r\n" + 
				"            \"endDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 9\r\n" + 
				"            },\r\n" + 
				"            \"startTime\":\r\n" + 
				"            {\r\n" + 
				"                \"hour\": 16,\r\n" + 
				"                \"minute\": 30\r\n" + 
				"            }\r\n" + 
				"        },\r\n" + 
				"        \"updateDate\": \"2018년 4월 2일 20:45:23\"\r\n" + 
				"\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"who\":\r\n" + 
				"        {\r\n" + 
				"            \"userNickname\": \"관리자1\",\r\n" + 
				"            \"userImg\": \"img/template_default_user_logo.png\"\r\n" + 
				"        },\r\n" + 
				"        \"what\":\r\n" + 
				"        {\r\n" + 
				"            \"changeType\": 1,\r\n" + 
				"            \"startDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 4\r\n" + 
				"            },\r\n" + 
				"            \"endDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 13\r\n" + 
				"            },\r\n" + 
				"            \"startTime\":\r\n" + 
				"            {\r\n" + 
				"                \"hour\": 16,\r\n" + 
				"                \"minute\": 30\r\n" + 
				"            }\r\n" + 
				"        },\r\n" + 
				"        \"updateDate\": \"2018년 4월 2일 19:45:23\"\r\n" + 
				"\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"who\":\r\n" + 
				"        {\r\n" + 
				"            \"userNickname\": \"개최자\",\r\n" + 
				"            \"userImg\": \"img/template_default_user_logo.png\"\r\n" + 
				"        },\r\n" + 
				"        \"what\":\r\n" + 
				"        {\r\n" + 
				"            \"changeType\": 0,\r\n" + 
				"            \"startDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 3\r\n" + 
				"            },\r\n" + 
				"            \"endDate\":\r\n" + 
				"            {\r\n" + 
				"                \"year\": 2018,\r\n" + 
				"                \"month\": 4,\r\n" + 
				"                \"day\": 13\r\n" + 
				"            },\r\n" + 
				"            \"startTime\":\r\n" + 
				"            {\r\n" + 
				"                \"hour\": 16,\r\n" + 
				"                \"minute\": 30\r\n" + 
				"            }\r\n" + 
				"        },\r\n" + 
				"        \"updateDate\": \"2018년 4월 2일 17:45:23\"\r\n" + 
				"\r\n" + 
				"    }\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"]";
	}
	
	//managementAnnounce
	// /{grndNo}/{num}/community/{type}/{boardNo}
	@RequestMapping(value="/{grndNo}/{num}/management/announce_log",method=RequestMethod.GET)
	public String manageAnn(Model model, @PathVariable int grndNo, @PathVariable int num) {
		model.addAllAttributes(grandManagementService.getAnnounceUpdateLogs(new Grandprix(grndNo, num)));
		return "managementGrandprix_Announce";
	}
	
	//수정없어 POST 
	@RequestMapping(value="/management/announce_log",method=RequestMethod.POST)
	@ResponseBody
	public String updateAnn(AnnounceUpdateLog log) {
		grandManagementService.updateAnnounce(log);
		return "{}";
	}
	
	
	@RequestMapping(value="/{grndNo}/{num}/management/participations", method=RequestMethod.GET)
	public String manageParts(Model model,@PathVariable int grndNo,@PathVariable int num,int applyPage,int partPage) {
		model.addAllAttributes(grandManagementService.getParticipationInfo(applyPage, partPage, grndNo, num));
		return "managementGrandprix_Participations";
	}
	
	
	@RequestMapping(value="/userApplications.json", method=RequestMethod.GET)
	@ResponseBody
	public List<ParticipantApplication> userApplications(Participation applicant) {
		return grandManagementService.getApplyInfo(applicant);
	}
	
	//REST로 변경시 PUT
	@RequestMapping(value="/changePartsLimit.json", method=RequestMethod.GET)
	@ResponseBody
	public String changePartLimit(Grandprix grnd) {
		boolean isSuccess = grandManagementService.changeMaxParts(grnd);
		//grandManagementService.changePartsLimit(limit)
		return "{\"isSuccess\":"+isSuccess+"}";
	}
	
	//REST로 변경시 PUT
	@RequestMapping(value="/partConfirm.grnd", method=RequestMethod.POST)
	public String sdfdsf(Participation partInfo, int partPage, int applyPage,  RedirectAttributes ra) {
		if(!grandManagementService.partConfirm(partInfo)) {
			ra.addFlashAttribute("isConfirmFail",true);
		}
		return "redirect:/"+partInfo.getGrndNo()+"/"+partInfo.getGrndNum()+"/management/participations?applyPage="+applyPage+"&partPage="+partPage;
	}
	//REST로 변경시 DELETE
	@RequestMapping(value="/partReject.grnd", method=RequestMethod.POST)
	public String sdfsdf(Participation partInfo, int partPage, int applyPage, RedirectAttributes ra) {
		if(!grandManagementService.partReject(partInfo)) {
			ra.addFlashAttribute("isRejectFail",true);
		}
		return "redirect:/"+partInfo.getGrndNo()+"/"+partInfo.getGrndNum()+"/management/participations?applyPage="+applyPage+"&partPage="+partPage;
	}
	
	//REST로 변경시 DELETE
	@RequestMapping(value="/extinguishParts.grnd", method=RequestMethod.POST)
	public String afdsfsdfwe(Grandprix grnd, int partPage, int applyPage, int[] userNo, RedirectAttributes ra) {
		grandManagementService.extinguishParts(userNo, grnd);
		return "redirect:/"+grnd.getGrndNo()+"/"+grnd.getNum()+"/management/participations?applyPage="+applyPage+"&partPage="+partPage;
	}
	
	@RequestMapping(value="/{grndNo}/{num}/management/schedule", method=RequestMethod.GET)
	public String getrhregfdg(@PathVariable int grndNo, @PathVariable int num, Model model) {
		model.addAllAttributes(grandprixesService.getGrandprixInfos(new Grandprix(grndNo, num)));
		return "managementGrandprix_Schedule";
	}
	@RequestMapping(value="/{grndNo}/{num}/management/prixes", method=RequestMethod.GET)
	public String getrhregsdfsfdg(@PathVariable int grndNo, @PathVariable int num, Model model) {
		model.addAllAttributes(grandprixesService.getGrandprixInfos(new Grandprix(grndNo, num)));
		return "managementGrandprix_Prixes";
	}
	
	@RequestMapping(value="/{grndNo}/{num}/management/match_chart", method=RequestMethod.GET)
	public String sdfdsfdsf(@PathVariable int grndNo, @PathVariable int num, Model model) {
		model.addAllAttributes(grandprixesService.getGrandprixInfos(new Grandprix(grndNo, num)));
		return "managementGrandprix_Match";
	}
	
	@RequestMapping(value="/matchChart.json", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> sdfewfewt(Grandprix grnd){
		//객체명 competInfo
		//해당 대회 정보를 조회할 Grandprix 객체
		return grandManagementService.getManageMatchChart(grnd);
	}
	
	
	//'다음게임 생성' 눌렀을때 다음 Game 을 생성하는 url
	@RequestMapping(value="/makeNextGame.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dsfewfwge(Match match) {
		//반환하는건 갈아끼울 Match를 그릴 Map
		return grandManagementService.createNextGame(match);
	}
	
	@RequestMapping(value="/cancelGame.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dsfewghrre(Match match){
		return grandManagementService.cancelGame(match);
	}
	
	@RequestMapping(value="/startGame.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> dsfewgrehbtrhg(Match match){
		return grandManagementService.startGame(match);
	}
	
	@RequestMapping(value="/saveScore.json", method=RequestMethod.POST)
	@ResponseBody
	public String fewregewf(Game game, int[] redScore, int[] blueScore) {
		return "{\"status\":"+grandManagementService.saveScore(game, redScore, blueScore)+"}";
	}
	
	
	@RequestMapping(value="/endGame.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> egthwedrg(Game game, int[] redScore, int[] blueScore, String winner) {
		Map<String , Object> result = new HashMap<>();
		
		result.put("matchNo", game.getMatchNo());
		result.put("seq", game.getSeq());
		result.put("redScore", redScore);
		result.put("blueScore", blueScore);
		result.put("winner", winner);
		
		
		return grandManagementService.endGame(game, redScore, blueScore,winner);
	}
	
	
	@RequestMapping(value="/endMatch.json", method=RequestMethod.POST)
	@ResponseBody
	public String rghtrjhfsd(Match match) {
		grandManagementService.endMatch(match);
		return "{}";
	}
	
	@RequestMapping(value="/saveMatchSchedule.json", method=RequestMethod.POST)
	@ResponseBody
	public String rgrehtynfd(Match match) {
		return "{\"status\":"+grandManagementService.saveMatchSchedule(match)+"}";
	}
	
	@RequestMapping(value="/startMatch.json", method=RequestMethod.POST)
	@ResponseBody
	public String qweqwewqe(Match match) {
		
		return "{\"isDefault\":"+grandManagementService.startMatch(match)+"}";
	}
	
	//부전승처리
	@RequestMapping(value="/winByDefault.json", method=RequestMethod.POST)
	@ResponseBody
	public String ertehrf(Match match) {
		grandManagementService.winByDefault(match);
		return "{}";
	}
	
	//결승전 경기종료 처리
	@RequestMapping(value="/endFinalMatch.grnd", method=RequestMethod.POST)
	@ResponseBody
	public String ghbfbfdfdsf(Match match) {
		grandManagementService.endFinalMatch(match);
		return "{}";
	}
	
	
	
	
	
	@RequestMapping(value="/test.grnd", method=RequestMethod.GET)
	public String test(Model model,
			@RequestParam(defaultValue="4") int no) {
		grandManagementService.test();
		return "test";
	}
}
