package eeit.memberinfo.model;

import java.util.*;

import org.hibernate.*;
import hibernate.util.HibernateUtil;

public class MemberInfoDAO implements MemberInfoDAO_interface {
	private static final String GET_ALL_STMT = "FROM MemberInfoVO order by memberID";

	@Override
	public void insert(MemberInfoVO memberInfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			session.saveOrUpdate(memberInfoVO);
			session.getTransaction().commit();

		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
		}
	}

	@Override
	public void update(MemberInfoVO memberInfoVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			session.saveOrUpdate(memberInfoVO);
			session.getTransaction().commit();

		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
		}

	}

	@Override
	public void delete(Integer memberID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		MemberInfoVO memberInfoVO = new MemberInfoVO();
		try {
			session.beginTransaction();
			memberInfoVO.setMemberID(memberID);
			session.delete(memberInfoVO);
			session.getTransaction().commit();

		} catch (RuntimeException re) {
			session.getTransaction().rollback();
		}

	}

	@Override
	public MemberInfoVO findByPK(Integer memberID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		MemberInfoVO memberInfoVO = null;

		try {
			session.beginTransaction();
			memberInfoVO = (MemberInfoVO) session.get(MemberInfoVO.class, memberID);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return memberInfoVO;
	}

	@Override
	public List<MemberInfoVO> getAll() {
		MemberInfoVO memberInfoVO = null;
		List<MemberInfoVO> list = new ArrayList<MemberInfoVO>();

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			throw re;
		}

		return list;
	}

	@SuppressWarnings({ "deprecation", "rawtypes" })
	@Override
	public boolean findByAcc(String acc) {
			
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Iterator result = null;
		try {
			session.beginTransaction();
			
			Query query = session.createQuery("from MemberInfoVO where acc=?");	
			query.setParameter(0, acc);
			result = query.iterate();
			if(result.hasNext()){
				return true;
			}
			else return false;
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

//	 public static void main(String[] args) {
//	 MemberInfoDAO dao = new MemberInfoDAO();
	 
//	 /*************** findByAcc ***************/
//	 
//	 String acc = "admin123@gmail.com";
//	 System.out.println(dao.findByAcc(acc));
	// /*************** insert ***************/
	// MemberInfoVO memberInfoVO = new MemberInfoVO();
	// memberInfoVO.setAcc("javaeeit97201701@gmail.com");
	// memberInfoVO.setName("彥誠");
	// memberInfoVO.setAuth("parttime");
	// memberInfoVO.setRegisterTime(Timestamp.valueOf("2017-10-10 18:00:00"));
	// memberInfoVO.setTeamID(0);
	// dao.insert(memberInfoVO);

	/*************** update ***************/
	// MemberInfoVO memberInfoVO2 = new MemberInfoVO();
	// memberInfoVO2.setMemberID(8018);
	// memberInfoVO2.setAcc("javaeeit9720170101@gmail.com");
	// memberInfoVO2.setName("彥誠2");
	// memberInfoVO2.setAuth("admin");
	// memberInfoVO2.setRegisterTime(Timestamp.valueOf("2017-10-10 20:00:00"));
	// memberInfoVO2.setTeamID(0);
	// dao.insert(memberInfoVO2);
	/*************** delete ***************/
	// dao.delete(8018);

	/*************** findBuPK ***************/
	// MemberInfoVO memberInfoVO = dao.findByPK(8002);
	// System.out.println(memberInfoVO.getTeamID());
	// System.out.println(memberInfoVO.getAcc());
	// System.out.println(memberInfoVO.getName());
	// System.out.println(memberInfoVO.getAuth());
	// System.out.println(memberInfoVO.getRegisterTime());
	// System.out.println(memberInfoVO.getMemberID());

	/*************** getALL ***************/
//	 List<MemberInfoVO> list = dao.getAll();
//	 for (MemberInfoVO aMemberInfoVO : list) {
//	 System.out.print(aMemberInfoVO.getMemberID() + "\t");
//	 System.out.print(aMemberInfoVO.getAcc() + "\t");
//	 System.out.print(aMemberInfoVO.getName() + "\t");
//	 System.out.print(aMemberInfoVO.getAuth() + "\t");
//	 System.out.print(aMemberInfoVO.getRegisterTime() + "\t");
//	 System.out.print(aMemberInfoVO.getTeamID());
//	 System.out.println();
//	 }
//	
//	}
}
