package eeit.locationinfo.model;

import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import eeit.games.model.GamesVO;
import hibernate.util.HibernateUtil;

public class LocationinfoDAO_Hibernate implements LocationinfoDAO_interface {

	private static final String GET_ALL_STMT = "FROM LocationinfoVO ORDER BY locationID";

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
			for (GamesVO gvo : lVO.getGamesSet()) {
				System.out.print(gvo.getGameID() + ", ");
			}
			System.out.println();
		}
	}

}
