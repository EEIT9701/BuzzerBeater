package eeit.memberinfo.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.*;

import hibernate.util.HibernateUtil;

public class MemberInfoHibernateDAO implements MemberInfoDAO_interface {
	private static final String GET_ALL_STMT = "FROM MemberInfoVO order by memberID";
	// private static final String GET_ALL_STMT = "SELECT * FROM MemberInfo
	// order by memberID";
	// private static final String GET_ONE_STMT = "SELECT * FROM MemberInfo
	// where memberID = ?";
	// private static final String DELETE = "DELETE FROM MemberInfo where
	// memberID = ?";
	//
	// private static final String UPDATE = "UPDATE MemberInfo set name=?,
	// auth=?, registerTime=? where memberID = ?";

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

	//
	// @Override
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

	/*** 比對資料庫是否有帳號 ***/
	@SuppressWarnings({ "deprecation", "rawtypes", "null" })
	@Override
	public MemberInfoVO findByAcc(String account) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Iterator result = null;
		Transaction tx = null;
		MemberInfoVO memberInfoVO = null;
		try {
			tx = session.beginTransaction();

			Query query = session.createQuery("from MemberInfoVO where acc=?");
			query.setParameter(0, account);
			List<MemberInfoVO> list = query.list();
			for (MemberInfoVO aMemberInfoVO : list) {
				// System.out.print(aMemberInfoVO.getAcc() + ",");
				// System.out.print(aMemberInfoVO.getAuth() + ",");
				// System.out.print(aMemberInfoVO.getName() + ",");
				// System.out.print(aMemberInfoVO.getMemberID() + ",");
				// System.out.print(aMemberInfoVO.getRegisterTime() + ",");
				// System.out.print(aMemberInfoVO.getTeamID());
				// System.out.println();
				memberInfoVO.setAcc(aMemberInfoVO.getAcc());
				memberInfoVO.setAuth(aMemberInfoVO.getAuth());
				memberInfoVO.setMemberID(aMemberInfoVO.getMemberID());
				memberInfoVO.setName(aMemberInfoVO.getName());
				memberInfoVO.setRegisterTime(aMemberInfoVO.getRegisterTime());
				memberInfoVO.setTeamID(aMemberInfoVO.getTeamID());
			}

			tx.commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberInfoVO;
	}
	// public static void main(String[] args) {
	// MemberInfoHibernateDAO dao = new MemberInfoHibernateDAO();
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

	// /*************** getALL ***************/
	// List<MemberInfoVO> list = dao.getAll();
	// for (MemberInfoVO aMemberInfoVO : list) {
	// System.out.print(aMemberInfoVO.getMemberID() + "\t");
	// System.out.print(aMemberInfoVO.getAcc() + "\t");
	// System.out.print(aMemberInfoVO.getName() + "\t");
	// System.out.print(aMemberInfoVO.getAuth() + "\t");
	// System.out.print(aMemberInfoVO.getRegisterTime() + "\t");
	// System.out.print(aMemberInfoVO.getTeamID());
	// System.out.println();
	// }

}
