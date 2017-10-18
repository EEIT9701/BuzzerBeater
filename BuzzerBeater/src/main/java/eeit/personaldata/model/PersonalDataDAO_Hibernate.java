package eeit.personaldata.model;

import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class PersonalDataDAO_Hibernate implements PersonalDataDAO_interface {

	private static final String GET_ALL_STMT = "FROM PersonalDataVO";

	@SuppressWarnings("unchecked")
	@Override
	public Set<PersonalDataVO> getAll() {
		Set<PersonalDataVO> set = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<PersonalDataVO>(query.list());
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}

	@Override
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer PersonalDataID) {
		// TODO Auto-generated method stub

	}

	public static void main(String args[]) {
		PersonalDataDAO_Hibernate dao = new PersonalDataDAO_Hibernate();

		Set<PersonalDataVO> set = dao.getAll();
		for (PersonalDataVO vo : set) {
			System.out.print(vo.getPlayersVO().getPlayerID() + ", ");
			System.out.print(vo.getGamesVO().getGameID() + ", ");
			System.out.print(vo.getTeamsVO().getTeamName() + ", ");
			System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
			System.out.print(vo.getQuarters() + ", ");
			System.out.println();
		}
	}

}
