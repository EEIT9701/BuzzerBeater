package eeit.games.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GamesDAO_JNDI implements GamesDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_ALL_STMT = "SELECT gameID, groupID, locationID, teamAID, teamAScore, teamBID, teamBScore, winnerID, gameBeginDate, gameEndDate FROM Games";
	private static final String INSERT_STMT = "INSERT INTO Games VALUES(?,?,?,?,?,?,?,?,?)";

	@Override
	public Set<GamesVO> getAll() {
		return null;
	}

	@Override
	public Integer insert(GamesVO gVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int i = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, gVO.getGroupsVO().getGroupID());
			pstmt.setInt(2, gVO.getLocationinfoVO().getLocationID());
			pstmt.setInt(3, gVO.getTeamAVO().getTeamID());
			pstmt.setInt(4, gVO.getTeamAScore());
			pstmt.setInt(5, gVO.getTeamBVO().getTeamID());
			pstmt.setInt(6, gVO.getTeamBScore());
			pstmt.setInt(7, gVO.getWinnerID());
			pstmt.setTimestamp(8, gVO.getGameBeginDate());
			pstmt.setTimestamp(9, gVO.getGameEndDate());

			i = pstmt.executeUpdate();

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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return i;
	}

	@Override
	public void update(GamesVO gVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer games_ID) {
		// TODO Auto-generated method stub

	}

	@Override
	public GamesVO findByGameID(Integer gamesID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GamesVO> findByGroupID(Integer groupID) {
		// TODO Auto-generated method stub
		return null;
	}

}
