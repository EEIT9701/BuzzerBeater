package eeit.groupreg.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.groups.model.GroupsVO;
import eeit.teams.model.TeamsVO;

public class GroupRegService {
	private GroupRegDAO_interface dao;

	public GroupRegService() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (GroupRegDAO_interface) context.getBean("GroupRegDAO");
	}

	public Set<GroupRegVO> getAll() {
		return dao.getAll();
	}

	public void insert(Integer groupID, Integer teamID) {
		GroupRegVO vo = new GroupRegVO();

		GroupsVO groupsVO = new GroupsVO();
		groupsVO.setGroupID(groupID);
		vo.setGroupsVO(groupsVO);

		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setTeamID(teamID);
		vo.setTeamsVO(teamsVO);

		vo.setTeamStat(0);
		vo.setRegisterDate(new Timestamp(System.currentTimeMillis()));
		vo.setPaymentNumber(null);

		dao.insert(vo);
	}

	public void update(Integer groupID, Integer teamID, Integer teamStat, Timestamp registerDate,
			String paymentNumber) {
		GroupRegVO vo = new GroupRegVO();

		GroupsVO groupsVO = new GroupsVO();
		groupsVO.setGroupID(groupID);
		vo.setGroupsVO(groupsVO);

		TeamsVO teamsVO = new TeamsVO();
		teamsVO.setTeamID(teamID);
		vo.setTeamsVO(teamsVO);

		vo.setTeamStat(teamStat);
		vo.setRegisterDate(registerDate);
		vo.setPaymentNumber(paymentNumber);

		dao.insert(vo);
	}

	public List<GroupRegVO> findByGroupID(Integer groupID) {
		return dao.findByGroupID(groupID);
	}

	public List<GroupRegVO> findByTeamID(Integer teamID) {
		return dao.findByTeamID(teamID);
	}
}
