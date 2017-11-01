package eeit.teamcomposition.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.players.model.PlayersVO;
import eeit.teams.model.TeamsDAO;
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
		dao = new TeamCompositionDAO();
		TeamCompositionVO teamCompositionVO = new TeamCompositionVO();

//		TeamsVO teamsVO = new TeamsVO();
//		teamsVO.setTeamID(teamID);
//		teamCompositionVO.setTeamsVO(teamsVO);

//		PlayersVO playersVO = new PlayersVO();
//		playersVO.setPlayerID(playerID);
//		teamCompositionVO.setPlayersVO(playersVO);
		teamCompositionVO.setTeamID(teamID);
		teamCompositionVO.setPlayerID(playerID);
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

	public Set<TeamCompositionVO> getAll() {
		return dao.getAll();
	}

	public List<TeamCompositionVO> findByTeamID(Integer teamID) {
		return dao.findByTeamID(teamID);
	}

	public List<TeamCompositionVO> findByPlayerID(Integer playerID) {
		return dao.findByPlayerID(playerID);
	}

	public void deleteByTeamID(Integer teamID) {
		dao.deleteByTeamID(teamID);
	}

	public void deleteByPlayerID(Integer playerID) {
		dao.deleteByPlayerID(playerID);
	}

	public void deleteByCID(Integer teamID, Integer playerID) {
		dao.deleteByCID(teamID, playerID);
	}
}
