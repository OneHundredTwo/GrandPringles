package com.firedogs.grandpringles.dao;

import java.util.List;

import com.firedogs.grandpringles.vo.Team;
import com.firedogs.grandpringles.vo.TeamMember;

public interface TeamsDAO {
	
	public List<Team> selectList(Team team);
	public List<TeamMember> selectList(TeamMember teamMember);
	public int memeberCount(TeamMember teamMember);
	
	public int insert(TeamMember teamMember);
	
	public int teamConfirm(Team team);
	
	public int memberTF(TeamMember teamMember);
	
	public int deleteMember(TeamMember teamMember);
	public int deleteTeamMember(TeamMember teamMember);
	public int deleteTeam(Team team);
	
	public int insertTeam(Team team);
}
