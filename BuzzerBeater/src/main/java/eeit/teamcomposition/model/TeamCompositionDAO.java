package eeit.teamcomposition.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TeamCompositionDAO implements TeamCompositionDAO_interface{
	private static DataSource ds= null;
	static{
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO TeamComposition (teamID,playerID,playerNo,playerRole,joinTeamDate,leaveTeamDate) VALUES(?,?,?,?,?,?)";
	@Override
	public void insert(TeamCompositionVO teamCompositionVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,teamCompositionVO.getTeamID());
			pstmt.setInt(2,teamCompositionVO.getPlayerID());
			pstmt.setInt(3,teamCompositionVO.getPlayerNo());
			pstmt.setString(4,teamCompositionVO.getPlayerRole());
			pstmt.setTimestamp(5,teamCompositionVO.getJoinTeamDate());
			pstmt.setTimestamp(6,teamCompositionVO.getLeaveTeamDate());
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
	public void update(TeamCompositionVO teamCompositionVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByPlayerID(Integer playerID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByCID(Integer teamID, Integer playerID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Set<TeamCompositionVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TeamCompositionVO> findByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TeamCompositionVO> findByPlayerID(Integer playerID) {
		// TODO Auto-generated method stub
		return null;
	}

}
