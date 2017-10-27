package eeit.playergroups.model;

import java.util.List;
import java.util.Set;

interface PlayerGroupsDAO_interface {

	public Set<PlayerGroupsVO> getAll();

	public void insert(PlayerGroupsVO playerGroupsVO);

	public void update(PlayerGroupsVO playerGroupsVO);

	public List<PlayerGroupsVO> findByPlayerID(Integer playerID);

	public List<PlayerGroupsVO> findByGroupID(Integer groupID);

}
