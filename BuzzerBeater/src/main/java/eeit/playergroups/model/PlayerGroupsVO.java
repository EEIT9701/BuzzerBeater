package eeit.playergroups.model;

import java.io.Serializable;

import eeit.groups.model.GroupsVO;
import eeit.players.model.PlayersVO;
import eeit.season.model.SeasonVO;

public class PlayerGroupsVO implements Serializable {
	private static final long serialVersionUID = -310982995736374426L;

	private GroupsVO groupsVO; // replace groupID // CPK
	private PlayersVO playersVO; // replace playerID // CPK


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupsVO == null) ? 0 : groupsVO.hashCode());
		result = prime * result + ((playersVO == null) ? 0 : playersVO.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlayerGroupsVO other = (PlayerGroupsVO) obj;
		if (groupsVO == null) {
			if (other.groupsVO != null)
				return false;
		} else if (!groupsVO.equals(other.groupsVO))
			return false;
		if (playersVO == null) {
			if (other.playersVO != null)
				return false;
		} else if (!playersVO.equals(other.playersVO))
			return false;
		return true;
	}

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
