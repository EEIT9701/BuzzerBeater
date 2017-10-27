package eeit.games.model;

import java.util.List;
import java.util.Set;

public interface GamesDAO_interface {

	public Set<GamesVO> getAll();

	public void insert(GamesVO gVO);

	public void update(GamesVO gVO);

	public void delete(Integer gameID);

	public GamesVO findByGameID(Integer gameID);

	public List<GamesVO> findByGroupID(Integer groupID);
}
