package eeit.gamemedia.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.games.model.GamesVO;


public class GameMediaService {
	private GameMediaDAO_Interface dao;
	
	public GameMediaService(){
//		dao = new GameMediaDAO_JNDI();
    	ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
    	dao = (GameMediaDAO_Interface) context.getBean("GameMediaDAO");
	}
	public GameMediaVO insertGameMedia(Integer gameID,String mediasName,String gameVideo,String gamePhoto,String mediaType,Timestamp mediaDate,String descriptions,String tag ){
		
		GameMediaVO gameMediaVO = new GameMediaVO();
		GamesVO gamesVO = new GamesVO();
				
		gamesVO.setGameID(gameID);
		gameMediaVO.setMediasName(mediasName);
		gameMediaVO.setGameVideo(gameVideo);
		gameMediaVO.setGamePhoto(gamePhoto);
		gameMediaVO.setMediaType(mediaType);
		gameMediaVO.setMediaDate(mediaDate);
		gameMediaVO.setDescriptions(descriptions);
		gameMediaVO.setTag(tag);
		
		dao.insert(gameMediaVO);
		return gameMediaVO;
	}
	
	public GameMediaVO updateGameMedia(Integer gameID,Integer mediaID,String mediasName,String gameVideo,String gamePhoto,String mediaType,Timestamp mediaDate,String descriptions,String tag){
		GameMediaVO gameMediaVO = new GameMediaVO();
		GamesVO gamesVO = new GamesVO();
		
		gamesVO.setGameID(gameID);
		gameMediaVO.setMediasName(mediasName);
		gameMediaVO.setGameVideo(gameVideo);
		gameMediaVO.setGamePhoto(gamePhoto);
		gameMediaVO.setMediaType(mediaType);
		gameMediaVO.setMediaDate(mediaDate);
		gameMediaVO.setDescriptions(descriptions);
		gameMediaVO.setTag(tag);
		gameMediaVO.setMediaID(mediaID);
		
		dao.update(gameMediaVO);
		return gameMediaVO;	
	}
	
	public void deleteGameMedia(Integer mediaID){
		dao.delete(mediaID);
	}
	public GameMediaVO getOneGameMedia(Integer mediaID) {
		return dao.findByPrimaryKey(mediaID);
	}

	public List<GameMediaVO> getAll() {
		return dao.getAll();
	}
	
}
