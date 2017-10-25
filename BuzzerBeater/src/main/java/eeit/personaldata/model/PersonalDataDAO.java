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
	private static final String GETALL="select p.playerName,p.photo,t.teamName,gameID,gametime,twopoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
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
	  		"on pd.playerID=p.playerID";
	
	
	@Override
	public List<PersonalDataVO> getAll() {
        List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalDataVO=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	con=ds.getConnection();
        	pstmt=con.prepareStatement(GETALL);
        	rs=pstmt.executeQuery();
			while (rs.next()){
				personalDataVO=new PersonalDataVO();
				PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerName(rs.getString("playerName"));
				playersVO.setPhoto(rs.getString("photo"));
				personalDataVO.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
		   //   gamesVO.setGameID(rs.getInt("gameID"));			
				personalDataVO.setGamesVO(gamesVO);
				
	            TeamsVO teamsVO =new TeamsVO();
	            teamsVO.setTeamName(rs.getString("teamName"));
	            personalDataVO.setTeamsVO(teamsVO);
				
		     	personalDataVO.setGameID(rs.getInt("gameID"));
				personalDataVO.setGameTime(rs.getInt("gameTime"));
				personalDataVO.setTwoPoint(rs.getInt("twoPoint"));
				personalDataVO.setTwoPointShot(rs.getInt("twoPoint"));
				personalDataVO.setThreePoint(rs.getInt("threePoint"));
				personalDataVO.setThreePointShot(rs.getInt("threePointShot"));
				personalDataVO.setFg(rs.getInt("fg"));
				personalDataVO.setFgShot(rs.getInt("fgShot"));
				personalDataVO.setDefReb(rs.getInt("defReb"));
				personalDataVO.setOffReb(rs.getInt("offReb"));
				personalDataVO.setAssist(rs.getInt("assist"));
				personalDataVO.setSteal(rs.getInt("steal"));
				personalDataVO.setBlocks(rs.getInt("blocks"));
				personalDataVO.setTurnover(rs.getInt("turnover"));
				personalDataVO.setPersonalFouls(rs.getInt("personalFouls"));
				personalDataVO.setPoints(rs.getInt("points"));
		//		personalDataVO.setStartingPlayer(rs.getInt("startingPlayer"));
				list.add(personalDataVO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 
		return list;
	}

	
}
