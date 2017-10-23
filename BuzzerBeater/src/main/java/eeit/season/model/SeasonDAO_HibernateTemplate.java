package eeit.season.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import eeit.groups.model.GroupsVO;

@Transactional(readOnly = true)
public class SeasonDAO_HibernateTemplate implements SeasonDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_SEASON = "from SeasonVO";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public SeasonVO findBySeasonID(Integer seasonID) {
		return (SeasonVO) hibernateTemplate.get(SeasonVO.class, seasonID);
	}

	@Override
	public void insert(SeasonVO seasonVO) {
		hibernateTemplate.save(seasonVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(SeasonVO seasonVO) {
		hibernateTemplate.update(seasonVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Integer delete(Integer seasonID) {
		SeasonVO seasonVO = (SeasonVO) hibernateTemplate.get(SeasonVO.class, seasonID);
		hibernateTemplate.delete(seasonVO);
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Set<SeasonVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_SEASON);
		return new LinkedHashSet<SeasonVO>((List<SeasonVO>) obj);
	}

	public static void main(String args[]) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		SeasonDAO_interface dao = (SeasonDAO_interface) context.getBean("SeasonDAO");

		/****************** getOneByID ******************/

		// SeasonVO sVO3 = dao.findBySeasonID(1001);
		// Set<GroupsVO> set = sVO3.getGroupsSet();
		//
		// for(GroupsVO g:set){
		// System.out.print(sVO3.getSeasonName()+", ");
		// System.out.println(g.getGroupName()+", ");
		// }

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

//		 dao.delete(1001);

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
			for (GroupsVO v : gVO) {
				System.out.print(v.getGroupID());
			}
			System.out.println();
		}

	}

}
