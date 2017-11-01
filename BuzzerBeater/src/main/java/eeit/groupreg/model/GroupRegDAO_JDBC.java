package eeit.groupreg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class GroupRegDAO_JDBC implements GroupRegDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
	String user = "sa";
	String pswd = "P@ssw0rd";

	private static String GET_SIGNUP_PLAYERS = "SELECT teamID,tc.playerID from TeamComposition AS tc JOIN PlayerGroups AS pg ON tc.playerID=pg.playerID WHERE groupID=? AND teamID=? AND leaveTeamDate<GETDATE()";

	@Override
	public List<Map<String, Object>> findSignUpPlayer(Integer groupID, Integer teamID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);
			pstmt = conn.prepareStatement(GET_SIGNUP_PLAYERS);
			pstmt.setInt(1, groupID);
			pstmt.setInt(2, teamID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				map = new HashMap<String, Object>();
				map.put("teamID", rs.getInt(1));
				map.put("playerID", rs.getInt(2));
				list.add(map);
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

		return list;

	}

	@Override
	public Set<GroupRegVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(GroupRegVO gVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(GroupRegVO gVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByTeamID(Integer teamID) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByGroupID(Integer groupID) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByCID(Integer teamID, Integer groupID) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<GroupRegVO> findByGroupID(Integer groupID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GroupRegVO> findByTeamID(Integer teamID) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		GroupRegDAO_interface dao = new GroupRegDAO_JDBC();

		List<Map<String, Object>> list = dao.findSignUpPlayer(2006, 3001);
		for (Map<String, Object> map : list) {
			System.out.print(map.get("teamID") + ", ");
			System.out.print(map.get("playerID") + ", ");
			System.out.println();
		}
		System.out.println(list.size());

	}

}
