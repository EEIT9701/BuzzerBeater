package eeit.games.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.groups.model.GroupsVO;

public class GamesVO implements Serializable {

	private static final long serialVersionUID = 380702720062527758L;

	private Integer gameID;

	private GroupsVO groupsVO;

	private Integer locationID;
	private Integer teamAID;
	private Integer teamAScore;
	private Integer teamBID;
	private Integer teamBScore;
	private Integer winnerID;
	private Timestamp gameBeginDate;
	private Timestamp gameEndDate;


	public Integer getGameID() {
		return gameID;
	}

	public void setGameID(Integer gameID) {
		this.gameID = gameID;
	}

	public GroupsVO getGroupsVO() {
		return groupsVO;
	}

	public void setGroupsVO(GroupsVO groupsVO) {
		this.groupsVO = groupsVO;
	}

	public Integer getLocationID() {
		return locationID;
	}

	public void setLocationID(Integer locationID) {
		this.locationID = locationID;
	}

	public Integer getTeamAID() {
		return teamAID;
	}

	public void setTeamAID(Integer teamAID) {
		this.teamAID = teamAID;
	}

	public Integer getTeamAScore() {
		return teamAScore;
	}

	public void setTeamAScore(Integer teamAScore) {
		this.teamAScore = teamAScore;
	}

	public Integer getTeamBID() {
		return teamBID;
	}

	public void setTeamBID(Integer teamBID) {
		this.teamBID = teamBID;
	}

	public Integer getTeamBScore() {
		return teamBScore;
	}

	public void setTeamBScore(Integer teamBScore) {
		this.teamBScore = teamBScore;
	}

	public Integer getWinnerID() {
		return winnerID;
	}

	public void setWinnerID(Integer winnerID) {
		this.winnerID = winnerID;
	}

	public Timestamp getGameBeginDate() {
		return gameBeginDate;
	}

	public void setGameBeginDate(Timestamp gameBeginDate) {
		this.gameBeginDate = gameBeginDate;
	}

	public Timestamp getGameEndDate() {
		return gameEndDate;
	}

	public void setGameEndDate(Timestamp gameEndDate) {
		this.gameEndDate = gameEndDate;
	}

}
