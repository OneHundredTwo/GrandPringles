package com.firedogs.grandpringles.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.vo.Team;
import com.firedogs.grandpringles.vo.TeamMember;

public interface TeamsSerivice {
	
	public List<Team> getTeams(Team team);
	public List<TeamMember> getTeamMember(TeamMember teamMember);
	public int getMemberCount(TeamMember teamMember);
	
	public boolean addMember(TeamMember teamMember);
	public boolean addTeam(Team team,String uploadPath,String teamLogoPath,MultipartFile upload,TeamMember teamMember);
	
	public boolean teamConfirm(Team team);
	public boolean memberTF(TeamMember teamMember);
	
	public int removeMember(TeamMember teamMember);
	public int removeTeamMember(TeamMember teamMember);
	public int removeTeam(Team team);

}
