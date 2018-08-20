package com.firedogs.grandpringles.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.firedogs.grandpringles.vo.Team;
import com.firedogs.grandpringles.vo.TeamMember;

public class TeamsDAOImpl implements TeamsDAO{
	
	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Team> selectList(Team team) {
		// TODO Auto-generated method stub
		return session.selectList("teams.teamList", team);
	}
	
	@Override
	public List<TeamMember> selectList(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.selectList("team_members.selectTeamMemberList", teamMember);
	}
	
	@Override
	public int memeberCount(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.selectOne("team_members.MemberCount", teamMember);
	}
	
	@Override
	public int insert(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.insert("team_members.insert",teamMember);
	}
	
	@Override
	public int teamConfirm(Team team) {
		// TODO Auto-generated method stub
		return session.selectOne("teams.teamConfirm",team);
	}
	
	@Override
	public int memberTF(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.selectOne("team_members.memberTF",teamMember);
	}
	
	@Override
	public int deleteMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.delete("team_members.deleteMember",teamMember);
	}
	@Override
	public int deleteTeam(Team team) {
		// TODO Auto-generated method stub
		return session.delete("teams.deleteTeam", team);
	}
	@Override
	public int deleteTeamMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return session.delete("team_members.deleteTeam", teamMember);
	}
	
	@Override
	public int insertTeam(Team team) {

		return session.insert("teams.insertTeam",team);
	}

}
