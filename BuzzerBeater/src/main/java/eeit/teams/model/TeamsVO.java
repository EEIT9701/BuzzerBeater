package eeit.teams.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import eeit.games.model.GamesVO;
import eeit.groupreg.model.GroupRegVO;
import eeit.locationinfo.model.LocationinfoVO;
import eeit.teamcomposition.model.TeamCompositionVO;

public class TeamsVO implements Serializable {
	private static final long serialVersionUID = 4619696135305057321L;

	private Integer teamID;// PK

	private LocationinfoVO locationinfoVO;// replace locationID

	private Set<TeamCompositionVO> teamCompositionSet = new LinkedHashSet<TeamCompositionVO>();
	private Set<GroupRegVO> groupRegSet = new LinkedHashSet<GroupRegVO>();

	private Integer captainID;
	private String captainEmail;
	private String captainPhone;
	private String teamName;
	private String coachName;
	private String bossName;
	private String teamBadge;
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

	public Integer getCaptainID() {
		return captainID;
	}

	public void setCaptainID(Integer captainID) {
		this.captainID = captainID;
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

	public String getTeamBadge() {
		return teamBadge;
	}

	public void setTeamBadge(String teamBadge) {
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

	public Set<TeamCompositionVO> getTeamCompositionSet() {
		return teamCompositionSet;
	}

	public void setTeamCompositionSet(Set<TeamCompositionVO> teamCompositionSet) {
		this.teamCompositionSet = teamCompositionSet;
	}

	public Set<GroupRegVO> getGroupRegSet() {
		return groupRegSet;
	}

	public void setGroupRegSet(Set<GroupRegVO> groupRegSet) {
		this.groupRegSet = groupRegSet;
	}

}
