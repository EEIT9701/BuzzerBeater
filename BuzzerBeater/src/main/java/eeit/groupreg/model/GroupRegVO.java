package eeit.groupreg.model;

import java.io.Serializable;
import java.sql.Timestamp;

import eeit.groups.model.GroupsVO;

public class GroupRegVO implements Serializable {
	private static final long serialVersionUID = 4552206536523610995L;

	private Integer teamID;

	private Integer groupID;

	private Integer teamStat;
	private Timestamp registerDate;
	private String paymentNumber;

	// private TeamsVO teamVO;

	private GroupsVO groupsVO;

	public Integer getTeamID() {
		return teamID;
	}

	public void setTeamID(Integer teamID) {
		this.teamID = teamID;
	}

	public Integer getGroupID() {
		return groupID;
	}

	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
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

	public GroupsVO getGroupsVO() {
		return groupsVO;
	}

	public void setGroupsVO(GroupsVO groupsVO) {
		this.groupsVO = groupsVO;
	}

}
