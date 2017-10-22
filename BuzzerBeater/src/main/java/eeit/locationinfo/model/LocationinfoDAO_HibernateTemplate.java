package eeit.locationinfo.model;

import java.io.File;
import java.io.FileInputStream;
import java.util.Base64;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import eeit.games.model.GamesVO;

@Transactional(readOnly = true)
public class LocationinfoDAO_HibernateTemplate implements LocationinfoDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM LocationinfoVO ORDER BY locationID";

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Set<LocationinfoVO> getAll() {
		List<LocationinfoVO> list = (List<LocationinfoVO>) hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<LocationinfoVO>(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public LocationinfoVO findByID(Integer locationID) {
		return (LocationinfoVO) hibernateTemplate.get(LocationinfoVO.class, locationID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(LocationinfoVO locationinfoVO) {
		hibernateTemplate.save(locationinfoVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(LocationinfoVO locationinfoVO) {
		hibernateTemplate.update(locationinfoVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer locationinfoID) {
		LocationinfoVO locationinfoVO = (LocationinfoVO) hibernateTemplate.get(LocationinfoVO.class, locationinfoID);
		hibernateTemplate.delete(locationinfoVO);
	}

	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		LocationinfoDAO_interface dao = (LocationinfoDAO_interface) context.getBean("LocationinfoDAO");

		// dao.delete(101);

		// LocationinfoVO locVO = dao.findByID(101);
		// System.out.print(locVO.getLocationName()+", ");
		// System.out.print(locVO.getLocationAddr()+", ");
		// System.out.println();

		// LocationinfoVO locVO = new LocationinfoVO();
		// locVO.setLocationID(101);
		// locVO.setLocationName("修改");
		// locVO.setLocationAddr("修改");
		// dao.update(locVO);

		// 新增
		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationName("圖片測試");
		locVO.setLocationAddr("addr");
		locVO.setLocationMark("mark");

		File file = new File("C:/Users/Student/Downloads/tomcat.gif");
		FileInputStream fis = new FileInputStream(file);
		byte[] bt = IOUtils.toByteArray(fis);
		Base64.Encoder encoder = Base64.getEncoder();
		String encodedText = encoder.encodeToString(bt);

		locVO.setLocationPhoto(encodedText);
		dao.insert(locVO);

		// 查詢全部
		Set<LocationinfoVO> set = dao.getAll();
		for (LocationinfoVO lVO : set) {
			System.out.print(lVO.getLocationName() + ": ");
			System.out.print(lVO.getLocationAddr() + ": ");
			System.out.print(lVO.getLocationID() + ", gameID: ");
			for (GamesVO gvo : lVO.getGamesSet()) {
				System.out.print(gvo.getGameID() + ", ");
			}
			System.out.println();
		}
	}

}
