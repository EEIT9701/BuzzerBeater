package eeit.playergroups.model;

import java.io.Serializable;

import eeit.groups.model.GroupsVO;
import eeit.players.model.PlayersVO;
import eeit.season.model.SeasonVO;

public class PlayerGroupsVO implements Serializable {
	private static final long serialVersionUID = -310982995736374426L;

<<<<<<< HEAD
	private SeasonVO seasonVO; // replace seasonID
	private GroupsVO groupsVO; // replace groupID
	private PlayersVO playersVO; // replace playerID

	public SeasonVO getSeasonVO() {
		return seasonVO;
	}

	public void setSeasonVO(SeasonVO seasonVO) {
		this.seasonVO = seasonVO;
	}
=======
	private GroupsVO groupsVO; // replace groupID // CPK
	private PlayersVO playersVO; // replace playerID // CPK

>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git

	public GroupsVO getGroupsVO() {
		return groupsVO;
	}

	public void setGroupsVO(GroupsVO groupsVO) {
		this.groupsVO = groupsVO;
	}

	public PlayersVO getPlayersVO() {
		return playersVO;
	}

	public void setPlayersVO(PlayersVO playersVO) {
		this.playersVO = playersVO;
	}

}
