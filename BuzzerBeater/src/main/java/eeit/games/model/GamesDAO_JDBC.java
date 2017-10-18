package eeit.games.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

import eeit.groups.model.GroupsVO;

public class GamesDAO_JDBC implements GamesDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
	String user = "sa";
	String pswd = "P@ssw0rd";

	private static final String GET_ALL_STMT = "SELECT gameID, groupID, locationID, teamAID, teamAScore, teamBID, teamBScore, winnerID, gameBeginDate, gameEndDate FROM Games";

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
<<<<<<< HEAD
				gVO.setLocationID(rs.getInt("locationID"));
=======
				gVO.getLocationinfoVO().setLocationID(rs.getInt("locationID"));
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
				gVO.setTeamAID(rs.getInt("teamAID"));
				gVO.setTeamAScore(rs.getInt("teamAScore"));
				gVO.setTeamBID(rs.getInt("teamBID"));
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
	public void insert(GamesVO gVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(GamesVO gVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer games_ID) {
		// TODO Auto-generated method stub

	}

	public static void main(String[] args) {
		GamesDAO_JDBC dao = new GamesDAO_JDBC();

		Set<GamesVO> set1 = dao.getAll();
		for (GamesVO g : set1) {
			System.out.print(g.getGameID() + ", ");
			System.out.print(g.getGroupsVO().getGroupID() + ", ");
			System.out.println();
		}
	}

}
