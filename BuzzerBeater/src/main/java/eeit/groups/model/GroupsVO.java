package eeit.groups.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import eeit.games.model.GamesVO;
import eeit.season.model.SeasonVO;

//@Entity
//@Table(name = "Groups")
public class GroupsVO implements Serializable {
	private static final long serialVersionUID = -906471849151369866L;

//	@Id
//	@Column(name = "groupID")
//	@SequenceGenerator(name = "sg", allocationSize = 1)
//	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "sg")
	private Integer groupID;

	// private Set<GroupRegVO> groupRegSet = new LinkedHashSet<GroupRegVO>();
	//
	// private Set<PlayerGroupsVO> playerGroupsSet = new
	// LinkedHashSet<PlayerGroupsVO>();

//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "groupsVO")
//	@OrderBy("gameID asc")
	private Set<GamesVO> gamesSet = new LinkedHashSet<GamesVO>();

//	@ManyToOne
//	@JoinColumn(name = "SeasonID") // 正常要把外鍵欄位刪除用對應的VO取代，SQLServer不分大小寫才可這樣用
	private SeasonVO seasonVO;

	private String groupName;
	private Integer maxTeams;
	private Integer minTeams;
	private Integer currentTeams;
	private Integer maxPlayers;
	private Integer minPlayers;

	/****************************************************************/
	public Integer getGroupID() {
		return groupID;
	}

	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
	}

	// public Set<GroupRegVO> getGroupRegSet() {
	// return groupRegSet;
	// }
	//
	// public void setGroupRegSet(Set<GroupRegVO> groupRegSet) {
	// this.groupRegSet = groupRegSet;
	// }
	//
	// public Set<PlayerGroupsVO> getPlayerGroupsSet() {
	// return playerGroupsSet;
	// }
	//
	// public void setPlayerGroupsSet(Set<PlayerGroupsVO> playerGroupsSet) {
	// this.playerGroupsSet = playerGroupsSet;
	// }
	//
	// public Set<GamesVO> getGamesSet() {
	// return gamesSet;
	// }
	//
	// public void setGamesSet(Set<GamesVO> gamesSet) {
	// this.gamesSet = gamesSet;
	// }

	public SeasonVO getSeasonVO() {
		return seasonVO;
	}

	public void setSeasonVO(SeasonVO seasonVO) {
		this.seasonVO = seasonVO;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getMaxTeams() {
		return maxTeams;
	}

	public void setMaxTeams(Integer maxTeams) {
		this.maxTeams = maxTeams;
	}

	public Integer getMinTeams() {
		return minTeams;
	}

	public void setMinTeams(Integer minTeams) {
		this.minTeams = minTeams;
	}

	public Integer getCurrentTeams() {
		return currentTeams;
	}

	public void setCurrentTeams(Integer currentTeams) {
		this.currentTeams = currentTeams;
	}

	public Integer getMaxPlayers() {
		return maxPlayers;
	}

	public void setMaxPlayers(Integer maxPlayers) {
		this.maxPlayers = maxPlayers;
	}

	public Integer getMinPlayers() {
		return minPlayers;
	}

	public void setMinPlayers(Integer minPlayers) {
		this.minPlayers = minPlayers;
	}

	public Set<GamesVO> getGamesSet() {
		return gamesSet;
	}

	public void setGamesSet(Set<GamesVO> gamesSet) {
		this.gamesSet = gamesSet;
	}

}
