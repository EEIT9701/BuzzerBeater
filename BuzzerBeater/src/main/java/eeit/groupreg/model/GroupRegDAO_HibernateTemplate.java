package eeit.groupreg.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Transactional(readOnly = true)
public class GroupRegDAO_HibernateTemplate implements GroupRegDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM GroupRegVO";
	private static final String FIND_BY_GROUPID = "FROM GroupRegVO WHERE groupID=?";
	private static final String FIND_BY_TEAMID = "FROM GroupRegVO WHERE teamID=?";

	@Override
	public Set<GroupRegVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_STMT);
		Set<GroupRegVO> set = new LinkedHashSet<GroupRegVO>((List<GroupRegVO>) obj);
		return set;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(GroupRegVO gVO) {
		hibernateTemplate.save(gVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(GroupRegVO gVO) {
		hibernateTemplate.update(gVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer games_ID) {
		GroupRegVO groupRegVO = hibernateTemplate.get(GroupRegVO.class, games_ID);
		hibernateTemplate.delete(groupRegVO);
	}

	@Override
	public List<GroupRegVO> findByGroupID(Integer groupID) {
		return (List<GroupRegVO>) hibernateTemplate.find(FIND_BY_GROUPID, groupID);
	}

	@Override
	public List<GroupRegVO> findByTeamID(Integer teamID) {
		return (List<GroupRegVO>) hibernateTemplate.find(FIND_BY_TEAMID, teamID);
	}

	public static void main(String[] args) {

		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		GroupRegDAO_interface dao = (GroupRegDAO_interface) context.getBean("GroupRegDAO");

		// dao.delete(4001);

		Set<GroupRegVO> set = dao.getAll();
		for (GroupRegVO gvo : set) {
			System.out.print(gvo.getGroupsVO().getSeasonVO().getSeasonBeginDate() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupName() + ", ");
			System.out.print(gvo.getTeamsVO().getTeamName() + ", ");
			System.out.print(gvo.getPaymentNumber() + ", ");
			System.out.println();
		}

//		for (GroupRegVO vo : dao.findByTeamID(3002)) {
//			System.out.println(vo.getPaymentNumber());
//		}
	}

}
