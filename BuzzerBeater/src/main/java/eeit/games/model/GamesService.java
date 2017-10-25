package eeit.games.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GamesService {

	private GamesDAO_interface dao;

	public GamesService() {
		// dao = new GamesDAO_Hibernate();
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (GamesDAO_interface) context.getBean("GamesDAO");
	}

	public Set<HashMap<String, Object>> getAll() {
		Set<HashMap<String, Object>> set = new LinkedHashSet<HashMap<String, Object>>();

		for (GamesVO vo : dao.getAll()) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("gameID", vo.getGameID());
			map.put("groupsVO", vo.getGroupsVO());
			map.put("locationinfoVO", vo.getLocationinfoVO());
			map.put("teamAVO", vo.getTeamAVO());
			map.put("teamBVO", vo.getTeamBVO());
			map.put("gameMediaSet", vo.getGameMediaSet());
			map.put("personalDataSet", vo.getPersonalDataSet());
			map.put("teamsSet", vo.getTeamsSet());
			map.put("teamAScore", vo.getTeamAScore());
			map.put("teamBScore", vo.getTeamBScore());
			map.put("winnerID", vo.getWinnerID());
			
			SimpleDateFormat sdf = new SimpleDateFormat();
			map.put("gameBeginDate", sdf.format(vo.getGameBeginDate()));
			map.put("gameEndDate", sdf.format(vo.getGameEndDate()));
			set.add((HashMap<String, Object>) map);
		}

		return set;
	}

	public void addGames(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore, Integer teamBID,
			Integer teamBScore, Integer winnerID, Timestamp gameBeginDate, Timestamp gameEndDate) {
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

		dao.insert(gVO);
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
}
