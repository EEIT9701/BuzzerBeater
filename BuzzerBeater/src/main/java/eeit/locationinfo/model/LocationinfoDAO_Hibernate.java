package eeit.locationinfo.model;

import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import eeit.games.model.GamesVO;
import hibernate.util.HibernateUtil;

public class LocationinfoDAO_Hibernate implements LocationinfoDAO_interface {

	private static final String GET_ALL_STMT = "FROM LocationinfoVO ORDER BY locationID";

<<<<<<< HEAD
	@Override
	public Set<LocationinfoVO> getAll() {
		Set<LocationinfoVO> set = new LinkedHashSet<LocationinfoVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();

			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<LocationinfoVO>(query.list());

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}

	public static void main(String[] args) {
		LocationinfoDAO_Hibernate dao = new LocationinfoDAO_Hibernate();
		Set<LocationinfoVO> set = dao.getAll();

		for (LocationinfoVO lVO : set) {
			System.out.print(lVO.getLocationID() + ": ");
=======
	@SuppressWarnings("unchecked")
	@Override
	public Set<LocationinfoVO> getAll() {
		Set<LocationinfoVO> set = new LinkedHashSet<LocationinfoVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();

			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<LocationinfoVO>(query.list());

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}

	@Override
	public LocationinfoVO findByID(Integer locationID) {
		LocationinfoVO locVO = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			locVO = (LocationinfoVO) session.get(LocationinfoVO.class, locationID);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return locVO;
	}

	@Override
	public void insert(LocationinfoVO locationinfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(locationinfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(LocationinfoVO locationinfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(locationinfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer locationinfoID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			LocationinfoVO locationinfoVO = (LocationinfoVO) session.get(LocationinfoVO.class, locationinfoID);
			session.delete(locationinfoVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	public static void main(String[] args) {
		LocationinfoDAO_Hibernate dao = new LocationinfoDAO_Hibernate();

		// dao.delete(101);

		// LocationinfoVO locVO = dao.findByID(101);
		// System.out.print(locVO.getLocationName()+", ");
		// System.out.print(locVO.getLocationAddr()+", ");
		// System.out.println();

		 LocationinfoVO locVO = new LocationinfoVO();
		 locVO.setLocationID(101);
		 locVO.setLocationName("修改");
		 locVO.setLocationAddr("修改");
		 dao.update(locVO);
		//

		Set<LocationinfoVO> set = dao.getAll();
		for (LocationinfoVO lVO : set) {
			System.out.print(lVO.getLocationName() + ": ");
			System.out.print(lVO.getLocationAddr() + ": ");
			System.out.print(lVO.getLocationID() + ", gameID: ");
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
			for (GamesVO gvo : lVO.getGamesSet()) {
				System.out.print(gvo.getGameID() + ", ");
			}
			System.out.println();
		}
	}

}
