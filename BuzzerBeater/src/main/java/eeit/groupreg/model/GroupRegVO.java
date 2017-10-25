package eeit.groupreg.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.groups.model.GroupsVO;
import eeit.teams.model.TeamsVO;

public class GroupRegVO implements Serializable {
	private static final long serialVersionUID = 4552206536523610995L;

	private TeamsVO teamsVO;// replace teamID // CPK
	private GroupsVO groupsVO; // replace groupID // CPK

	private Integer teamStat;
	private Timestamp registerDate;
	private String paymentNumber;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupsVO == null) ? 0 : groupsVO.hashCode());
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
		GroupRegVO other = (GroupRegVO) obj;
		if (groupsVO == null) {
			if (other.groupsVO != null)
				return false;
		} else if (!groupsVO.equals(other.groupsVO))
			return false;
		if (teamsVO == null) {
			if (other.teamsVO != null)
				return false;
		} else if (!teamsVO.equals(other.teamsVO))
			return false;
		return true;
	}

	public TeamsVO getTeamsVO() {
		return teamsVO;
	}

	public void setTeamsVO(TeamsVO teamsVO) {
		this.teamsVO = teamsVO;
	}

	public GroupsVO getGroupsVO() {
		return groupsVO;
	}

	public void setGroupsVO(GroupsVO groupsVO) {
		this.groupsVO = groupsVO;
	}

	public Integer getTeamStat() {
		return teamStat;
	}

	public void setTeamStat(Integer teamStat) {
		this.teamStat = teamStat;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public String getPaymentNumber() {
		return paymentNumber;
	}

	public void setPaymentNumber(String paymentNumber) {
		this.paymentNumber = paymentNumber;
	}

}
