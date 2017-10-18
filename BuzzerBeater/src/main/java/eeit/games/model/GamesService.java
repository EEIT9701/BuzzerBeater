package eeit.games.model;

import java.sql.Timestamp;
import java.util.Set;

public class GamesService {

	private GamesDAO_interface dao;

	public GamesService() {
		dao = new GamesDAO_Hibernate();
	}

	public Set<GamesVO> getAll() {
		return dao.getAll();
	}

	public void addGames(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore,
			Integer teamBID, Integer teamBScore, Integer winnerID, Timestamp gameBeginDate,
			Timestamp gameEndDate) {
		GamesVO gVO = new GamesVO();
		
		gVO.getGroupsVO().setGroupID(groupID);
<<<<<<< HEAD
		gVO.setLocationID(locationID);
		gVO.setTeamAID(teamAID);
		gVO.setTeamAScore(teamAScore);
		gVO.setTeamBID(teamBID);
		gVO.setTeamBScore(teamBScore);
		gVO.setWinnerID(winnerID);
		gVO.setGameBeginDate(gameBeginDate);
		gVO.setGameEndDate(gameEndDate);
		
		dao.insert(gVO);
	}

	public void updateGame(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore,
			Integer teamBID, Integer teamBScore, Integer winnerID, Timestamp gameBeginDate,
			Timestamp gameEndDate,Integer gameID) {
		GamesVO gVO = new GamesVO();
		
		gVO.getGroupsVO().setGroupID(groupID);
		gVO.setLocationID(locationID);
=======
		gVO.getLocationinfoVO().setLocationID(locationID);
		gVO.setTeamAID(teamAID);
		gVO.setTeamAScore(teamAScore);
		gVO.setTeamBID(teamBID);
		gVO.setTeamBScore(teamBScore);
		gVO.setWinnerID(winnerID);
		gVO.setGameBeginDate(gameBeginDate);
		gVO.setGameEndDate(gameEndDate);
		
		dao.insert(gVO);
	}

	public void updateGame(Integer groupID, Integer locationID, Integer teamAID, Integer teamAScore,
			Integer teamBID, Integer teamBScore, Integer winnerID, Timestamp gameBeginDate,
			Timestamp gameEndDate,Integer gameID) {
		GamesVO gVO = new GamesVO();
		
		gVO.getGroupsVO().setGroupID(groupID);
		gVO.getLocationinfoVO().setLocationID(locationID);
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
		gVO.setTeamAID(teamAID);
		gVO.setTeamAScore(teamAScore);
		gVO.setTeamBID(teamBID);
		gVO.setTeamBScore(teamBScore);
		gVO.setWinnerID(winnerID);
		gVO.setGameBeginDate(gameBeginDate);
		gVO.setGameEndDate(gameEndDate);
		gVO.setGameID(gameID);
		
		dao.update(gVO);
	}
	
	public void deleteGames(Integer gamesID){
		dao.delete(gamesID);
	}
}
