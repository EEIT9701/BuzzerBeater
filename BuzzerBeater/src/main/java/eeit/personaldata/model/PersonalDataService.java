package eeit.personaldata.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.memberinfo.model.MemberInfoDAO;

public class PersonalDataService {
	private PersonalDataDAO_interface dao;
	private PersonalDataDAO_interface jndi;
	private PersonalDataDAO_interface jdbc;

	public PersonalDataService() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (PersonalDataDAO_interface) context.getBean("PersonalDataDAO");
		jndi = new PersonalDataDAO();
		jdbc = new PersonalDataJDBCDAO();
	}
	
	// 給個人數據的查詢
	public List<PersonalDataVO> getAll() {
		return jndi.getAll();
	}

	// 給team的查詢
	public List<PersonalDataVO> getAll1() {
		return jndi.getAll1();
	}

	// 給後台使用PersonalData的新刪修
	public List<PersonalDataVO> getAll2() {
		return jndi.getAll2();
	}
	// 給下拉的賽季用
	public List<PersonalDataVO> FindBySeasonID(Integer seasonID) {
		return jdbc.findBySeasonID(seasonID);
	}
	
	// 給下拉的分組用
	public List<PersonalDataVO> findByGroupID(Integer groupID) {
		return jdbc.findByGroupID(groupID);
	}
	
	public void insert(PersonalDataVO personalDataVO){
		dao = new PersonalDataJNDIDAO();
		dao.insert(personalDataVO);
	}
	
	public void update(PersonalDataVO personalDataVO){
		dao = new PersonalDataJNDIDAO();
		dao.update(personalDataVO);
	}
	
	public void delete(PersonalDataVO personalDataVO){
		dao = new PersonalDataJNDIDAO();
		dao.delete(personalDataVO);
	}
	
	public List<PersonalDataVO> findByPlyerID2(Integer playerID){
		dao = new PersonalDataDAO();
		return dao.findByPlyerID2(playerID);
	}
	
	public List<PersonalDataVO> getHibernateALL(){
		return dao.getAll();
	}
	
	public List<PersonalDataVO> findByGameID(Integer GameID) {
		return dao.findByGameID(GameID);
	}

	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		return dao.findByPersonalDataID(PersonalDataID);
	}

	public List<PersonalDataVO> findByGameIDAndTeamID(Integer GameID, Integer TeamID) {
		return dao.findByGameIDAndTeamID(GameID, TeamID);
	}
	
	public List<PersonalDataVO> findByPlayerIDAndGameID(Integer PlayerID, Integer GameID){
		return dao.findByPlayerIDAndGameID(PlayerID, GameID);
	}
	
	public List<PersonalDataVO> findByPlayerID(Integer PlayerID) {
		return dao.findByPlayerID(PlayerID);
	}
	
	public List<PersonalDataVO> findByTeamID(Integer TeamID) {
		dao = new PersonalDataDAO();
		return dao.findByTeamID(TeamID);
	}
	
}
