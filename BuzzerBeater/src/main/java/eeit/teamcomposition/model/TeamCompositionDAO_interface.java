package eeit.teamcomposition.model;

import java.util.Set;

public interface TeamCompositionDAO_interface {
	public void insert(TeamCompositionVO teamCompositionVO);

	public void update(TeamCompositionVO teamCompositionVO);

	public void delete(Integer teamID);

	public Set<TeamCompositionVO> getAll();

	public TeamCompositionVO findByTeamID(Integer teamID);

	public TeamCompositionVO findByPlayerID(Integer playerID);
}
