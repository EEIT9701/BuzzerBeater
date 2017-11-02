package eeit.games.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.groups.model.GroupsVO;
import eeit.locationinfo.model.LocationinfoVO;
import eeit.teams.model.TeamsVO;

public class GamesService {

	private GamesDAO_interface dao;

	public GamesService() {
		// dao = new GamesDAO_Hibernate();
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (GamesDAO_interface) context.getBean("GamesDAO");
	}

	public Set<GamesVO> getAll() {
		return dao.getAll();
	}

	public void addGames(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore, Integer teamBID,
			Integer teamBScore, Timestamp gameBeginDate, Timestamp gameEndDate) {
		GamesVO gamesVO = new GamesVO();
		TeamsVO teamAVO = new TeamsVO();
		TeamsVO teamBVO = new TeamsVO();
		LocationinfoVO locVO = new LocationinfoVO();
		GroupsVO groupsVO = new GroupsVO();

		groupsVO.setGroupID(groupID);
		gamesVO.setGroupsVO(groupsVO);

		locVO.setLocationID(locationID);
		gamesVO.setLocationinfoVO(locVO);

		teamAVO.setTeamID(teamAID);
		gamesVO.setTeamAVO(teamAVO);

		teamBVO.setTeamID(teamBID);
		gamesVO.setTeamBVO(teamBVO);

		gamesVO.setTeamAScore(teamAScore);
		gamesVO.setTeamBScore(teamBScore);
		gamesVO.setWinnerID(0);
		gamesVO.setGameBeginDate(gameBeginDate);
		gamesVO.setGameEndDate(gameEndDate);

		dao = new GamesDAO_JDBC();
		dao.insert(gamesVO);
	}

	public void updateGame(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore, Integer teamBID,
			Integer teamBScore, Integer winnerID, Timestamp gameBeginDate, Timestamp gameEndDate, Integer gameID) {
		GamesVO gVO = new GamesVO();

		gVO.getGroupsVO().setGroupID(groupID);
		gVO.getLocationinfoVO().setLocationID(locationID);
		gVO.getTeamAVO().setTeamID(teamAID);
		gVO.setTeamAScore(teamAScore);
		gVO.getTeamBVO().setTeamID(teamBID);
		gVO.setTeamBScore(teamBScore);
		gVO.setWinnerID(winnerID);
		gVO.setGameBeginDate(gameBeginDate);
		gVO.setGameEndDate(gameEndDate);
		gVO.setGameID(gameID);

		dao.update(gVO);
	}

	public void deleteGames(Integer gamesID) {
		dao.delete(gamesID);
	}

	public GamesVO findByGameID(Integer gameID) {
		return dao.findByGameID(gameID);
	}

	public List<GamesVO> findByGroupID(Integer groupID) {
		return dao.findByGroupID(groupID);
	}
	
	public List<GamesVO> findByTeamID(Integer teamID) {
		return dao.findByTeamID(teamID);
	}
}
