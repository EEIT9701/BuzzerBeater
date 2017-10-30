package eeit.teams.model;

import java.util.Set;

interface TeamsDAO_interface {
	public void insert(TeamsVO teamsVO);

	public void update(TeamsVO teamsVO);

	public void delete(Integer teamID);

	public Set<TeamsVO> getAll();

	public TeamsVO findByID(Integer teamID);
	
	public Integer findMaxID();

}
