package eeit.teams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TeamsDAO implements TeamsDAO_interface {
	private static DataSource ds= null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALLTEAMS_STMT = "SELECT teamID,captainEmail,captainPhone,teamName,coachName,bossName,teamBadge,totalWin,totalLose,winRate,remarks FROM Teams";
	private static final String GET_ONETEAMS_STMT = "SELECT teamID,captainEmail,captainPhone,teamName,coachName,bossName,teamBadge,totalWin,totalLose,winRate,remarks FROM Teams WHERE teamID =?";
	@Override
	public void insert(TeamsVO teamsVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(TeamsVO teamsVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer teamID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Set<TeamsVO> getAll() {
		Set<TeamsVO> set = new LinkedHashSet<TeamsVO>();
		TeamsVO TeamsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALLTEAMS_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TeamsVO = new TeamsVO();
				TeamsVO.setTeamID(rs.getInt("teamID"));
				TeamsVO.setCaptainEmail(rs.getString("captainEmail"));
				TeamsVO.setCaptainPhone(rs.getString("captainPhone"));
				TeamsVO.setTeamName(rs.getString("teamName"));
				TeamsVO.setCoachName(rs.getString("coachName"));
				TeamsVO.setBossName(rs.getString("bossName"));
				TeamsVO.setTeamBadge(rs.getString("teamBadge"));
				TeamsVO.setTotalWin(rs.getInt("totalWin"));
				TeamsVO.setTotalLose(rs.getInt("totalLose"));
				TeamsVO.setWinRate(rs.getFloat("winRate"));
				TeamsVO.setRemarks(rs.getString("remarks"));
				
				set.add(TeamsVO);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return set;
	}

	@Override
	public TeamsVO findByID(Integer teamID) {
		TeamsVO teamsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONETEAMS_STMT);
			pstmt.setInt(1,teamID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				teamsVO = new TeamsVO();
				teamsVO.setCaptainID(rs.getInt("captainID"));
				teamsVO.setCaptainEmail(rs.getString("captainEmail"));
				teamsVO.setCaptainPhone(rs.getString("captainPhone"));
				teamsVO.setTeamName(rs.getString("teamName"));
				teamsVO.setCoachName(rs.getString("coachName"));
				teamsVO.setBossName(rs.getString("bossName"));
				teamsVO.setTeamBadge(rs.getString("teamBadge"));
				teamsVO.setTotalWin(rs.getInt("totalWin"));
				teamsVO.setTotalLose(rs.getInt("totalLose"));
				teamsVO.setWinRate(rs.getFloat("winRate"));
				teamsVO.setRemarks(rs.getString("remarks"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teamsVO;
	}

}
