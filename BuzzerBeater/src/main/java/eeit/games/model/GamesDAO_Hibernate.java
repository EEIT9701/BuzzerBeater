package eeit.games.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class GamesDAO_Hibernate implements GamesDAO_interface {

	private static final String GET_ALL_STMT = "from GamesVO";

	@SuppressWarnings("unchecked")
	@Override
	public Set<GamesVO> getAll() {
		Set<GamesVO> set = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<GamesVO>(query.list());
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}

	@Override
	public Integer insert(GamesVO gVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(gVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;

	}

	@Override
	public void update(GamesVO gVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(gVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer gameID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			GamesVO gamesVO = (GamesVO) session.get(GamesVO.class, gameID);
			session.delete(gamesVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public GamesVO findByGameID(Integer gameID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GamesVO> findByGroupID(Integer groupID) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {

		GamesDAO_Hibernate dao = new GamesDAO_Hibernate();
		// dao.delete(4001);

		Set<GamesVO> set = dao.getAll();
		for (GamesVO gvo : set) {
			System.out.print(gvo.getGameID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupName() + ", ");
			System.out.print(gvo.getLocationinfoVO().getLocationName() + ", ");
			System.out.println();
		}
	}

}
