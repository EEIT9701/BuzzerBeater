package eeit.groupreg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import eeit.groups.model.GroupsVO;
import eeit.teams.model.TeamsVO;

public class GroupRegDAO_JDBC implements GroupRegDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
	String user = "sa";
	String pswd = "P@ssw0rd";

	private static String GET_SIGNUP_PLAYERS = "SELECT teamID,tc.playerID from TeamComposition AS tc JOIN PlayerGroups AS pg ON tc.playerID=pg.playerID WHERE groupID=? AND teamID=? AND leaveTeamDate<GETDATE()";
	
	private static final String INSERT_STMT=
			"INSERT INTO GroupRegistration(teamID,groupID,teamStat,registerDate,paymentNumber) VALUES(?,?,?,?,?)";
	private static final String UPDATE_STMT=
			"UPDATE GroupRegistration set teamStat=? ,registerDate=?, paymentNumber=? where teamID=? and groupID=?";
	private static final String DELETE_STMT=
			"DELETE FROM GroupRegistration WHERE teamID=? and groupID=?";
	
	
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
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, pswd);
			pstmt=con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, gVO.getTeamsVO().getTeamID());
			pstmt.setInt(2, gVO.getGroupsVO().getGroupID());
			pstmt.setInt(3, gVO.getTeamStat());
			pstmt.setTimestamp(4, gVO.getRegisterDate());
			pstmt.setString(5, gVO.getPaymentNumber());
			
			pstmt.executeUpdate();
			
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void update(GroupRegVO gVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, pswd);
			pstmt=con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, gVO.getTeamStat());
			pstmt.setTimestamp(2, gVO.getRegisterDate());
			pstmt.setString(3, gVO.getPaymentNumber());
			pstmt.setInt(4, gVO.getTeamsVO().getTeamID());
			pstmt.setInt(5, gVO.getGroupsVO().getGroupID());
			
			pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void deleteByTeamID(Integer teamID) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByGroupID(Integer groupID) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByCID(Integer teamID, Integer groupID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, pswd);
			pstmt=con.prepareStatement(DELETE_STMT);
			
			pstmt.setInt(1, teamID);
			pstmt.setInt(2, groupID);
			
			pstmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		GroupRegDAO_JDBC dao2 =new GroupRegDAO_JDBC();
		
		//insert
		GroupRegVO groupRegVO1=new GroupRegVO();
		TeamsVO teamsVO=new TeamsVO();
		GroupsVO groupsVO=new GroupsVO();
		
//		teamsVO.setTeamID(3004);
//		groupRegVO1.setTeamsVO(teamsVO);
//				
//		groupsVO.setGroupID(2003);
//		groupRegVO1.setGroupsVO(groupsVO);
//		groupRegVO1.setTeamStat(1);
//		groupRegVO1.setRegisterDate(null);
//		groupRegVO1.setPaymentNumber("66666");
//		dao2.insert(groupRegVO1);
		
		//update
		
//		teamsVO.setTeamID(3002);
//		groupRegVO1.setTeamsVO(teamsVO);
//		groupsVO.setGroupID(2006);
//		groupRegVO1.setGroupsVO(groupsVO);
//		
//		groupRegVO1.setTeamStat(2);
//		groupRegVO1.setPaymentNumber("00000");
//		groupRegVO1.setRegisterDate(null);
//
//		
//		dao2.update(groupRegVO1);

//		delete
		

//		dao2.deleteByCID(3004, 2003);
		
		
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
