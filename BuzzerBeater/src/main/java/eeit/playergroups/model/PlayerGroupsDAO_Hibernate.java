package eeit.playergroups.model;

import java.util.Set;

import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class PlayerGroupsDAO_Hibernate implements PlayerGroupsDAO_interface {

	private static final String GET_ALL_STMT = "FROM PlayerGroupsVO";

	@Override
	public Set<PlayerGroupsVO> getAll() {
		Set<PlayerGroupsVO> set = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.createQuery(GET_ALL_STMT);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
		}
		return set;
	}

	@Override
	public void insert(PlayerGroupsVO playerGroupsVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(PlayerGroupsVO playerGroupsVO) {

	}
	
	public static void main (String[] args){
		PlayerGroupsDAO_Hibernate dao = new PlayerGroupsDAO_Hibernate();
		Set<PlayerGroupsVO> set = dao.getAll();
		for(PlayerGroupsVO vo : set){
			System.out.print(vo.getGroupsVO().getGroupName()+", ");
			System.out.print(vo.getPlayersVO().getPlayerName()+", ");
			System.out.print(vo.getPlayersVO().getHeight()+", ");
			System.out.print(vo.getGroupsVO().getSeasonVO().getSeasonName()+", ");
		}
	}

}
