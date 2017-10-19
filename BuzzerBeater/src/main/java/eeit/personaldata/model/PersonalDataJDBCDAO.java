package eeit.personaldata.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class PersonalDataJDBCDAO implements PersonalDataDAO_interface{
    String diver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	String user="sa";
	String password="P@ssw0rd";
	
	private static final String GETAll="SELECT playerID,gameID,teamID,quarters,quarterTime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,startingPlayer from personaldata order by playerID";
	
	
	
	
	
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
				personalDataVO.setPlayerID(rs.getInt("playerID"));
				personalDataVO.setGameID(rs.getInt("gameID"));
				personalDataVO.setTeamID(rs.getInt("teamID"));
				personalDataVO.setQuarters(rs.getString("quarters"));
				personalDataVO.setQuarterTime(rs.getInt("quarterTime"));
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
    		System.out.print(aPersonal.getPlayerID()+",");
    		System.out.print(aPersonal.getGameID()+",");
    		System.out.print(aPersonal.getTeamID()+",");
    		System.out.print(aPersonal.getQuarters()+",");
    		System.out.print(aPersonal.getQuarterTime()+",");
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
    		System.out.print(aPersonal.getStartingPlayer()+",");
    		System.out.println();
    		
    	}
    }
	
	
	
}
