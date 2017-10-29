package eeit.groupreg.model;

import java.util.List;
import java.util.Set;

public interface GroupRegDAO_interface {
	
	public Set<GroupRegVO> getAll();
	
	public void insert(GroupRegVO gVO);

	public void update(GroupRegVO gVO);

	public void delete(Integer teamID);
	
	public List<GroupRegVO> findByGroupID(Integer groupID);
	
	public List<GroupRegVO> findByTeamID(Integer teamID);
}
