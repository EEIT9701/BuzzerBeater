package eeit.teamcomposition.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.players.model.PlayersVO;
import eeit.teams.model.TeamsVO;

public class TeamCompositionVO implements Serializable {
	private static final long serialVersionUID = -276613883994509597L;

	private TeamsVO teamsVO;// replace teamID
	private PlayersVO playersVO;// replace playerID

	private Integer playerNo;
	private String playerRole;
	private Timestamp joinTeamDate;
	private Timestamp leaveTeamDate;

	public TeamsVO getTeamsVO() {
		return teamsVO;
	}

	public void setTeamsVO(TeamsVO teamsVO) {
		this.teamsVO = teamsVO;
	}

	public PlayersVO getPlayersVO() {
		return playersVO;
	}

	public void setPlayersVO(PlayersVO playersVO) {
		this.playersVO = playersVO;
	}

	public Integer getPlayerNo() {
		return playerNo;
	}

	public void setPlayerNo(Integer playerNo) {
		this.playerNo = playerNo;
	}

	public String getPlayerRole() {
		return playerRole;
	}

	public void setPlayerRole(String playerRole) {
		this.playerRole = playerRole;
	}

	public Timestamp getJoinTeamDate() {
		return joinTeamDate;
	}

	public void setJoinTeamDate(Timestamp joinTeamDate) {
		this.joinTeamDate = joinTeamDate;
	}

	public Timestamp getLeaveTeamDate() {
		return leaveTeamDate;
	}

	public void setLeaveTeamDate(Timestamp leaveTeamDate) {
		this.leaveTeamDate = leaveTeamDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((playersVO == null) ? 0 : playersVO.hashCode());
		result = prime * result + ((teamsVO == null) ? 0 : teamsVO.hashCode());
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
		TeamCompositionVO other = (TeamCompositionVO) obj;
		if (playersVO == null) {
			if (other.playersVO != null)
				return false;
		} else if (!playersVO.equals(other.playersVO))
			return false;
		if (teamsVO == null) {
			if (other.teamsVO != null)
				return false;
		} else if (!teamsVO.equals(other.teamsVO))
			return false;
		return true;
	}

}
