package eeit.games.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import eeit.locationinfo.model.LocationinfoService;
import eeit.teams.model.TeamsService;

@SuppressWarnings("unchecked")
@Transactional(readOnly = true)
public class GamesDAO_HibernateTemplate implements GamesDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM GamesVO";
	private static final String FIND_BY_GROUPID = "FROM GamesVO WHERE groupID=?";
	private static final String FIND_BY_TEAMID = "FROM GamesVO WHERE teamAID=? OR teamBID =?";

	@Override
	public Set<GamesVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_STMT);
		Set<GamesVO> set = new LinkedHashSet<GamesVO>((List<GamesVO>)obj);
		return set;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Integer insert(GamesVO gVO) {
		return (Integer) hibernateTemplate.save(gVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(GamesVO gVO) {
		hibernateTemplate.update(gVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer gameID) {
		GamesVO gamesVO = (GamesVO) hibernateTemplate.get(GamesVO.class, gameID);
		hibernateTemplate.delete(gamesVO);
	}
	
	@Override
	public GamesVO findByGameID(Integer gameID) {
		return (GamesVO) hibernateTemplate.get(GamesVO.class, gameID);
	}
	
	@Override
	public List<GamesVO> findByTeamID(Integer teamID) {
		return (List<GamesVO>) hibernateTemplate.find(FIND_BY_TEAMID, teamID,teamID);
	}
	
	@Override
	public List<GamesVO> findByGroupID(Integer groupID) {
		return (List<GamesVO>) hibernateTemplate.find(FIND_BY_GROUPID, groupID);
	}

	public static void main(String[] args) {
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		GamesDAO_interface dao = (GamesDAO_interface) context.getBean("GamesDAO");
		
//		 dao.delete(4003);


		Set<GamesVO> set = new LinkedHashSet<GamesVO>(dao.findByTeamID(3001));
		for (GamesVO gvo : set) {
			System.out.print(gvo.getGameID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupID() + ", ");
			System.out.print(gvo.getGroupsVO().getGroupName() + ", ");
			System.out.print(gvo.getLocationinfoVO().getLocationName() + ", ");
			System.out.println();
		}
		
		
		
	}





}
