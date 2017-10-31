package eeit.season.model;

import java.util.Set;

public interface SeasonDAO_interface {
	public Integer insert(SeasonVO seasonVO);

	public void update(SeasonVO seasonVO);

	public Integer delete(Integer seasonID);

	public Set<SeasonVO> getAll();
	
	public SeasonVO findBySeasonID(Integer seasonID);
	
	public Integer getLatestID();
}
