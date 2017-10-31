package eeit.gamemedia.model;

import java.util.*;

public interface GameMediaDAO_Interface {
	public Integer insert(GameMediaVO gameMediaVO);

	public void update(GameMediaVO gameMediaVO);

	public void delete(Integer mediaID);

	public GameMediaVO findByPrimaryKey(Integer gameMediaVO);

	public List<GameMediaVO> getAll();
}
