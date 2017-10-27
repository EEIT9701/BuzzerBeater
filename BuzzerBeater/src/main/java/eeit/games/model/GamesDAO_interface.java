package eeit.games.model;

import java.util.Set;

public interface GamesDAO_interface {
	
	public Set<GamesVO> getAll();

	public void insert(GamesVO gVO);

	public void update(GamesVO gVO);

	public void delete(Integer gameID);
	
	public GamesVO findByID(Integer gameID);
}
