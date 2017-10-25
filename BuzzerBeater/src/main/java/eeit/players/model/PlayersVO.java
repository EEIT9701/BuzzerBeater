package eeit.players.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import eeit.personaldata.model.PersonalDataVO;
import eeit.playergroups.model.PlayerGroupsVO;
import eeit.teamcomposition.model.TeamCompositionVO;

public class PlayersVO implements java.io.Serializable {
	private static final long serialVersionUID = 5640779903002551260L;

	private Integer playerID;// PK

	private Set<PlayerGroupsVO> playerGroupsSet = new LinkedHashSet<PlayerGroupsVO>();
	private Set<PersonalDataVO> personalDataSet = new LinkedHashSet<PersonalDataVO>();
	private Set<TeamCompositionVO> teamCompositionSet = new LinkedHashSet<TeamCompositionVO>();

	private String playerName;
	private String id;
	private Double height;// Double height
	private Double weights;// Double weights
	private Date birthday;
	private String nationality;
	private String photo;

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getPlayerID() {
		return playerID;
	}

	public void setPlayerID(Integer playerID) {
		this.playerID = playerID;
	}

	public Set<PlayerGroupsVO> getPlayerGroupsSet() {
		return playerGroupsSet;
	}

	public void setPlayerGroupsSet(Set<PlayerGroupsVO> playerGroupsSet) {
		this.playerGroupsSet = playerGroupsSet;
	}

	public Set<PersonalDataVO> getPersonalDataSet() {
		return personalDataSet;
	}

	public void setPersonalDataSet(Set<PersonalDataVO> personalDataSet) {
		this.personalDataSet = personalDataSet;
	}

	public Set<TeamCompositionVO> getTeamCompositionSet() {
		return teamCompositionSet;
	}

	public void setTeamCompositionSet(Set<TeamCompositionVO> teamCompositionSet) {
		this.teamCompositionSet = teamCompositionSet;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeights() {
		return weights;
	}

	public void setWeights(Double weights) {
		this.weights = weights;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	

}
