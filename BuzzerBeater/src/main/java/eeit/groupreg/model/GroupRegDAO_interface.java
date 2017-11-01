package eeit.groupreg.model;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface GroupRegDAO_interface {

	public Set<GroupRegVO> getAll();

	public void insert(GroupRegVO gVO);

	public void update(GroupRegVO gVO);

	public void deleteByTeamID(Integer teamID);

	public void deleteByGroupID(Integer groupID);

	public void deleteByCID(Integer teamID, Integer groupID);

	public List<GroupRegVO> findByGroupID(Integer groupID);

	public List<GroupRegVO> findByTeamID(Integer teamID);

	public List<Map<String, Object>> findSignUpPlayer(Integer groupID, Integer teamID);
}
