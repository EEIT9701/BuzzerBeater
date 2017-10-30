package eeit.playergroups.model;

import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.groups.model.GroupsVO;
import eeit.players.model.PlayersVO;

public class PlayerGroupsService {
	private PlayerGroupsDAO_interface dao;

	public PlayerGroupsService() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (PlayerGroupsDAO_interface) context.getBean("PlayerGroupsDAO");
	}

	public Set<PlayerGroupsVO> getAll() {
		return dao.getAll();
	}

	public void insert(Integer groupID, Integer playerID) {
		PlayerGroupsVO playerGroupsVO = new PlayerGroupsVO();

		GroupsVO groupsVO = new GroupsVO();
		groupsVO.setGroupID(groupID);
		playerGroupsVO.setGroupsVO(groupsVO);

		PlayersVO playersVO = new PlayersVO();
		playersVO.setPlayerID(playerID);
		playerGroupsVO.setPlayersVO(playersVO);

		dao.insert(playerGroupsVO);
	}

	public void update(Integer groupID, Integer playerID) {
		PlayerGroupsVO playerGroupsVO = new PlayerGroupsVO();

		GroupsVO groupsVO = new GroupsVO();
		groupsVO.setGroupID(groupID);
		playerGroupsVO.setGroupsVO(groupsVO);

		PlayersVO playersVO = new PlayersVO();
		playersVO.setPlayerID(playerID);
		playerGroupsVO.setPlayersVO(playersVO);

		dao.insert(playerGroupsVO);
	}

	public List<PlayerGroupsVO> findByPlayerID(Integer playerID) {
		return dao.findByPlayerID(playerID);
	}

	public List<PlayerGroupsVO> findByGroupID(Integer groupID) {
		return dao.findByGroupID(groupID);
	}
	
	public void deleteByPlayerID(Integer playerID){
		dao.deleteByPlayerID(playerID);
	}

	public void deleteByGroupID(Integer groupID){
		dao.deleteByGroupID(groupID);
	}

	public void deleteByCID(Integer playerID, Integer groupID){
		dao.deleteByCID(playerID, groupID);
	}
}
