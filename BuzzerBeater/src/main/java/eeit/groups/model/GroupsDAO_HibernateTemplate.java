package eeit.groups.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class GroupsDAO_HibernateTemplate implements GroupsDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM GroupsVO";

	@SuppressWarnings("unchecked")
	@Override
	public Set<GroupsVO> getAll() {
		List<GroupsVO> list = (List<GroupsVO>) hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<GroupsVO>(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(GroupsVO groupsVO) {
		hibernateTemplate.save(groupsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer groupID) {
//		GroupsVO groupsVO = hibernateTemplate.get(GroupsVO.class, groupID);
		GroupsVO groupsVO = new GroupsVO();
		groupsVO.setGroupID(groupID);
		hibernateTemplate.delete(groupsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(GroupsVO groupsVO) {
		hibernateTemplate.update(groupsVO);
	}

	@Override
	public GroupsVO findByGroupID(Integer groupID) {
		GroupsVO groupsVO = hibernateTemplate.get(GroupsVO.class, groupID);
		return groupsVO;
	}

	public static void main(String args[]) {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		GroupsDAO_interface dao = (GroupsDAO_interface) context.getBean("GroupsDAO");

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

		// *****delete*****
		
		 dao.delete(2004);
		
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
		// GroupsVO gVO = dao.findByGroupID(2001);
		// Set<GamesVO> gSet = gVO.getGamesSet();
		//
		// for (GamesVO g : gSet) {
		// System.out.print(g.getGameID() + ", ");
		// System.out.print(gVO.getGroupID() + ", ");
		// System.out.println();
		// }

	}

}
