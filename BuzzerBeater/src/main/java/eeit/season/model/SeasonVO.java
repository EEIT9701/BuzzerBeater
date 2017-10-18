package eeit.season.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import eeit.groups.model.GroupsVO;


public class SeasonVO implements Serializable {
	private static final long serialVersionUID = 8996605635038786569L;

	private Integer seasonID; //PK
	
	private Set<GroupsVO> groupsSet = new LinkedHashSet<GroupsVO>();

	private String seasonName;
	private Date seasonBeginDate;
	private Date seasonEndDate;
	private Timestamp signUpBegin;
	private Timestamp signUpEnd;
	private String descriptions;

	public Integer getSeasonID() {
		return seasonID;
	}

	public void setSeasonID(Integer seasonID) {
		this.seasonID = seasonID;
	}

	public String getSeasonName() {
		return seasonName;
	}

	public void setSeasonName(String seasonName) {
		this.seasonName = seasonName;
	}

	public Date getSeasonBeginDate() {
		return seasonBeginDate;
	}

	public void setSeasonBeginDate(Date seasonBeginDate) {
		this.seasonBeginDate = seasonBeginDate;
	}

	public Date getSeasonEndDate() {
		return seasonEndDate;
	}

	public void setSeasonEndDate(Date seasonEndDate) {
		this.seasonEndDate = seasonEndDate;
	}

	public Timestamp getSignUpBegin() {
		return signUpBegin;
	}

	public void setSignUpBegin(Timestamp signUpBegin) {
		this.signUpBegin = signUpBegin;
	}

	public Timestamp getSignUpEnd() {
		return signUpEnd;
	}

	public void setSignUpEnd(Timestamp signUpEnd) {
		this.signUpEnd = signUpEnd;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Set<GroupsVO> getGroupsSet() {
		return groupsSet;
	}

	public void setGroupsSet(Set<GroupsVO> groupsSet) {
		this.groupsSet = groupsSet;
	}



}
