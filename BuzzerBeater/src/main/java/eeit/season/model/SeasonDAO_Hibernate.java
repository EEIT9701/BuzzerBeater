package eeit.season.model;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import eeit.groups.model.GroupsVO;
import hibernate.util.HibernateUtil;

public class SeasonDAO_Hibernate implements SeasonDAO_interface {

	private static final String GET_ALL_SEASON = "from SeasonVO order by seasonbegindate desc";

	@Override
	public SeasonVO findBySeasonID(Integer seasonID) {
		SeasonVO sVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			sVO = (SeasonVO) session.get(SeasonVO.class, seasonID);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return sVO;
	}

	@Override
	public void insert(SeasonVO seasonVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(seasonVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(SeasonVO seasonVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(seasonVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public Integer delete(Integer seasonID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			SeasonVO seasonVO = (SeasonVO) session.get(SeasonVO.class, seasonID);
			session.delete(seasonVO);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}


	@SuppressWarnings("unchecked")
	@Override
	public Set<SeasonVO> getAll() {
		Set<SeasonVO> set = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			Query query = session.createQuery(GET_ALL_SEASON);
			set = new LinkedHashSet<SeasonVO>(query.list());
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return set;
	}

	public static void main(String args[]) {
		SeasonDAO_Hibernate dao = new SeasonDAO_Hibernate();

		/****************** getOneByID ******************/

//		 SeasonVO sVO3 = dao.findBySeasonID(1001);
//		 Set<GroupsVO> set = sVO3.getGroupsSet();
//		 
//		 for(GroupsVO g:set){
//			 System.out.print(sVO3.getSeasonName()+", ");
//			 System.out.println(g.getGroupName()+", ");
//		 }

		/****************** insert ******************/

//		 SeasonVO sVO1 = new SeasonVO();
//		 sVO1.setSeasonName("第十六季例行賽");
//		 sVO1.setSeasonBeginDate(null);
//		 sVO1.setSignUpBegin(Timestamp.valueOf("2017-10-10 18:00:00"));
//		 sVO1.setDescriptions("...");
//		 
//		 GroupsVO gVO1 = new GroupsVO();
//		 gVO1.setGroupName("新增1");
//		 gVO1.setMaxPlayers(3);
//		 GroupsVO gVO2 = new GroupsVO();
//		 gVO2.setGroupName("新增2");
//		 gVO2.setMaxPlayers(3);
//		 Set<GroupsVO> gSet = new LinkedHashSet<GroupsVO>();
//		 gSet.add(gVO1);
//		 gSet.add(gVO2);
//		 sVO1.setGroupsSet(gSet);
//		 dao.insert(sVO1);

		/****************** update ******************/

//		 SeasonVO sVO2 = new SeasonVO();
//		 sVO2.setSeasonID(1003);
//		 sVO2.setSeasonName("已修改");
//		 sVO2.setDescriptions("已修改");
//		 dao.update(sVO2);

		/****************** delete ******************/

//		dao.delete(1001);

		/****************** getAll ******************/

		Set<SeasonVO> set = dao.getAll();
		for (SeasonVO sVO : set) {
			System.out.print(sVO.getSeasonID() + ", ");
			System.out.print(sVO.getSeasonName() + ", ");
			System.out.print(sVO.getSeasonBeginDate() + ", ");
			System.out.print(sVO.getSeasonEndDate() + ", ");
			System.out.print(sVO.getSignUpBegin() + ", ");
			System.out.print(sVO.getSignUpEnd() + ", ");
			System.out.print(sVO.getDescriptions());
			Set<GroupsVO> gVO = sVO.getGroupsSet();
			for(GroupsVO v:gVO){
				System.out.print(v.getGroupID());
			}
			System.out.println();
		}

	}

}
