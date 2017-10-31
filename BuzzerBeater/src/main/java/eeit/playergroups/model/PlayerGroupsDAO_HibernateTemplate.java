package eeit.playergroups.model;

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
public class PlayerGroupsDAO_HibernateTemplate implements PlayerGroupsDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM PlayerGroupsVO";
	private static final String FIND_BY_PLAYERID = "FROM PlayerGroupsVO WHERE playerID=?";
	private static final String FIND_BY_GROUPID = "FROM PlayerGroupsVO WHERE groupID=?";
	private static final String FIND_BY_CID = "FROM PlayerGroupsVO WHERE groupID=? AND playerID=?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void deleteByPlayerID(Integer playerID) {
		List<PlayerGroupsVO> list = (List<PlayerGroupsVO>) hibernateTemplate.find(FIND_BY_PLAYERID, playerID);
		hibernateTemplate.deleteAll(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void deleteByGroupID(Integer groupID) {
		List<PlayerGroupsVO> list = (List<PlayerGroupsVO>) hibernateTemplate.find(FIND_BY_GROUPID, groupID);
		hibernateTemplate.deleteAll(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void deleteByCID(Integer playerID, Integer groupID) {
		List<PlayerGroupsVO> list = (List<PlayerGroupsVO>) hibernateTemplate.find(FIND_BY_CID, groupID, playerID);
		hibernateTemplate.deleteAll(list);
	}

	@Override
	public Set<PlayerGroupsVO> getAll() {
		List<PlayerGroupsVO> list = (List<PlayerGroupsVO>) hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<PlayerGroupsVO>(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(PlayerGroupsVO playerGroupsVO) {
		hibernateTemplate.save(playerGroupsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(PlayerGroupsVO playerGroupsVO) {
		hibernateTemplate.update(playerGroupsVO);
	}

	@Override
	public List<PlayerGroupsVO> findByPlayerID(Integer playerID) {
		return (List<PlayerGroupsVO>) hibernateTemplate.find(FIND_BY_PLAYERID, playerID);
	}

	@Override
	public List<PlayerGroupsVO> findByGroupID(Integer groupID) {
		return (List<PlayerGroupsVO>) hibernateTemplate.find(FIND_BY_GROUPID, groupID);
	}

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		PlayerGroupsDAO_interface dao = (PlayerGroupsDAO_interface) context.getBean("PlayerGroupsDAO");

		
		Set<PlayerGroupsVO> set = dao.getAll();
		for (PlayerGroupsVO vo : set) {
			System.out.print(vo.getGroupsVO().getGroupName() + ", ");
			System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
			System.out.print(vo.getPlayersVO().getHeight() + ", ");
			System.out.print(vo.getGroupsVO().getSeasonVO().getSeasonName() + ", ");
			System.out.println();
		}
	}

}
