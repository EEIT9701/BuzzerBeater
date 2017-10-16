package eeit.players.model;

import java.util.Set;

public interface PlayerDAO_interface {
	public void insert(PlayerVO playerVO);
	public void update(PlayerVO playerVO);
	public void delete(Integer playerID);
	public Set<PlayerVO> findByPlayerName(String playerName);
	public Set<PlayerVO> getAll();
}
