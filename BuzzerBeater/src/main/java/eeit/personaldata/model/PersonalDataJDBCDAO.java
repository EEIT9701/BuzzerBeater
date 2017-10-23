package eeit.personaldata.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eeit.games.model.GamesVO;
import eeit.players.model.PlayersVO;



public class PersonalDataJDBCDAO implements PersonalDataDAO_interface{
    String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	String user="sa";
	String password="P@ssw0rd";
	
	private static final String GETAll="SELECT playerID,gameID,teamID,GameTime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,points,startingPlayer from personaldata order by playerID";
	
	
	
	
	
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
				playersVO.setPlayerID(rs.getInt("playerID"));
				personalDataVO.setPlayersVO(playersVO);
				
				GamesVO gamesVO = new GamesVO();
				gamesVO.setGameID(rs.getInt("gameID"));
				personalDataVO.setGamesVO(gamesVO);
				
	
				personalDataVO.setTeamID(rs.getInt("teamID"));
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
				personalDataVO.setPoints(rs.getInt("points"));
				personalDataVO.setStartingPlayer(rs.getInt("startingPlayer"));
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
    public static void main(String[] args){
    	PersonalDataJDBCDAO dao=new PersonalDataJDBCDAO();
    	
    	List<PersonalDataVO> list=dao.getAll();
    	for(PersonalDataVO aPersonal:list){
    		System.out.print(aPersonal.getPlayersVO().getPlayerID()+",");
    		System.out.print(aPersonal.getGamesVO().getGameID()+",");
    		System.out.print(aPersonal.getTeamID()+",");
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
    		System.out.print(aPersonal.getPoints()+",");
    		System.out.print(aPersonal.getStartingPlayer()+",");
    		System.out.println();
    		
    	}
    }
	
	
	
}
