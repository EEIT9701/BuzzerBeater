package eeit.groups.model;

import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GroupsService {
	private GroupsDAO_interface dao;

	public GroupsService() {
//		dao = new GroupsDAO_Hibernate();
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (GroupsDAO_interface) context.getBean("GroupsDAO");
	}
	
	public GroupsVO findByGroupID(Integer groupID){
		return dao.findByGroupID(groupID);
	}

	public GroupsVO addGroups(Integer seasonID, String groupName, Integer maxTeams, Integer minTeams,
			Integer maxPlayers, Integer minPlayers) {

		GroupsVO gVO = new GroupsVO();
		gVO.setGroupName(groupName);
		gVO.setMaxTeams(maxTeams);
		gVO.setMinTeams(minTeams);
		gVO.setCurrentTeams(0);
		gVO.setMaxPlayers(maxPlayers);
		gVO.setMinPlayers(minPlayers);
		dao.insert(gVO);

		return gVO;
	}

	public GroupsVO updateGroups(Integer seasonID, String groupName, Integer maxTeams, Integer minTeams,
			Integer currentTeams, Integer maxPlayers, Integer minPlayers, Integer groupID) {

		GroupsVO gVO = new GroupsVO();
		gVO.setGroupName(groupName);
		gVO.setMaxTeams(maxTeams);
		gVO.setMinTeams(minTeams);
		gVO.setCurrentTeams(currentTeams);
		gVO.setMaxPlayers(maxPlayers);
		gVO.setMinPlayers(minPlayers);
		gVO.setGroupID(groupID);
		dao.update(gVO);

		return gVO;
	}

	public void deleteGroup(Integer groupID) {
		dao.delete(groupID);
	}

	public Set<GroupsVO> getAll() {
		return dao.getAll();
	}
}
