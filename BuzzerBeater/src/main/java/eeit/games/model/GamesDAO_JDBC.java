package eeit.games.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import eeit.groups.model.GroupsVO;

public class GamesDAO_JDBC implements GamesDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
	String user = "sa";
	String pswd = "P@ssw0rd";

	private static final String GET_ALL_STMT = "SELECT gameID, groupID, locationID, teamAID, teamAScore, teamBID, teamBScore, winnerID, gameBeginDate, gameEndDate FROM Games";
	private static final String INSERT_STMT = "INSERT INTO Games VALUES(?,?,?,?,?,?,?,?,?)";
	private static final String DELETE_BY_GROUPID = "DELETE FROM Games WHERE groupID=?";

	@Override
	public void deleteByGroupID(Integer groupID) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);
			pstmt = conn.prepareStatement(DELETE_BY_GROUPID);
			pstmt.setInt(1, groupID);
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
	}

	@Override
	public Set<GamesVO> getAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GamesVO gVO = null;
		GroupsVO groupsVO = null;
		Set<GamesVO> set = new LinkedHashSet<GamesVO>();

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);
			pstmt = conn.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				gVO = new GamesVO();
				gVO.setGameID(rs.getInt("gameID"));

				groupsVO = new GroupsVO();
				groupsVO.setGroupID(rs.getInt("groupID"));

				gVO.setGroupsVO(groupsVO);
				gVO.getLocationinfoVO().setLocationID(rs.getInt("locationID"));
				gVO.getTeamAVO().setTeamID(rs.getInt("teamAID"));
				gVO.setTeamAScore(rs.getInt("teamAScore"));
				gVO.getTeamBVO().setTeamID(rs.getInt("teamBID"));
				gVO.setTeamBScore(rs.getInt("teamBScore"));
				gVO.setWinnerID(rs.getInt("winnerID"));
				gVO.setGameBeginDate(rs.getTimestamp("gameBeginDate"));
				gVO.setGameEndDate(rs.getTimestamp("gameEndDate"));
				set.add(gVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
		return set;

	}

	@Override
	public Integer insert(GamesVO gVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int i = 0;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

	public static void main(String args[]) {
		GamesDAO_JDBC dao = new GamesDAO_JDBC();
		
		dao.deleteByGroupID(2006);

//		GamesVO gamesVO = new GamesVO();
//		TeamsVO teamAVO = new TeamsVO();
//		TeamsVO teamBVO = new TeamsVO();
//		LocationinfoVO locVO = new LocationinfoVO();
//		GroupsVO groupsVO = new GroupsVO();
//
//		groupsVO.setGroupID(2006);
//		gamesVO.setGroupsVO(groupsVO);
//		locVO.setLocationID(101);
//		gamesVO.setLocationinfoVO(locVO);
//		teamAVO.setTeamID(3001);
//		gamesVO.setTeamAVO(teamAVO);
//		teamBVO.setTeamID(3002);
//		gamesVO.setTeamBVO(teamBVO);
//		gamesVO.setTeamAScore(0);
//		gamesVO.setTeamBScore(0);
//		gamesVO.setWinnerID(0);
//		gamesVO.setGameBeginDate(Timestamp.valueOf("2017-06-22 20:00:00"));
//
//		dao.insert(gamesVO);

	}

}
