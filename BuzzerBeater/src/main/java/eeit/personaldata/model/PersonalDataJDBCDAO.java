package eeit.personaldata.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsVO;
import eeit.players.model.PlayersVO;
import eeit.season.model.SeasonVO;
import eeit.teams.model.TeamsVO;



public class PersonalDataJDBCDAO implements PersonalDataDAO_interface{
    String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	String user="sa";
	String password="P@ssw0rd";
	
	//private static final String GETAll="SELECT playerID,gameID,teamID,GameTime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,points,startingPlayer from personaldata order by playerID";
	  private static final String GETAll="select p.playerName,t.teamName,p.photo,gametime,twopoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
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
	  private static final String GETALL6="select gr.seasonID,se.seasonName,gr.groupName,pl.groupID,t.teamID,p.playerName,p.playerID,p.photo,t.teamName,t.teamBadge,gameID,gametime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
				"	  		from   (select playerID,teamID,\r\n" + 
				"	  		        count(gameID)as gameID, \r\n" + 
				"	  		        sum(gameTime)as gametime, \r\n" + 
				"	  		        sum(twoPoint)as twoPoint, \r\n" + 
				"	  		        sum(twoPointShot)as twoPointShot,\r\n" + 
				"	  		        sum(threePoint)as threePoint, \r\n" + 
				"	  		        sum(threePointShot)as threePointShot, \r\n" + 
				"	  		        sum(fg)as fg, \r\n" + 
				"	  		        sum(fgShot)as fgShot, \r\n" + 
				"	  		        sum(offReb)as offReb, \r\n" + 
				"	  		        sum(defReb)as defReb, \r\n" + 
				"	  		        sum(assist)as assist, \r\n" + 
				"	  		        sum(steal)as steal, \r\n" + 
				"	  		        sum(blocks)as blocks, \r\n" + 
				"	  		        sum(turnover)as turnover, \r\n" + 
				"	  		        sum(personalFouls)as personalFouls, \r\n" + 
				"	  		        sum(points)as points \r\n" + 
				"	  		        from PersonalData \r\n" + 
				"	  		        GROUP BY playerID,teamID) \r\n" + 
				"	  		pd join teams t \r\n" + 
				"	  		on pd.teamId=t.teamID \r\n" + 
				"	  		join players p \r\n" + 
				"	  		on pd.playerID=p.playerID\r\n" + 
				"			join PlayerGroups pl\r\n" + 
				"			on pd.playerID=pl.playerID\r\n" + 
				"			join Groups gr\r\n" + 
				"			on pl.groupID=gr.groupID\r\n" + 
				"			join Season se\r\n" + 
				"			on gr.seasonID=se.seasonID\r\n" + 
				"			where gr.seasonID=?";
	  private static final String GETALL7="select gr.seasonID,se.seasonName,gr.groupName,pl.groupID,t.teamID,p.playerName,p.playerID,p.photo,t.teamName,t.teamBadge,gameID,gametime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
				"	  		from   (select playerID,teamID,\r\n" + 
				"	  		        count(gameID)as gameID, \r\n" + 
				"	  		        sum(gameTime)as gametime, \r\n" + 
				"	  		        sum(twoPoint)as twoPoint, \r\n" + 
				"	  		        sum(twoPointShot)as twoPointShot,\r\n" + 
				"	  		        sum(threePoint)as threePoint, \r\n" + 
				"	  		        sum(threePointShot)as threePointShot, \r\n" + 
				"	  		        sum(fg)as fg, \r\n" + 
				"	  		        sum(fgShot)as fgShot, \r\n" + 
				"	  		        sum(offReb)as offReb, \r\n" + 
				"	  		        sum(defReb)as defReb, \r\n" + 
				"	  		        sum(assist)as assist, \r\n" + 
				"	  		        sum(steal)as steal, \r\n" + 
				"	  		        sum(blocks)as blocks, \r\n" + 
				"	  		        sum(turnover)as turnover, \r\n" + 
				"	  		        sum(personalFouls)as personalFouls, \r\n" + 
				"	  		        sum(points)as points \r\n" + 
				"	  		        from PersonalData \r\n" + 
				"	  		        GROUP BY playerID,teamID) \r\n" + 
				"	  		pd join teams t \r\n" + 
				"	  		on pd.teamId=t.teamID \r\n" + 
				"	  		join players p \r\n" + 
				"	  		on pd.playerID=p.playerID\r\n" + 
				"			join PlayerGroups pl\r\n" + 
				"			on pd.playerID=pl.playerID\r\n" + 
				"			join Groups gr\r\n" + 
				"			on pl.groupID=gr.groupID\r\n" + 
				"			join Season se\r\n" + 
				"			on gr.seasonID=se.seasonID\r\n" + 
				"			where pl.groupID=?";
	  
