package eeit.groupreg.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.groups.model.GroupsVO;
import eeit.teams.model.TeamsVO;

public class GroupRegVO implements Serializable {
	private static final long serialVersionUID = 4552206536523610995L;
	
	private TeamsVO teamsVO;//replace teamID // CPK
	private GroupsVO groupsVO; //replace groupID // CPK

	private Integer teamStat;
	private Timestamp registerDate;
	private String paymentNumber;
	
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
