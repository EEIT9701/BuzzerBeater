package eeit.locationinfo.model;

import java.util.Set;

public class LocationinfoService {

	LocationinfoDAO_Hibernate dao = new LocationinfoDAO_Hibernate();

	public Set<LocationinfoVO> getAll() {
		return dao.getAll();
	}

	public LocationinfoVO findByID(Integer locationID) {
		return dao.findByID(locationID);
	}

	public void insert(String locationName, String locationAddr) {
		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationName(locationName);
		locVO.setLocationAddr(locationAddr);
		dao.update(locVO);
	}

	public void update(Integer locationID, String locationName, String locationAddr) {
		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationID(locationID);
		locVO.setLocationName(locationName);
		locVO.setLocationAddr(locationAddr);
		dao.update(locVO);
	}

	public void delete(Integer locationID) {
		dao.delete(locationID);
	}
}
