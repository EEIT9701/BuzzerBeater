package eeit.locationinfo.model;

import java.util.Set;

interface LocationinfoDAO_interface {

	public Set<LocationinfoVO> getAll();

	public LocationinfoVO findByID(Integer locationinfoID);

	public void insert(LocationinfoVO locationinfoVO);

	public void update(LocationinfoVO locationinfoVO);

	public void delete(Integer locationinfoID);
	
	public Set<LocationinfoVO> getAllList();
}
