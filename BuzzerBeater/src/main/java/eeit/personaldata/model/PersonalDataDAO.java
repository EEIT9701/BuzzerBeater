package eeit.personaldata.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import eeit.games.model.GamesVO;
import eeit.players.model.PlayersVO;
import eeit.teams.model.TeamsVO;

public class PersonalDataDAO implements PersonalDataDAO_interface {
    private static DataSource ds=null;
	static{
		try {
			Context ctx=new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	//private static final String GETALL="SELECT playerID,gameID,teamID,quarters,quarterTime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,startingPlayer from personaldata order by playerID";
	//private static final String GETALL="SELECT ROW_NUMBER() OVER(ORDER BY points DESC) AS ranking,* FROM personaldata";
	//private static final String GETALL="SELECT * from personaldata order by points";
	private static final String GETALL="select t.teamID,p.playerName,p.playerID,p.photo,t.teamName,gameID,gametime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
	  		"from   (select playerID,teamID,\r\n" + 
	  		"        count(gameID)as gameID,\r\n" + 
	  		"        sum(gameTime)as gametime,\r\n" + 
	  		"        sum(twoPoint)as twoPoint,\r\n" + 
	  		"        sum(twoPointShot)as twoPointShot,\r\n" + 
	  		"        sum(threePoint)as threePoint,\r\n" + 
	  		"        sum(threePointShot)as threePointShot,\r\n" + 
	  		"        sum(fg)as fg,\r\n" + 
	  		"        sum(fgShot)as fgShot,\r\n" + 
	  		"        sum(offReb)as offReb,\r\n" + 
	  		"        sum(defReb)as defReb,\r\n" + 
	  		"        sum(assist)as assist,\r\n" + 
	  		"        sum(steal)as steal,\r\n" + 
	  		"        sum(blocks)as blocks,\r\n" + 
	  		"        sum(turnover)as turnover,\r\n" + 
	  		"        sum(personalFouls)as personalFouls,\r\n" + 
	  		"        sum(points)as points\r\n" + 
	  		"        from PersonalData\r\n" + 
	  		"        GROUP BY playerID,teamID)\r\n" + 
	  		"pd join teams t\r\n" + 
	  		"on pd.teamId=t.teamID\r\n" + 
	  		"join players p\r\n" + 
	  		"on pd.playerID=p.playerID" 
	  		;
	private static final String GETALL2="select t.teamID,t.teamBadge,t.teamName,gameID,gametime,twopoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
			"from   (select teamID,\r\n" + 
			"        count(gameID)as gameID,\r\n" + 
			"        sum(gameTime)as gametime,\r\n" + 
			"        sum(twoPoint)as twopoint,\r\n" + 
			"        sum(twoPointShot)as twoPointShot,\r\n" + 
			"        sum(threePoint)as threePoint,\r\n" + 
			"        sum(threePointShot)as threePointShot,\r\n" + 
			"        sum(fg)as fg,\r\n" + 
			"        sum(fgShot)as fgShot,\r\n" + 
			"        sum(offReb)as offReb,\r\n" + 
			"        sum(defReb)as defReb,\r\n" + 
			"        sum(assist)as assist,\r\n" + 
			"        sum(steal)as steal,\r\n" + 
			"        sum(blocks)as blocks,\r\n" + 
			"        sum(turnover)as turnover,\r\n" + 
			"        sum(personalFouls)as personalFouls,\r\n" + 
			"        sum(points)as points\r\n" + 
			"        from PersonalData\r\n" + 
			"        GROUP BY teamID)\r\n" + 
			"pd join teams t\r\n" + 
			"on pd.teamId=t.teamID";
	
	private static final String GETALL3="SELECT * FROM PersonalData";
	
	private static final String GETALL4="select gameID,p.playerID,t.teamid,p.playerName,t.teamName,gametime,twopoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
			"from   (select playerID,teamID,\r\n" + 
			"        count(gameID)as gameID,\r\n" + 
			"        sum(gameTime)as gametime,\r\n" + 
			"        sum(twoPoint)as twopoint,\r\n" + 
			"        sum(twoPointShot)as twoPointShot,\r\n" + 
			"        sum(threePoint)as threePoint,\r\n" + 
			"        sum(threePointShot)as threePointShot,\r\n" + 
			"        sum(fg)as fg,\r\n" + 
			"        sum(fgShot)as fgShot,\r\n" + 
			"        sum(offReb)as offReb,\r\n" + 
			"        sum(defReb)as defReb,\r\n" + 
			"        sum(assist)as assist,\r\n" + 
			"        sum(steal)as steal,\r\n" + 
			"        sum(blocks)as blocks,\r\n" + 
			"        sum(turnover)as turnover,\r\n" + 
			"        sum(personalFouls)as personalFouls,\r\n" + 
			"        sum(points)as points\r\n" + 
			"        from PersonalData\r\n" + 
			"        GROUP BY playerID,teamID)\r\n" + 
			"pd join teams t\r\n" + 
			"on pd.teamid=t.teamID\r\n" + 
			"join players p\r\n" + 
			"on pd.playerID=p.playerID\r\n" + 
			"\r\n" + 
			"WHERE p.playerID=?"
	  		;
	
	@Override
	public List<PersonalDataVO> getAll() {
        List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalData=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	con=ds.getConnection();
        	pstmt=con.prepareStatement(GETALL);
        	rs=pstmt.executeQuery();
			while (rs.next()){
				personalData=new PersonalDataVO();
				PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerName(rs.getString("playerName"));
				playersVO.setPlayerID(rs.getInt("playerID"));
				playersVO.setPhoto(rs.getString("photo"));
				personalData.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
		   //   gamesVO.setGameID(rs.getInt("gameID"));			
				personalData.setGamesVO(gamesVO);
				
	            TeamsVO teamsVO =new TeamsVO();
	          
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));
	            personalData.setTeamsVO(teamsVO);
				
		     	personalData.setGameID(rs.getInt("gameID"));
				personalData.setGameTime(rs.getInt("gameTime"));
				personalData.setTwoPoint(rs.getInt("twoPoint"));
				personalData.setTwoPointShot(rs.getInt("twoPointShot"));
				personalData.setThreePoint(rs.getInt("threePoint"));
				personalData.setThreePointShot(rs.getInt("threePointShot"));
				personalData.setFg(rs.getInt("fg"));
				personalData.setFgShot(rs.getInt("fgShot"));
				personalData.setDefReb(rs.getInt("defReb"));
				personalData.setOffReb(rs.getInt("offReb"));
				personalData.setAssist(rs.getInt("assist"));
				personalData.setSteal(rs.getInt("steal"));
				personalData.setBlocks(rs.getInt("blocks"));
				personalData.setTurnover(rs.getInt("turnover"));
				personalData.setPersonalFouls(rs.getInt("personalFouls"));
				personalData.setPoints(rs.getInt("points"));
		//		personalDataVO.setStartingPlayer(rs.getInt("startingPlayer"));
				list.add(personalData);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PersonalDataVO> getAll1() {
        List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalData=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	con=ds.getConnection();
        	pstmt=con.prepareStatement(GETALL2);
        	rs=pstmt.executeQuery();
			while (rs.next()){
				personalData=new PersonalDataVO();
			//	PlayersVO playersVO = new PlayersVO();
			//	playersVO.setPlayerName(rs.getString("playerName"));
			//	playersVO.setPhoto(rs.getString("photo"));
			//	personalData.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
		   //   gamesVO.setGameID(rs.getInt("gameID"));			
				personalData.setGamesVO(gamesVO);
				
	            TeamsVO teamsVO =new TeamsVO();
	            teamsVO.setTeamBadge(rs.getString("teamBadge"));
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));;
	            personalData.setTeamsVO(teamsVO);
				
		     	personalData.setGameID(rs.getInt("gameID"));
				personalData.setGameTime(rs.getInt("gameTime"));
				personalData.setTwoPoint(rs.getInt("twoPoint"));
				personalData.setTwoPointShot(rs.getInt("twoPointShot"));
				personalData.setThreePoint(rs.getInt("threePoint"));
				personalData.setThreePointShot(rs.getInt("threePointShot"));
				personalData.setFg(rs.getInt("fg"));
				personalData.setFgShot(rs.getInt("fgShot"));
				personalData.setDefReb(rs.getInt("defReb"));
				personalData.setOffReb(rs.getInt("offReb"));
				personalData.setAssist(rs.getInt("assist"));
				personalData.setSteal(rs.getInt("steal"));
				personalData.setBlocks(rs.getInt("blocks"));
				personalData.setTurnover(rs.getInt("turnover"));
				personalData.setPersonalFouls(rs.getInt("personalFouls"));
				personalData.setPoints(rs.getInt("points"));
		//		personalDataVO.setStartingPlayer(rs.getInt("startingPlayer"));
				list.add(personalData);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PersonalDataVO> getAll2() {
		List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalData=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	con=ds.getConnection();
        	pstmt=con.prepareStatement(GETALL3);
        	rs=pstmt.executeQuery();
			while (rs.next()){
				personalData=new PersonalDataVO();
/*				PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerName(rs.getString("playerName"));
				playersVO.setPlayerID(rs.getInt("playerID"));
				playersVO.setPhoto(rs.getString("photo"));
				personalData.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
		   //   gamesVO.setGameID(rs.getInt("gameID"));			
				personalData.setGamesVO(gamesVO);
				
	            TeamsVO teamsVO =new TeamsVO();
	          
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));
	            personalData.setTeamsVO(teamsVO);*/
	            
	            personalData.setPlayerID(rs.getInt("playerID"));
		     	personalData.setGameID(rs.getInt("gameID"));
		        personalData.setTeamID(rs.getInt("teamID"));
				personalData.setGameTime(rs.getInt("gameTime"));
				personalData.setTwoPoint(rs.getInt("twoPoint"));
				personalData.setTwoPointShot(rs.getInt("twoPointShot"));
				personalData.setThreePoint(rs.getInt("threePoint"));
				personalData.setThreePointShot(rs.getInt("threePointShot"));
				personalData.setFg(rs.getInt("fg"));
				personalData.setFgShot(rs.getInt("fgShot"));
				personalData.setOffReb(rs.getInt("offReb"));
				personalData.setDefReb(rs.getInt("defReb"));
				personalData.setAssist(rs.getInt("assist"));
				personalData.setSteal(rs.getInt("steal"));
				personalData.setBlocks(rs.getInt("blocks"));
				personalData.setTurnover(rs.getInt("turnover"));
				personalData.setPersonalFouls(rs.getInt("personalFouls"));
				personalData.setPoints(rs.getInt("points"));
				personalData.setStartingPlayer(rs.getInt("startingPlayer"));
				list.add(personalData);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PersonalDataVO> findByGameID(Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByGameIDAndTeamID(Integer GameID, Integer TeamID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlayerID(Integer playerID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByPlyerID2(Integer playerID) {
		List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalData=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	con=ds.getConnection();
        	pstmt=con.prepareStatement(GETALL4);
        	pstmt.setInt(1, playerID);
        	rs=pstmt.executeQuery();
			while (rs.next()){
				personalData=new PersonalDataVO();
				PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerID(rs.getInt("playerID"));
				playersVO.setPlayerName(rs.getString("playerName"));
			//	playersVO.setPhoto(rs.getString("photo"));
				personalData.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
		        gamesVO.setGameID(rs.getInt("gameID"));			
				personalData.setGamesVO(gamesVO);
				
	            TeamsVO teamsVO =new TeamsVO();
	          
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));
	            personalData.setTeamsVO(teamsVO);
				
		     //	personalData.setGameID(rs.getInt("gameID"));
				personalData.setGameTime(rs.getInt("gameTime"));
				personalData.setTwoPoint(rs.getInt("twoPoint"));
				personalData.setTwoPointShot(rs.getInt("twoPointShot"));
				personalData.setThreePoint(rs.getInt("threePoint"));
				personalData.setThreePointShot(rs.getInt("threePointShot"));
				personalData.setFg(rs.getInt("fg"));
				personalData.setFgShot(rs.getInt("fgShot"));
				personalData.setDefReb(rs.getInt("defReb"));
				personalData.setOffReb(rs.getInt("offReb"));
				personalData.setAssist(rs.getInt("assist"));
				personalData.setSteal(rs.getInt("steal"));
				personalData.setBlocks(rs.getInt("blocks"));
				personalData.setTurnover(rs.getInt("turnover"));
				personalData.setPersonalFouls(rs.getInt("personalFouls"));
				personalData.setPoints(rs.getInt("points"));
		//		personalDataVO.setStartingPlayer(rs.getInt("startingPlayer"));
				list.add(personalData);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PersonalDataVO> findByPlayerIDAndGameID(Integer PlayerID, Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
}
