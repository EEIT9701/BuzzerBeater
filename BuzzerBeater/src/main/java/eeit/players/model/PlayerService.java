package eeit.players.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

public class PlayerService {
	private PlayerDAO_interface dao;
	
	public PlayerService(){
		dao = new PlayerDAO();
	}
	public PlayerVO addPlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality){
		PlayerVO playerVO = new PlayerVO();
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
	public PlayerVO updatePlayer(Integer playerID,String playerName,String id,Integer height,Integer weights,Date birthday,String nationality){
		PlayerVO playerVO = new PlayerVO();
		playerVO.setPlayerID(playerID);
		playerVO.setPlayerName(playerName);
		playerVO.setId(id);
		playerVO.setHeight(height);
		playerVO.setWeights(weights);
		playerVO.setBirthday(birthday);
		playerVO.setNationality(nationality);
		dao.update(playerVO);
		return playerVO;
	}
	
	public void deletePlayer(Integer playerID){
		
		dao.delete(playerID);
		
	}
	
	
	 public Set<PlayerVO> getOnePlayer(String playerName){
		
	
		
		return dao.findByPlayerName(playerName);
		
	}
	 
	 public Set<PlayerVO> getAllPlayer(){
			return dao.getAll();
		}
}
