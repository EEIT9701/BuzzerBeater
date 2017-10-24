package eeit.players.model;

import java.util.Set;

public interface PlayerDAO_interface {
	public void insert(PlayersVO playerVO);
	public void update(PlayersVO playerVO);
	public void delete(Integer playerID);
	public Set<PlayersVO> findByPlayerName(String playerName);
	public Set<PlayersVO> getAll();
	public PlayersVO findByID(Integer playerID);
}
