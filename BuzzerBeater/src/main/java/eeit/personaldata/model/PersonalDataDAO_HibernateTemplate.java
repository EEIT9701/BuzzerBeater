package eeit.personaldata.model;

import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class PersonalDataDAO_HibernateTemplate implements PersonalDataDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM PersonalDataVO";
	private static final String FIND_BY_GAMEID = "FROM PersonalDataVO WHERE GameID=?";
	private static final String FIND_BY_PLAYERID = "FROM PersonalDataVO WHERE PlayerID=?";
	private static final String FIND_BY_GAMEID_AND_TEAMID = "FROM PersonalDataVO WHERE GameID=? AND TeamID=?";
	

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> findByGameIDAndTeamID(Integer GameID, Integer TeamID) {
		return (List<PersonalDataVO>) hibernateTemplate.find(FIND_BY_GAMEID_AND_TEAMID, GameID, TeamID);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> findByGameID(Integer GameID) {
		return (List<PersonalDataVO>) hibernateTemplate.find(FIND_BY_GAMEID, GameID);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> findByPlayerID(Integer playerID) {
		return (List<PersonalDataVO>) hibernateTemplate.find(FIND_BY_PLAYERID, playerID);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_STMT);
		return (List<PersonalDataVO>) obj;
	}

	@Override
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		return (PersonalDataVO) hibernateTemplate.get(PersonalDataVO.class, PersonalDataID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(PersonalDataVO personalDataVO) {
		hibernateTemplate.save(personalDataVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(PersonalDataVO personalDataVO) {
		hibernateTemplate.update(personalDataVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer PersonalDataID) {
		PersonalDataVO personalDataVO = (PersonalDataVO) hibernateTemplate.get(PersonalDataVO.class, PersonalDataID);
		hibernateTemplate.delete(personalDataVO);

	}

	public static void main(String args[]) {

		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		PersonalDataDAO_interface dao = (PersonalDataDAO_interface) context.getBean("PersonalDataDAO");

		// List<PersonalDataVO> set = dao.getAll();
		// for (PersonalDataVO vo : set) {
		// System.out.print(vo.getPlayersVO().getPlayerID() + ", ");
		// System.out.print(vo.getGamesVO().getGameID() + ", ");
		// System.out.print(vo.getTeamsVO().getTeamName() + ", ");
		// System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
		// System.out.println();
		// }

		List<PersonalDataVO> list = dao.findByPlayerID(70002);
		for (PersonalDataVO vo : list) {
			System.out.print(vo.getPlayersVO().getPlayerID() + ", ");
			System.out.print(vo.getGameTime() + ", ");
			System.out.print(vo.getTeamsVO().getTeamID()+ ", ");
			System.out.print(vo.getTeamsVO().getTeamName() + ", ");
			System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
			System.out.print(vo.getFg() + ", ");
			System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
			System.out.print(vo.getTeamsVO().getTeamName() + ", ");

			System.out.println();
		}
	}

	@Override
	public List<PersonalDataVO> getAll1() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> getAll2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlyerID2(Integer playerID) {
		// TODO Auto-generated method stub
		return null;
	}

}