	  private static final String FIND_BY_SEASONID = "select t.teamID,p.playerName,p.playerID,p.photo,t.teamName,gamecount,gametime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
	  		"				  		from   (select playerID,teamID,\r\n" + 
	  		"				  		        count(PersonalData.gameID)as gamecount,\r\n" + 
	  		"				  		        sum(gameTime)as gametime, \r\n" + 
	  		"				  		        sum(twoPoint)as twoPoint, \r\n" + 
	  		"				  		        sum(twoPointShot)as twoPointShot, \r\n" + 
	  		"				  		        sum(threePoint)as threePoint, \r\n" + 
	  		"				  		        sum(threePointShot)as threePointShot, \r\n" + 
	  		"				  		        sum(fg)as fg,\r\n" + 
	  		"				  		        sum(fgShot)as fgShot, \r\n" + 
	  		"				  		        sum(offReb)as offReb,\r\n" + 
	  		"				  		        sum(defReb)as defReb, \r\n" + 
	  		"				  		        sum(assist)as assist, \r\n" + 
	  		"				  		        sum(steal)as steal, \r\n" + 
	  		"				  		        sum(blocks)as blocks,\r\n" + 
	  		"				  		        sum(turnover)as turnover,\r\n" + 
	  		"				  		        sum(personalFouls)as personalFouls,\r\n" + 
	  		"				  		        sum(points)as points \r\n" + 
	  		"				  		        from PersonalData \r\n" + 
	  		"								join games\r\n" + 
	  		"								on games.gameID = PersonalData.gameID\r\n" + 
	  		"								join groups\r\n" + 
	  		"								on games.groupID = Groups.groupID\r\n" + 
	  		"								join season\r\n" + 
	  		"								on groups.seasonID = season.seasonID\r\n" + 
	  		"								where season.seasonID=?\r\n" + 
	  		"				  		        GROUP BY playerID,teamID) \r\n" + 
	  		"				  		pd join teams t \r\n" + 
	  		"				  		on pd.teamId=t.teamID \r\n" + 
	  		"				  		join players p \r\n" + 
	  		"				  		on pd.playerID=p.playerID";
	  
