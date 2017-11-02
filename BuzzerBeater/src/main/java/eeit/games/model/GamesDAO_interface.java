package eeit.games.model;

import java.util.List;
import java.util.Set;

public interface GamesDAO_interface {

	public Set<GamesVO> getAll();

	public Integer insert(GamesVO gamesVO);

	public void update(GamesVO gamesVO);

	public void delete(Integer gameID);

	public GamesVO findByGameID(Integer gameID);

	public List<GamesVO> findByGroupID(Integer groupID);

	public List<GamesVO> findByTeamID(Integer teamID);

	public void deleteByGroupID(Integer groupID);

}
