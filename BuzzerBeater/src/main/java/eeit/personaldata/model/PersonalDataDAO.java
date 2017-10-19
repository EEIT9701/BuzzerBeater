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
	
	private static final String GETALL="SELECT playerID,gameID,teamID,quarters,quarterTime,twoPoint,twoPointShot,threePoint,threePointShot,fg,fgShot,offReb,defReb,assist,steal,blocks,turnover,startingPlayer from personaldata order by playerID";
	
	
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        
		return list;
	}

}
