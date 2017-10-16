package eeit.groups.model;

import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import eeit.games.model.GamesVO;
import hibernate.util.HibernateUtil;

public class GroupsDAO_Hibernate implements GroupsDAO_interface {

	private static final String GET_ALL_STMT = "FROM GroupsVO";

	@SuppressWarnings("unchecked")
	@Override
	public Set<GroupsVO> getAll() {
		Set<GroupsVO> set = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<GroupsVO>(query.list());

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}


	@Override
	public void insert(GroupsVO groupsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			session.saveOrUpdate(groupsVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer groupID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			// Query query = session.createQuery(DELETE_STMT);
			// query.setParameter(0, groupID);
			// System.out.println("delete: " + query.executeUpdate());

			GroupsVO groupsVO = (GroupsVO) session.get(GroupsVO.class, groupID);
			session.delete(groupsVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(GroupsVO groupsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			session.saveOrUpdate(groupsVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public GroupsVO findByGroupID(Integer groupID) {
		GroupsVO gVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			gVO = (GroupsVO) session.get(GroupsVO.class, groupID);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return gVO;
	}

	public static void main(String args[]) {
		GroupsDAO_Hibernate dao = new GroupsDAO_Hibernate();

		// *****insert*****

		// GroupsVO gVO1 = new GroupsVO();
		// gVO1.setSeasonID(1002);
		// gVO1.setGroupName("北區");
		// gVO1.setMaxTeams(10);
		// gVO1.setMinTeams(5);
		// gVO1.setCurrentTeams(2);
		// gVO1.setMaxPlayers(18);
		// gVO1.setMinPlayers(7);
		// dao.insert(gVO1);

		// *****delete*****

		// dao.delete(2001);

		// *****update*****

		// GroupsVO gVO3 = new GroupsVO();
		// gVO3.setSeasonID(1002);
		// gVO3.setGroupName("北區");
		// gVO3.setMaxTeams(10);
		// gVO3.setMinTeams(5);
		// gVO3.setCurrentTeams(2);
		// gVO3.setMaxPlayers(18);
		// gVO3.setMinPlayers(7);
		// gVO3.setGroupID(2004);
		// dao.update(gVO3);

		// *****getAll*****
		 Set<GroupsVO> set1 = dao.getAll();
		 for (GroupsVO gVO : set1) {
		 System.out.print(gVO.getGroupID() + ", ");
		 System.out.print(gVO.getSeasonVO().getSeasonID() + ", ");
		 System.out.print(gVO.getSeasonVO().getSeasonName() + ", ");
		 System.out.print(gVO.getGroupName() + ", ");
		 System.out.print(gVO.getMaxTeams() + ", ");
		 System.out.print(gVO.getMinTeams() + ", ");
		 System.out.print(gVO.getCurrentTeams() + ", ");
		 System.out.print(gVO.getMaxPlayers() + ", ");
		 System.out.print(gVO.getMinPlayers());
		 System.out.println();
		 }


		// *****findByGroupID*****
//		GroupsVO gVO = dao.findByGroupID(2001);
//		Set<GamesVO> gSet = gVO.getGamesSet();
//
//		for (GamesVO g : gSet) {
//			System.out.print(g.getGameID() + ", ");
//			System.out.print(gVO.getGroupID() + ", ");
//			System.out.println();
//		}

	}

}
