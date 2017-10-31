package eeit.locationinfo.model;

import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LocationinfoService {

	private LocationinfoDAO_interface dao = null;

	public LocationinfoService() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (LocationinfoDAO_interface) context.getBean("LocationinfoDAO");
	}

	public Set<LocationinfoVO> getAll() {
		return dao.getAll();
	}
	
	public Set<LocationinfoVO> getAllList(){
		dao = new LocationinfoDAO_JDBC();
		return dao.getAllList();
	}

	public LocationinfoVO findByID(Integer locationID) {
		return dao.findByID(locationID);
	}

	public void insert(String locationName, String locationAddr, String locationMark, String locationPhoto) {
		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationName(locationName);
		locVO.setLocationAddr(locationAddr);
		locVO.setLocationPhoto(locationPhoto);
		dao.insert(locVO);
	}

	public void update(Integer locationID, String locationName, String locationAddr, String locationMark,
			String locationPhoto) {

		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationID(locationID);
		locVO.setLocationName(locationName);
		locVO.setLocationAddr(locationAddr);
		locVO.setLocationPhoto(locationPhoto);
		dao.update(locVO);
	}

	public void delete(Integer locationID) {
		dao.delete(locationID);
	}
}
