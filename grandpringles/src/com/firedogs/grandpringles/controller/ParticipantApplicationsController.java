package com.firedogs.grandpringles.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.firedogs.grandpringles.dao.GrandprixesDAO;
import com.firedogs.grandpringles.fileupload.MultiImageUpload;
import com.firedogs.grandpringles.service.GrandprixNamesService;
import com.firedogs.grandpringles.service.GrandprixesService;
import com.firedogs.grandpringles.service.ParticipantApplicationsService;
import com.firedogs.grandpringles.service.ParticipantConditionService;
import com.firedogs.grandpringles.service.ParticipationsService;
import com.firedogs.grandpringles.service.TeamsSerivice;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Participation;
import com.firedogs.grandpringles.vo.Team;
import com.firedogs.grandpringles.vo.TeamMember;


@Controller
public class ParticipantApplicationsController {

	
	
	private ParticipantApplicationsService applicationsService;
	private GrandprixNamesService grandprixNamesService; 
	private ParticipantConditionService participantConditionService;
	private ParticipationsService participationsService;
	private TeamsSerivice teamsSerivice;

	
	
	
	public void setParticipationsService(ParticipationsService participationsService) {
		this.participationsService = participationsService;
	}
	
	public void setParticipantConditionService(ParticipantConditionService participantConditionService) {
		this.participantConditionService = participantConditionService;
	}
	public void setApplicationsService(ParticipantApplicationsService applicationsService) {
		this.applicationsService = applicationsService;
	}
	public void setGrandprixNamesService(GrandprixNamesService grandprixNamesService) {
		this.grandprixNamesService = grandprixNamesService;
	}
	public void setTeamsSerivice(TeamsSerivice teamsSerivice) {
		this.teamsSerivice = teamsSerivice;
	}


	
	//솔로팀 
	@RequestMapping(value = "/{grndNo}/{grndNum}/{userNo}/Participant/Solo",method=RequestMethod.GET)
	public String participationSolo(Model model,Grandprix grandprix , ParticipantCondition participantCondition,Participation participation,@PathVariable int userNo ,
			@PathVariable int grndNo,@PathVariable int grndNum
			) {

		grandprix.setGrndNo(grndNo);
		grandprix.setNum(grndNum);
		

		
		participantCondition.setGrndNo(grandprix.getGrndNo());
 
		participantCondition.setGrndNum(grandprix.getNum());
		participation.setGrndNo(grandprix.getGrndNo());
		participation.setGrndNum(grandprix.getNum());
		participation.setUserNo(userNo);

		model.addAttribute("conditions", participantConditionService.getParticipantCondition(participantCondition));
		model.addAttribute("grandprix", applicationsService.getAnnounce(grandprix));
		model.addAttribute("grandprixName",grandprixNamesService.getName(grandprix.getGrndNo()));
		model.addAttribute("applicationTF",participationsService.applicationTF(participation));
		return "participation_Solo";
	}
	
	
	
	@RequestMapping(value = "/Participant",method=RequestMethod.POST)
	public String participationSoloInsert(Grandprix grandprix ,String[] content ,String[] imageTF, MultiImageUpload paticipationImage  ,Participation participation,BindingResult result,
			HttpServletRequest request) {
		ServletContext context = 
				request.getServletContext();
		
		String path = 
				context.getRealPath("img");
		
		String uploadPath = 
				path+File.separator+"upload"
				+File.separator;
		
		String applicationPath = 
				path+File.separator+"Application"
				+File.separator;
		
		
		participationsService.participationAdd(grandprix,content,imageTF,paticipationImage,participation,uploadPath,applicationPath);
		
		return "redirect:/"+grandprix.getGrndNo()+"/"+grandprix.getNum()+"/"+participation.getUserNo()+"/Participant/Team";
	}
	
	//��û����ϱ�
	@RequestMapping(value = "/Participant" ,method=RequestMethod.DELETE)
	public String participationDelete(Grandprix grandprix , ParticipantCondition participantCondition ,Participation participation) {
		

		participationsService.participationRemove(grandprix,participantCondition,participation);

		
		return "redirect:/"+grandprix.getGrndNo()+"/"+grandprix.getNum()+"/"+participation.getUserNo()+"/Participant/Team";
	}

