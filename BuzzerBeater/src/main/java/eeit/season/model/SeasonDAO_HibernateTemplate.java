package eeit.season.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsVO;
import eeit.locationinfo.model.LocationinfoVO;
import eeit.teams.model.TeamsVO;

@Transactional(readOnly = true)
public class SeasonDAO_HibernateTemplate implements SeasonDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_SEASON = "FROM SeasonVO ORDER BY SeasonBeginDate DESC";
	private static final String FIND_LATEST_SEASON = "SELECT MAX(seasonID) FROM SeasonVO";

	@Override
	public SeasonVO findBySeasonID(Integer seasonID) {
		return (SeasonVO) hibernateTemplate.get(SeasonVO.class, seasonID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Integer insert(SeasonVO seasonVO) {
		return (Integer) hibernateTemplate.save(seasonVO); // 此方法會回傳新增該筆資料的ID
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
	public Set<SeasonVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_SEASON);
		return new LinkedHashSet<SeasonVO>((List<SeasonVO>) obj);
	}

	@Override
	public Integer getLatestID() {
		return (Integer) hibernateTemplate.find(FIND_LATEST_SEASON).get(0);
	}

	public static void main(String args[]) {

		@SuppressWarnings("resource")
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

		SeasonVO seasonVO = new SeasonVO();
		GroupsVO groupsVO = new GroupsVO();

		seasonVO.setSeasonName("超級盃");

		groupsVO.setGroupName("123");
		groupsVO.setSeasonVO(seasonVO);// 將seasonVO關聯到groupsVO
		seasonVO.getGroupsSet().add(groupsVO);// 將該筆groupsVO加進seasonVO

		for (int i = 0; i < 5; i++) {
			GamesVO gamesVO = new GamesVO();

			TeamsVO teamAVO = new TeamsVO();
			teamAVO.setTeamID(3001);
			gamesVO.setTeamAVO(teamAVO);

			TeamsVO teamBVO = new TeamsVO();
			teamBVO.setTeamID(3002);
			gamesVO.setTeamBVO(teamBVO);

			LocationinfoVO locVO = new LocationinfoVO();
			locVO.setLocationID(101);
			gamesVO.setLocationinfoVO(locVO);

			gamesVO.setGroupsVO(groupsVO);
			groupsVO.getGamesSet().add(gamesVO);
		}
		// for (int i = 0; i < 5; i++) {
		// gamesVO.setGroupsVO(groupsVO);
		// groupsVO.getGamesSet().add(gamesVO);
		//
		// PersonalDataVO pvo = new PersonalDataVO();
		// TeamsVO teamsVO = new TeamsVO();
		// teamsVO.setTeamID(3001);
		// pvo.setTeamsVO(teamsVO);
		// PlayersVO playersVO = new PlayersVO();
		// playersVO.setPlayerID(70003+i);
		// pvo.setPlayersVO(playersVO);
		//
		// pvo.setGamesVO(gamesVO);
		// gamesVO.getPersonalDataSet().add(pvo);
		// }
		Integer seasonVO3 = dao.insert(seasonVO); // 結論:要互相包含

		System.out.println(seasonVO3);

		/****************** update ******************/

		// SeasonVO sVO2 = new SeasonVO();
		// sVO2.setSeasonID(1003);
		// sVO2.setSeasonName("已修改");
		// sVO2.setDescriptions("已修改");
		// dao.update(sVO2);

		/****************** delete ******************/

		// dao.delete(1002);

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
