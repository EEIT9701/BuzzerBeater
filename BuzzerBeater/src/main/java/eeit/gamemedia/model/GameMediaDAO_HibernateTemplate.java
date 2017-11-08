package eeit.gamemedia.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class GameMediaDAO_HibernateTemplate implements GameMediaDAO_Interface {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM GameMediaVO ORDER BY mediaID";
	private static final String GET_ALL_VIDEO_STMT = "FROM GameMediaVO WHERE MediaType = 'video'";;
	private static final String QUERY_FOR_TAG = "FROM GameMediaVO WHERE tag like ?";
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Integer insert(GameMediaVO gameMediaVO) {
		return (Integer) hibernateTemplate.save(gameMediaVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(GameMediaVO gameMediaVO) {
		hibernateTemplate.update(gameMediaVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer mediaID) {
		GameMediaVO gameMediaVO = new GameMediaVO();
		gameMediaVO.setMediaID(mediaID);
		hibernateTemplate.delete(gameMediaVO);
	}

	@Override
	public GameMediaVO findByPrimaryKey(Integer gameMediaID) {
		GameMediaVO gameMediaVO = (GameMediaVO) hibernateTemplate.get(GameMediaVO.class, gameMediaID);
		return gameMediaVO;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GameMediaVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_STMT);
		List<GameMediaVO> list = (List<GameMediaVO>) obj;
		return list;
	}

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		GameMediaDAO_Interface dao = (GameMediaDAO_Interface) context.getBean("GameMediaDAO");

		// dao.delete(6001);
		
//		GameMediaVO gameMediaVO = new GameMediaVO();
//		GamesVO gamesVO = new GamesVO();
//		gamesVO.setGameID(4004);
//		gameMediaVO.setGamesVO(gamesVO);
//		gameMediaVO.setMediasName("GGG");
//		dao.insert(gameMediaVO);
		
		
		List<GameMediaVO> set = dao.getAllVideo();
		
		for (GameMediaVO vo : set) {
			System.out.print(vo.getMediaID() + " ");
			System.out.print(vo.getGamesVO().getGameID() + " ");
			System.out.print(vo.getMediasName() + " ");
			System.out.print(vo.getMediaDate() + " ");
			System.out.println();
		}
		
		

	}

	@Override
	public List<GameMediaVO> getAllVideo() {
		Object obj = hibernateTemplate.find(GET_ALL_VIDEO_STMT);
		List<GameMediaVO> list = (List<GameMediaVO>) obj;
		return list;
	}

	@Override
	public List<GameMediaVO> tagFunction(String tag) {
		Object obj = hibernateTemplate.find(QUERY_FOR_TAG);
		List<GameMediaVO> list = (List<GameMediaVO>) obj;
		return null;
	}

}