	/*---------------------------------------------------------------------------------------------------------------*/

	//팀참가
	@RequestMapping(value = "/{grndNo}/{grndNum}/{userNo}/Participant/Team",method=RequestMethod.GET)
	public String participationTeam(Model model,Grandprix grandprix , ParticipantCondition participantCondition,Participation participation, Team team,
			@PathVariable int grndNo,@PathVariable int grndNum,@PathVariable int userNo) {
		
		grandprix.setGrndNo(grndNo);
		grandprix.setNum(grndNum);

	
		
		participantCondition.setGrndNo(grandprix.getGrndNo());
		participantCondition.setGrndNum(grandprix.getNum());
		participation.setGrndNo(grandprix.getGrndNo());
		participation.setGrndNum(grandprix.getNum());
		participation.setUserNo(userNo);
		
		team.setGrndNo(grandprix.getGrndNo());
		team.setGrndNum(grandprix.getNum());
		
		model.addAttribute("conditions", participantConditionService.getParticipantCondition(participantCondition));
		model.addAttribute("grandprix", applicationsService.getAnnounce(grandprix));
		model.addAttribute("grandprixName",grandprixNamesService.getName(grandprix.getGrndNo()));
		model.addAttribute("applicationTF",participationsService.applicationTF(participation));
		model.addAttribute("teams", teamsSerivice.getTeams(team));
		
		
		return "participation_Team";
	}
	
	//���� ��� �����ִ� ajax
	@RequestMapping(value = "/ajax/TeamMemberList" ,method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public @ResponseBody String teamMemberList(TeamMember teamMember) throws JsonProcessingException {
		


		Map<String, Object> map = new HashMap<>();
		map.put("teams", teamsSerivice.getTeamMember(teamMember));
		map.put("count", teamsSerivice.getMemberCount(teamMember));

		if(teamMember.getMemberNo()!=0) {

			try {
				if(teamMember.getLeaderNo()==teamMember.getMemberNo() ) {
					System.out.println("test");
					map.put("leaderTF",true);
				}
				map.put("attendTF", teamsSerivice.memberTF(teamMember));
			} catch (Exception e) {
				map.put("attendTF", false);
			}

		}else {

			map.put("attendTF", false);
		}

		String json = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(map);
		
		return json;
	}

	//���� ���� �߰��ϴ� ajax
	@RequestMapping(value = "/ajax/TeamMemberInsert" ,method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public @ResponseBody String teamMemberInsert(TeamMember teamMember,Team team ) throws JsonProcessingException {

		Map<String, Object> map = new HashMap<>();

		boolean result = teamsSerivice.teamConfirm(team);
		if(result) {
			teamsSerivice.addMember(teamMember);
		}
		map.put("result", result);
		String json = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(map);

		return json;
	}

	//����
	@RequestMapping(value = "/ajax/deleteTeam" ,method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public @ResponseBody String deleteTeam(TeamMember teamMember,Team team ) throws JsonProcessingException {
		Map<String, Object> map = new HashMap<>();

		if(teamMember.getLeaderNo()==teamMember.getMemberNo() ) {

			teamsSerivice.removeTeamMember(teamMember);
			teamsSerivice.removeTeam(team);
			return "redirect:/Participant/Team";

		} else {

			teamsSerivice.removeMember(teamMember);
		}
		String json = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(map);

		return json;
	}
	
	//�������
	@RequestMapping(value = "/Participant/Team" ,method=RequestMethod.POST)
	public String makeTeam(TeamMember teamMember,Team team,MultipartFile upload,BindingResult result,HttpServletRequest request) {
		
		ServletContext context = 
				request.getServletContext();
		//��Ĺ�� img���� ���
		String path = 
				context.getRealPath("img");
		//upload���(����)
		String uploadPath = 
				path+File.separator+"upload"
				+File.separator;
		//poster���(������ 60 * 60)
		String teamLogoPath = 
				path+File.separator+"teamLogo"
				+File.separator;
		
		teamsSerivice.addTeam(team,uploadPath,teamLogoPath,upload,teamMember);
		
		return "redirect:/"+team.getGrndNo()+"/"+team.getGrndNum()+"/"+team.getLeaderNo()+"/Participant/Team";
		
	}

	
}
