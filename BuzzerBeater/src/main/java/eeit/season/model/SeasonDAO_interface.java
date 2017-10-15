package eeit.season.model;

import java.util.Set;

public interface SeasonDAO_interface {
	public void insert(SeasonVO seasonVO);

	public void update(SeasonVO seasonVO);

	public Integer delete(Integer seasonID);

	public Set<SeasonVO> getAll();
	
	public SeasonVO getOneByID(Integer seasonID);
}
