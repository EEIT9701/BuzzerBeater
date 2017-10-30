package eeit.teams.model;

import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TeamsService {
	private TeamsDAO_interface dao;

	public TeamsService() {
//		dao = new TeamsDAO();
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (TeamsDAO_interface) context.getBean("TeamsDAO");
	}

	public Set<TeamsVO> getAll() {
		return dao.getAll();
	}

	public TeamsVO findByID(Integer teamID) {
		return dao.findByID(teamID);
	}

	public void insert(String teamName, String bossName, String coachName, String captainEmail, Integer captainID,
			String remarks, String teamBadge) {

		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setBossName(bossName);
		teamsVO.setCaptainEmail(captainEmail);
		teamsVO.setCaptainID(captainID);
		teamsVO.setCoachName(coachName);
		teamsVO.setRemarks(remarks);
		teamsVO.setTeamBadge(teamBadge);
		teamsVO.setTeamName(teamName);

		dao.insert(teamsVO);
	}

	public void update( String teamBadge,String teamName, String captainEmail, String captainPhone, String coachName,
			String bossName,Integer totalWin,Integer totalLose,Float winRate,String remarks, Integer teamID) {

		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setTeamBadge(teamBadge);
		teamsVO.setTeamName(teamName);
		teamsVO.setCaptainEmail(captainEmail);
		teamsVO.setCaptainPhone(captainPhone);
		teamsVO.setCoachName(coachName);
		teamsVO.setBossName(bossName);
		teamsVO.setTotalWin(totalWin);
		teamsVO.setTotalLose(totalLose);
		teamsVO.setWinRate(winRate);
		teamsVO.setRemarks(remarks);

		teamsVO.setTeamID(teamID);

		dao.update(teamsVO);
	}

	public void delete(Integer teamID) {
		dao.delete(teamID);
	}
}
