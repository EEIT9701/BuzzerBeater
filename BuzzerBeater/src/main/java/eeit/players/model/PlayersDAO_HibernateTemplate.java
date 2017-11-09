package eeit.players.model;

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
public class PlayersDAO_HibernateTemplate implements PlayerDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM PlayersVO ORDER BY playerID";
	private static final String FIND_BY_PLAYERNAME = "FROM PlayersVO WHERE playerName=?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(PlayersVO playerVO) {
		hibernateTemplate.save(playerVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(PlayersVO playerVO) {
		hibernateTemplate.update(playerVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer playerID) {
		PlayersVO playersVO = (PlayersVO) hibernateTemplate.get(PlayersVO.class, playerID);
		hibernateTemplate.delete(playersVO);
	}

	@Override
	public Set<PlayersVO> findByPlayerName(String playerName) {
		List<PlayersVO> list = (List<PlayersVO>) hibernateTemplate.find(FIND_BY_PLAYERNAME, playerName);
		return new LinkedHashSet<PlayersVO>(list);
	}

	@Override
	public Set<PlayersVO> getAll() {
		List<PlayersVO> list = (List<PlayersVO>) hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<PlayersVO>(list);
	}
	
	@Override
	public PlayersVO findByID(Integer playerID) {
		return (PlayersVO) hibernateTemplate.get(PlayersVO.class, playerID);
	}

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		PlayerDAO_interface dao = (PlayerDAO_interface) context.getBean("PlayersDAO");

//		Set<PlayersVO> set = dao.getAll();
//		for (PlayersVO vo : set) {
//			System.out.print(vo.getPlayerName() + ", ");
//			System.out.print(vo.getHeight() + ", ");
//			System.out.print(vo.getPhoto() + ", ");
//			System.out.println();
//		}
		
		PlayersVO vo = dao.findByID(70001);
		System.out.println(vo.getPhoto());

	}

	@Override
	public Integer findMaxID() {
		// TODO Auto-generated method stub
		return null;
	}

}