	  private static final String FIND_BY_GROUPID = "select t.teamID,p.playerName,p.playerID,p.photo,t.teamName,gamecount,gametime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,personalFouls,points\r\n" + 
		  		"				  		from   (select playerID,teamID,\r\n" + 
		  		"				  		        count(PersonalData.gameID)as gamecount,\r\n" + 
		  		"				  		        sum(gameTime)as gametime, \r\n" + 
		  		"				  		        sum(twoPoint)as twoPoint, \r\n" + 
		  		"				  		        sum(twoPointShot)as twoPointShot, \r\n" + 
		  		"				  		        sum(threePoint)as threePoint, \r\n" + 
		  		"				  		        sum(threePointShot)as threePointShot, \r\n" + 
		  		"				  		        sum(fg)as fg,\r\n" + 
		  		"				  		        sum(fgShot)as fgShot, \r\n" + 
		  		"				  		        sum(offReb)as offReb,\r\n" + 
		  		"				  		        sum(defReb)as defReb, \r\n" + 
		  		"				  		        sum(assist)as assist, \r\n" + 
		  		"				  		        sum(steal)as steal, \r\n" + 
		  		"				  		        sum(blocks)as blocks,\r\n" + 
		  		"				  		        sum(turnover)as turnover,\r\n" + 
		  		"				  		        sum(personalFouls)as personalFouls,\r\n" + 
		  		"				  		        sum(points)as points \r\n" + 
		  		"				  		        from PersonalData \r\n" + 
		  		"								join games\r\n" + 
		  		"								on games.gameID = PersonalData.gameID\r\n" + 
		  		"								join groups\r\n" + 
		  		"								on games.groupID = Groups.groupID\r\n" + 
		  		"								join season\r\n" + 
		  		"								on groups.seasonID = season.seasonID\r\n" + 
		  		"								where groups.groupID=?\r\n" + 
		  		"				  		        GROUP BY playerID,teamID) \r\n" + 
		  		"				  		pd join teams t \r\n" + 
		  		"				  		on pd.teamId=t.teamID \r\n" + 
		  		"				  		join players p \r\n" + 
		  		"				  		on pd.playerID=p.playerID";
	
	
	@Override
	public List<PersonalDataVO> getAll() {
		List<PersonalDataVO> list =new ArrayList<PersonalDataVO>();
		PersonalDataVO personalDataVO=null;
		
		Connection con=null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			Class.forName(diver);
			con=DriverManager.getConnection(url, user, password);
			pstmt=con.prepareStatement(GETAll);
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
				
		  //	personalDataVO.setTeamID(rs.getInt("teamID"));
				personalDataVO.setGameTime(rs.getInt("GameTime"));
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
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	@Override
	public List<PersonalDataVO> findBySeasonID(Integer SeasonID) {
		List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalDataVO=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	Class.forName(diver);
			con=DriverManager.getConnection(url, user, password);
			pstmt=con.prepareStatement(FIND_BY_SEASONID);
			pstmt.setInt(1,SeasonID);
			rs=pstmt.executeQuery();
			while (rs.next()){
			
				GamesVO gamesVO = new GamesVO();		
				
				personalDataVO=new PersonalDataVO();
				personalDataVO.setGamesVO(gamesVO);
				
				TeamsVO teamsVO =new TeamsVO();
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));
	            personalDataVO.setTeamsVO(teamsVO);
	            
	            PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerName(rs.getString("playerName"));
				playersVO.setPlayerID(rs.getInt("playerID"));
				playersVO.setPhoto(rs.getString("photo"));
				personalDataVO.setPlayersVO(playersVO);
				
		     	personalDataVO.setGameID(rs.getInt("gameCount"));
				personalDataVO.setGameTime(rs.getInt("gameTime"));
				personalDataVO.setTwoPoint(rs.getInt("twoPoint"));
				personalDataVO.setTwoPointShot(rs.getInt("twoPointShot"));
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
				
				list.add(personalDataVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<PersonalDataVO> findByGroupID(Integer GroupID) {
		List<PersonalDataVO> list=new ArrayList<PersonalDataVO>(); 
        PersonalDataVO personalDataVO=null;
     
		
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs =null;
        
        try {
        	Class.forName(diver);
			con=DriverManager.getConnection(url, user, password);
			pstmt=con.prepareStatement(FIND_BY_GROUPID);
			pstmt.setInt(1,GroupID);
			rs=pstmt.executeQuery();
			while (rs.next()){
				
				GamesVO gamesVO = new GamesVO();		
				
				personalDataVO=new PersonalDataVO();
				personalDataVO.setGamesVO(gamesVO);
				
				TeamsVO teamsVO =new TeamsVO();
	            teamsVO.setTeamName(rs.getString("teamName"));
	            teamsVO.setTeamID(rs.getInt("teamID"));
	            personalDataVO.setTeamsVO(teamsVO);
	            
	            PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerName(rs.getString("playerName"));
				playersVO.setPlayerID(rs.getInt("playerID"));
				playersVO.setPhoto(rs.getString("photo"));
				personalDataVO.setPlayersVO(playersVO);
				
		     	personalDataVO.setGameID(rs.getInt("gameCount"));
				personalDataVO.setGameTime(rs.getInt("gameTime"));
				personalDataVO.setTwoPoint(rs.getInt("twoPoint"));
				personalDataVO.setTwoPointShot(rs.getInt("twoPointShot"));
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
				
				list.add(personalDataVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	
	}
	
    public static void main(String[] args){
    	PersonalDataJDBCDAO dao=new PersonalDataJDBCDAO();
    	
    	List<PersonalDataVO> list=dao.findByGroupID(2002);
    	for(PersonalDataVO aPersonal:list){
    		System.out.print(aPersonal.getPlayersVO().getPlayerName()+",");
//    		System.out.print(aPersonal.getPlayersVO().getPhoto()+",");
    		System.out.print(aPersonal.getTeamsVO().getTeamName()+",");
    	  //System.out.print(aPersonal.getTeamID()+",");
    		System.out.print(aPersonal.getGameTime()+",");
    		System.out.print(aPersonal.getTwoPoint()+",");
    		System.out.print(aPersonal.getTwoPointShot()+",");
    		System.out.print(aPersonal.getThreePoint()+",");
    		System.out.print(aPersonal.getThreePointShot()+",");
    		System.out.print(aPersonal.getFg()+",");
    		System.out.print(aPersonal.getFgShot()+",");
    		System.out.print(aPersonal.getDefReb()+",");
    		System.out.print(aPersonal.getOffReb()+",");
    		System.out.print(aPersonal.getAssist()+",");
    		System.out.print(aPersonal.getSteal()+",");
    		System.out.print(aPersonal.getBlocks()+",");
    		System.out.print(aPersonal.getTurnover()+",");
    		System.out.print(aPersonal.getPersonalFouls()+",");
    		System.out.print(aPersonal.getPoints()+",");
    	  //System.out.print(aPersonal.getStartingPlayer()+",");
    		System.out.println();
    		
    	}
    }
	@Override
	public List<PersonalDataVO> getAll1() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<PersonalDataVO> getAll2() {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PersonalDataVO> findByPlayerIDAndGameID(Integer PlayerID, Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PersonalDataVO> findByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
}
