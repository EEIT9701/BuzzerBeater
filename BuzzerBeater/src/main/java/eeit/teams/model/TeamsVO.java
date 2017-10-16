package eeit.teams.model;

import java.io.Serializable;
import java.sql.Blob;

import eeit.locationinfo.model.LocationinfoVO;
import eeit.players.model.PlayersVO;

public class TeamsVO implements Serializable {
	private static final long serialVersionUID = 4619696135305057321L;

	private Integer teamID;// PK

	private PlayersVO playersVO;// replace captainID
	private LocationinfoVO locationinfoVO;// replace locationID

	private String captainEmail;
	private String captainPhone;
	private String teamName;
	private String coachName;
	private String bossName;
	private Blob teamBadge;
	private Integer totalWin;
	private Integer totalLose;
	private Float winRate;
	private String remarks;

	public Integer getTeamID() {
		return teamID;
	}

	public void setTeamID(Integer teamID) {
		this.teamID = teamID;
	}

	public LocationinfoVO getLocationinfoVO() {
		return locationinfoVO;
	}

	public void setLocationinfoVO(LocationinfoVO locationinfoVO) {
		this.locationinfoVO = locationinfoVO;
	}

	public PlayersVO getPlayersVO() {
		return playersVO;
	}

	public void setPlayersVO(PlayersVO playersVO) {
		this.playersVO = playersVO;
	}

	public String getCaptainEmail() {
		return captainEmail;
	}

	public void setCaptainEmail(String captainEmail) {
		this.captainEmail = captainEmail;
	}

	public String getCaptainPhone() {
		return captainPhone;
	}

	public void setCaptainPhone(String captainPhone) {
		this.captainPhone = captainPhone;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public String getBossName() {
		return bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public Blob getTeamBadge() {
		return teamBadge;
	}

	public void setTeamBadge(Blob teamBadge) {
		this.teamBadge = teamBadge;
	}

	public Integer getTotalWin() {
		return totalWin;
	}

	public void setTotalWin(Integer totalWin) {
		this.totalWin = totalWin;
	}

	public Integer getTotalLose() {
		return totalLose;
	}

	public void setTotalLose(Integer totalLose) {
		this.totalLose = totalLose;
	}

	public Float getWinRate() {
		return winRate;
	}

	public void setWinRate(Float winRate) {
		this.winRate = winRate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
