package eeit.teamcomposition.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.players.model.PlayersVO;
import eeit.teams.model.TeamsVO;

public class TeamCompositionService {
	private TeamCompositionDAO_interface dao;

	public TeamCompositionService() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (TeamCompositionDAO_interface) context.getBean("TeamCompositionDAO");
	}

	public void insert(Integer teamID, Integer playerID, Integer playerNo, String playerRole, Timestamp joinTeamDate,
			Timestamp leaveTeamDate) {
		TeamCompositionVO teamCompositionVO = new TeamCompositionVO();
		
		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setTeamID(teamID);
		teamCompositionVO.setTeamsVO(teamsVO);
		
		PlayersVO playersVO = new PlayersVO();
		playersVO.setPlayerID(playerID);
		teamCompositionVO.setPlayersVO(playersVO);
		
		teamCompositionVO.setPlayerNo(playerNo);
		teamCompositionVO.setPlayerRole(playerRole);
		teamCompositionVO.setJoinTeamDate(joinTeamDate);
		teamCompositionVO.setLeaveTeamDate(leaveTeamDate);
		
		dao.insert(teamCompositionVO);
	}

	public void update(Integer teamID, Integer playerID, Integer playerNo, String playerRole, Timestamp joinTeamDate,
			Timestamp leaveTeamDate) {
		TeamCompositionVO teamCompositionVO = new TeamCompositionVO();
		
		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setTeamID(teamID);
		teamCompositionVO.setTeamsVO(teamsVO);
		
		PlayersVO playersVO = new PlayersVO();
		playersVO.setPlayerID(playerID);
		teamCompositionVO.setPlayersVO(playersVO);
		
		teamCompositionVO.setPlayerNo(playerNo);
		teamCompositionVO.setPlayerRole(playerRole);
		teamCompositionVO.setJoinTeamDate(joinTeamDate);
		teamCompositionVO.setLeaveTeamDate(leaveTeamDate);
		
		dao.insert(teamCompositionVO);
	}

	public void delete(Integer teamID) {
		dao.delete(teamID);
	}

	public Set<TeamCompositionVO> getAll() {

	}

	public List<TeamCompositionVO> findByTeamID(Integer teamID) {

	}

	public List<TeamCompositionVO> findByPlayerID(Integer playerID) {

	}
}
