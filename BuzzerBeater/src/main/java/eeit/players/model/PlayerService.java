package eeit.players.model;

import java.sql.Date;
import java.util.Set;

import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.season.model.SeasonDAO_interface;

public class PlayerService {
	private PlayerDAO_interface dao;
	
	public PlayerService(){
		dao = new PlayerDAO();
//		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
//		dao = (PlayerDAO_interface) context.getBean("PlayersDAO");
		
	}
	public PlayersVO insertPlayer(String playerName,String id,Double height,Double weights,Date birthday,String nationality,String photo){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		playerVO.setPhoto(photo);
		dao.insert(playerVO);
		return playerVO;
	}
	public PlayersVO updatePlayer(Integer playerID,String playerName,String id,Double height,Double weights,Date birthday,String nationality,String photo){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		playerVO.setPhoto(photo);
		dao.update(playerVO);
		return playerVO;
	}
	
	public void deletePlayer(Integer playerID){
		
		dao.delete(playerID);
		
	}
	
	
	 public Set<PlayersVO> getOnePlayerName(String playerName){
		
	
		
		return dao.findByPlayerName(playerName);
		
	}
	 public PlayersVO getOnePlayerID(Integer playerID){
			
			
			
			return dao.findByID(playerID);
			
		}
	 
	 public Set<PlayersVO> getAllPlayer(){
			return dao.getAll();
		}

}
