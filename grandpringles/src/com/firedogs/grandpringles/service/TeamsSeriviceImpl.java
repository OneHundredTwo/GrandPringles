package com.firedogs.grandpringles.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.dao.TeamsDAO;
import com.firedogs.grandpringles.util.ResizeImageUtil;
import com.firedogs.grandpringles.vo.Team;
import com.firedogs.grandpringles.vo.TeamMember;

public class TeamsSeriviceImpl implements TeamsSerivice{
	
	
	private TeamsDAO teamsDAO;
	
	public void setTeamsDAO(TeamsDAO teamsDAO) {
		this.teamsDAO = teamsDAO;
	}
	
	@Override
	public List<Team> getTeams(Team team) {
		// TODO Auto-generated method stub
		return teamsDAO.selectList(team);
	}
	
	@Override
	public List<TeamMember> getTeamMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return teamsDAO.selectList(teamMember);
	}
	
	@Override
	public int getMemberCount(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return teamsDAO.memeberCount(teamMember);
	}
	
	@Override
	public boolean addMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return 1==teamsDAO.insert(teamMember);
	}
	
	@Override
	public boolean teamConfirm(Team team) {
		// TODO Auto-generated method stub
		return team.getGrndNo()==teamsDAO.teamConfirm(team);
	}
	@Override
	public boolean memberTF(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return teamMember.getMemberNo()==teamsDAO.memberTF(teamMember);
	}
	
	@Override
	public int removeMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return teamsDAO.deleteMember(teamMember);
	}
	@Override
	public int removeTeam(Team team) {
		// TODO Auto-generated method stub
		return teamsDAO.deleteTeam(team);
	}
	@Override
	public int removeTeamMember(TeamMember teamMember) {
		// TODO Auto-generated method stub
		return teamsDAO.deleteTeamMember(teamMember);
	}
	
	@Override
	public boolean addTeam(Team team,String uploadPath,String teamLogoPath,MultipartFile upload,TeamMember teamMember) {

		UUID uuid = UUID.randomUUID();
		System.out.println("1");
		System.out.println(upload);
		String fileName = 
				upload.getOriginalFilename();
		System.out.println("2");
		//���� index
		int dotIdx = fileName.lastIndexOf(".");
		
		//.���� Ȯ���ڸ� ��������
		fileName = fileName.substring(
				dotIdx, 
				fileName.length());
		
		//������ �̸��� ��ġ��
		fileName = uuid+fileName;

		System.out.println("fileName:"+fileName);
		
		File file = new File(uploadPath+fileName);
		
		try {
			//���ε� ó��
			upload.transferTo(file);
			
			//���ε������� ������
			//profile������ ����� �����
			ResizeImageUtil.resize(
					uploadPath+fileName, 
					teamLogoPath+fileName,
					400);
		
			//�̹��� ���� �� DB ����
			team.setLogo(fileName);
			
			teamsDAO.insertTeam(team);
			teamMember.setMemberNo(team.getLeaderNo());
			teamsDAO.insert(teamMember);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

		return true;
	}

}
