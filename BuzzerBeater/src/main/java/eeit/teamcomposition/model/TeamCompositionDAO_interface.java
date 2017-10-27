package eeit.teamcomposition.model;

import java.util.List;
import java.util.Set;

public interface TeamCompositionDAO_interface {
	public void insert(TeamCompositionVO teamCompositionVO);

	public void update(TeamCompositionVO teamCompositionVO);

	public void deleteByTeamID(Integer teamID);

	public void deleteByPlayerID(Integer playerID);

	public Set<TeamCompositionVO> getAll();

	public List<TeamCompositionVO> findByTeamID(Integer teamID);

	public List<TeamCompositionVO> findByPlayerID(Integer playerID);
}
