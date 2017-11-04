package eeit.personaldata.model;

import java.util.List;

import org.hibernate.Session;
import hibernate.util.HibernateUtil;

public class PersonalDataDAO_Hibernate implements PersonalDataDAO_interface {

	private static final String GET_ALL_STMT = "FROM PersonalDataVO";

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> getAll() {
		return null;
	}

	@Override
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(PersonalDataVO personalDataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			session.saveOrUpdate(personalDataVO);
			session.getTransaction().commit();

		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
		}
	}

	@Override
	public void update(PersonalDataVO personalDataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			session.saveOrUpdate(personalDataVO);
			session.getTransaction().commit();

		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
		}

	}

	@Override
	public void delete(PersonalDataVO personalDataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

	}


	@Override
	public List<PersonalDataVO> getAll1() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> getAll2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByGameID(Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlyerID2(Integer playerID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByGameIDAndTeamID(Integer GameID, Integer TeamID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlayerIDAndGameID(Integer PlayerID, Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlayerID(Integer playerID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> getAllSeasonID(Integer SeasonID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> getAllGroupID(Integer GroupID) {
		// TODO Auto-generated method stub
		return null;
	}

}
