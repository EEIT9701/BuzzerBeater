package eeit.playergroups.model;

import java.io.Serializable;

import eeit.groups.model.GroupsVO;
import eeit.season.model.SeasonVO;


public class PlayerGroupsVO implements Serializable {

	private static final long serialVersionUID = -310982995736374426L;


	private Integer playerGroupsID;
	
	private Integer seasonID;
	private Integer groupID;
	private Integer playerID;


	private SeasonVO seasonVO;


	private GroupsVO groupsVO;

	// private PlayerVO playerVO;

	public Integer getSeasonID() {
		return seasonID;
	}

	public void setSeasonID(Integer seasonID) {
		this.seasonID = seasonID;
	}

	public Integer getGroupID() {
		return groupID;
	}

	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
	}

	public Integer getPlayerID() {
		return playerID;
	}

	public void setPlayerID(Integer playerID) {
		this.playerID = playerID;
	}

	public SeasonVO getSeasonVO() {
		return seasonVO;
	}

	public void setSeasonVO(SeasonVO seasonVO) {
		this.seasonVO = seasonVO;
	}

	public GroupsVO getGroupsVO() {
		return groupsVO;
	}

	public void setGroupsVO(GroupsVO groupsVO) {
		this.groupsVO = groupsVO;
	}

	public Integer getPlayerGroupsID() {
		return playerGroupsID;
	}

	public void setPlayerGroupsID(Integer playerGroupsID) {
		this.playerGroupsID = playerGroupsID;
	}

}
