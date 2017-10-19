package eeit.players.model;

<<<<<<< HEAD
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

public class PlayerService {
	private PlayerDAO_interface dao;
	
	public PlayerService(){
		dao = new PlayerDAO();
	}
	public PlayersVO addPlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		dao.insert(playerVO);
		return playerVO;
	}
	public PlayersVO updatePlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
=======
import java.io.InputStream;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import org.hibernate.engine.jdbc.BinaryStream;

public class PlayerService {
	private PlayerDAO_interface dao;
	
	public PlayerService(){
		dao = new PlayerDAO();
	}
	public PlayersVO addPlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		dao.insert(playerVO);
		return playerVO;
	}
	public PlayersVO updatePlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality,byte[] photo){
		PlayersVO playerVO = new PlayersVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		playerVO.setPhoto(photo);
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
		dao.update(playerVO);
		return playerVO;
	}
	
	public void deletePlayer(Integer playerID){
		
		dao.delete(playerID);
		
	}
	
	
	 public Set<PlayersVO> getOnePlayer(String playerName){
		
	
		
		return dao.findByPlayerName(playerName);
		
	}
	 
	 public Set<PlayersVO> getAllPlayer(){
			return dao.getAll();
		}
}
