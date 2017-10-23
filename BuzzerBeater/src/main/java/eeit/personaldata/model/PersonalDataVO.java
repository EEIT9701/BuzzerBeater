package eeit.personaldata.model;

import java.io.Serializable;

import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsVO;
import eeit.players.model.PlayersVO;

public class PersonalDataVO implements Serializable{
private PlayersVO playersVO;
private GamesVO gamesVO;
private Integer teamID;
private String gameTime;
private Integer twoPoint;
private Integer twoPointShot;
private Integer threePoint;
private Integer threePointShot;
private Integer fg;
private Integer fgShot;
private Integer offReb;
private Integer defReb;
private Integer assist;
private Integer steal;
private Integer blocks;
private Integer turnover;
private Integer personalFouls;
private Integer points;
private Integer startingPlayer;



public Integer getTeamID() {
	return teamID;
}
public void setTeamID(Integer teamID) {
	this.teamID = teamID;
}

public Integer getTwoPoint() {
	return twoPoint;
}
public void setTwoPoint(Integer twoPoint) {
	this.twoPoint = twoPoint;
}
public Integer getTwoPointShot() {
	return twoPointShot;
}
public void setTwoPointShot(Integer twoPointShot) {
	this.twoPointShot = twoPointShot;
}
public Integer getThreePoint() {
	return threePoint;
}
public void setThreePoint(Integer threePoint) {
	this.threePoint = threePoint;
}
public Integer getThreePointShot() {
	return threePointShot;
}
public void setThreePointShot(Integer threePointShot) {
	this.threePointShot = threePointShot;
}
public Integer getFg() {
	return fg;
}
public void setFg(Integer fg) {
	this.fg = fg;
}
public Integer getFgShot() {
	return fgShot;
}
public void setFgShot(Integer fgShot) {
	this.fgShot = fgShot;
}
public Integer getOffReb() {
	return offReb;
}
public void setOffReb(Integer offReb) {
	this.offReb = offReb;
}
public Integer getDefReb() {
	return defReb;
}
public void setDefReb(Integer defReb) {
	this.defReb = defReb;
}
public Integer getAssist() {
	return assist;
}
public void setAssist(Integer assist) {
	this.assist = assist;
}
public Integer getSteal() {
	return steal;
}
public void setSteal(Integer steal) {
	this.steal = steal;
}
public Integer getBlocks() {
	return blocks;
}
public void setBlocks(Integer blocks) {
	this.blocks = blocks;
}
public Integer getTurnover() {
	return turnover;
}
public void setTurnover(Integer turnover) {
	this.turnover = turnover;
}
public Integer getStartingPlayer() {
	return startingPlayer;
}
public void setStartingPlayer(Integer startingPlayer) {
	this.startingPlayer = startingPlayer;
}

public Integer getPersonalFouls() {
	return personalFouls;
}
public void setPersonalFouls(Integer personalFouls) {
	this.personalFouls = personalFouls;
}
public Integer getPoints() {
	return points;
}
public void setPoints(Integer points) {
	this.points = points;
}
public String getGameTime() {
	return gameTime;
}
public void setGameTime(String gameTime) {
	this.gameTime = gameTime;
}
public PlayersVO getPlayersVO() {
	return playersVO;
}
public void setPlayersVO(PlayersVO playersVO) {
	this.playersVO = playersVO;
}
public GamesVO getGamesVO() {
	return gamesVO;
}
public void setGamesVO(GamesVO gamesVO) {
	this.gamesVO = gamesVO;
}



}
