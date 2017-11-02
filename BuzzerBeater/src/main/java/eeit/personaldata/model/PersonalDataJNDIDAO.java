package eeit.personaldata.model;

import java.sql.Connection;
import java.sql.DriverManager;
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



public class PersonalDataJNDIDAO implements PersonalDataDAO_interface{
    String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	String user="sa";
	String password="P@ssw0rd";
	
	private static DataSource ds = null;
	static{
		 try{
			Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		 }catch(NamingException ne){
			 ne.printStackTrace();
		 }

	}
	
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
	
	private static final String UPDATE = "UPDATE PersonalData set playerID=?, gameID=?, teamID=?, gameTime=?, twoPoint=?, twoPointShot=?, threePoint=?, threePointShot=?, fg=?, fgShot=?, offReb=?, defReb=?, assist=?, steal=?, blocks=?, turnover=?, personalFouls=?, points=?, startingPlayer=? where playerID = ? and gameID=? and teamID=?";
	private static final String INSERT_STMT = "INSERT INTO PersonalData(playerID, gameID, teamID, gameTime, twoPoint, twoPointShot, threePoint, threePointShot, fg, fgShot, offReb, defReb, assist, steal, blocks, turnover, personalFouls, points, startingPlayer) VALUES(?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?, ?,?, ?, ?)"; 
	private static final String DELETE = "DELETE FROM PersonalData where playerID = ? and gameID=? and teamID=?";
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
		 Connection conn = null;
		 PreparedStatement stmt = null;	
		 try{
		 
		 conn = ds.getConnection();
		 stmt = conn.prepareStatement(INSERT_STMT);

		 stmt.setInt(1, personalDataVO.getPlayerID());		 
		 stmt.setInt(2, personalDataVO.getGameID());
		 stmt.setInt(3, personalDataVO.getTeamID());
		 stmt.setInt(4, personalDataVO.getGameTime());
		 stmt.setInt(5, personalDataVO.getTwoPoint());
		 stmt.setInt(6, personalDataVO.getTwoPointShot());
		 stmt.setInt(7, personalDataVO.getThreePoint());
		 stmt.setInt(8, personalDataVO.getThreePointShot());
		 stmt.setInt(9, personalDataVO.getFg());
		 stmt.setInt(10, personalDataVO.getFgShot());
		 stmt.setInt(11, personalDataVO.getOffReb());
		 stmt.setInt(12, personalDataVO.getDefReb());
		 stmt.setInt(13, personalDataVO.getAssist());
		 stmt.setInt(14, personalDataVO.getSteal());
		 stmt.setInt(15, personalDataVO.getBlocks());
		 stmt.setInt(16, personalDataVO.getTurnover());
		 stmt.setInt(17, personalDataVO.getPersonalFouls());
		 stmt.setInt(18, personalDataVO.getPoints());
		 stmt.setInt(19, personalDataVO.getStartingPlayer());	 

		 stmt.executeUpdate();
		 }catch(SQLException sqle){
		 sqle.printStackTrace();
		 }finally{
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			 }
			 
		 }
		
	}
	@Override
	public void update(PersonalDataVO personalDataVO) {
		 Connection conn = null;
		 PreparedStatement stmt = null;
		
		 try{
		 
		 conn = ds.getConnection();
		 stmt = conn.prepareStatement(UPDATE);
		 
//		 System.out.println(personalDataVO.getPlayerID());
		 
		 stmt.setInt(1, personalDataVO.getPlayerID());		 
		 stmt.setInt(2, personalDataVO.getGameID());
		 stmt.setInt(3, personalDataVO.getTeamID());
		 stmt.setInt(4, personalDataVO.getGameTime());
		 stmt.setInt(5, personalDataVO.getTwoPoint());
		 stmt.setInt(6, personalDataVO.getTwoPointShot());
		 stmt.setInt(7, personalDataVO.getThreePoint());
		 stmt.setInt(8, personalDataVO.getThreePointShot());
		 stmt.setInt(9, personalDataVO.getFg());
		 stmt.setInt(10, personalDataVO.getFgShot());
		 stmt.setInt(11, personalDataVO.getOffReb());
		 stmt.setInt(12, personalDataVO.getDefReb());
		 stmt.setInt(13, personalDataVO.getAssist());
		 stmt.setInt(14, personalDataVO.getSteal());
		 stmt.setInt(15, personalDataVO.getBlocks());
		 stmt.setInt(16, personalDataVO.getTurnover());
		 stmt.setInt(17, personalDataVO.getPersonalFouls());
		 stmt.setInt(18, personalDataVO.getPoints());
		 stmt.setInt(19, personalDataVO.getStartingPlayer());	 
		 stmt.setInt(20, personalDataVO.getPlayerID());		 
		 stmt.setInt(21, personalDataVO.getGameID());
		 stmt.setInt(22, personalDataVO.getTeamID());

		 stmt.executeUpdate();
		 
		 
		 }catch(SQLException sqle){
		 sqle.printStackTrace();
		 }finally{
			 if(stmt!= null){
				 try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 if(conn!=null){
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
		 }
		
	}
	@Override
	public void delete(PersonalDataVO personalDataVO) {
		 Connection conn = null;
		 PreparedStatement stmt = null;
		
		 try{		 
		 conn = ds.getConnection();
		 stmt = conn.prepareStatement(DELETE);
		 stmt.setInt(1, personalDataVO.getPlayerID());		 
		 stmt.setInt(2, personalDataVO.getGameID());
		 stmt.setInt(3, personalDataVO.getTeamID());
		 stmt.executeUpdate();
		 
		 
		 }catch(SQLException sqle){
			 sqle.printStackTrace();
			 }finally{
				 if(stmt!= null){
					 try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 }
				 if(conn!=null){
					 try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 }
				 
			 }
		
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
}
