package eeit.groupreg.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class GroupRegDAO_Hibernate implements GroupRegDAO_interface {

	private static final String GET_ALL_STMT = "from GroupRegVO";

	@SuppressWarnings("unchecked")
	@Override
	public Set<GroupRegVO> getAll() {
		Set<GroupRegVO> set = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			set = new LinkedHashSet<GroupRegVO>(query.list());
			
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}


	@Override
	public void insert(GroupRegVO gVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void update(GroupRegVO gVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void delete(Integer games_ID) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<GroupRegVO> findByGroupID(Integer groupID) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<GroupRegVO> findByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static void main(String[] args) {

		GroupRegDAO_Hibernate dao = new GroupRegDAO_Hibernate();
		
//		dao.delete(4001);

		Set<GroupRegVO> set = dao.getAll();
		for (GroupRegVO gvo : set) {
			System.out.print(gvo.getGroupsVO().getSeasonVO().getSeasonBeginDate() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupName() + ", ");
			System.out.print(gvo.getTeamsVO().getTeamName() + ", ");
			System.out.print(gvo.getPaymentNumber() + ", ");
			System.out.println();
		}
	}

}
