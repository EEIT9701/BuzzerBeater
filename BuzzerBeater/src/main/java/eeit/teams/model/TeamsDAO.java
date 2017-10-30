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
	
	private static final String GET_ALLTEAMS_STMT = "SELECT teamID,captainID,captainEmail,captainPhone,teamName,coachName,bossName,teamBadge,totalWin,totalLose,winRate,remarks FROM Teams";
	private static final String GET_ONETEAMS_STMT = "SELECT teamID,captainID,captainEmail,captainPhone,teamName,coachName,bossName,teamBadge,totalWin,totalLose,winRate,remarks FROM Teams WHERE teamID =?";
	private static final String UPDATE_STMT = "UPDATE Teams SET teamBadge=?, teamName=?, captainEmail=?, captainPhone=?, coachName=?, bossName=?,totalWin=?,totalLose=?,winRate=?,remarks=? where teamID = ?";
	
	@Override
	public void insert(TeamsVO teamsVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(TeamsVO teamsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,teamsVO.getTeamBadge());
			pstmt.setString(2,teamsVO.getTeamName());
			pstmt.setString(3,teamsVO.getCaptainEmail());
			pstmt.setString(4,teamsVO.getCaptainPhone());
			pstmt.setString(5,teamsVO.getCoachName());
			pstmt.setString(6,teamsVO.getBossName());
			pstmt.setInt(7,teamsVO.getTotalWin());
			pstmt.setInt(8,teamsVO.getTotalLose());
			pstmt.setFloat(9, teamsVO.getWinRate());
			pstmt.setString(10,teamsVO.getRemarks());
			pstmt.setInt(11,teamsVO.getTeamID());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
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
				TeamsVO.setCaptainID(rs.getInt("captainID"));
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
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
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
				teamsVO.setTeamID(rs.getInt("teamID"));
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
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return teamsVO;
	}

}
