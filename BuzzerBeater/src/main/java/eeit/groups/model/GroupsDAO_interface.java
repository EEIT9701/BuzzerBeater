package eeit.groups.model;

import java.util.List;
import java.util.Set;

public interface GroupsDAO_interface {
	public Set<GroupsVO> getAll();
	public List<GroupsVO> findBySeasonID(Integer seasonID);
	public GroupsVO findByGroupID(Integer groupID);
	public void insert(GroupsVO groupsVO);

	public void delete(Integer groupID);

	public void update(GroupsVO groupsVO);
}
