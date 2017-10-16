package eeit.players.model;

import java.awt.event.PaintEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

public class PlayerJDBCDAO implements PlayerDAO_interface {
	//宣告資料庫驅動程式字串。
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//宣告url字串。
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB";
	//宣告user名稱。
	String user = "sa";
	//宣告password。
	String password = "P@ssw0rd";
	
	//宣告sql指令。
	private static final String INSERT_STMT = "INSERT INTO Players (Player_name,ID_number,Height,Weights,Birthday,Nationality) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE Players SET Player_name=?, ID_number=?, Height=?, Weights=?, Birthday=?, Nationality=? where Player_ID = ?";
	private static final String DELETE_STMT = "DELETE FROM Players where Player_ID = ?";
	private static final String GET_ONE_STMT = "SELECT Player_ID,Player_name,ID_number,Height,Weights,Birthday,Nationality FROM Players where Player_name = ?";
	private static final String GET_ALL_STMT = "SELECT Player_ID,Player_name,ID_number,Height,Weights,Birthday,Nationality FROM Players";
	
	//新增method
	@Override
	public void insert(PlayerVO playerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, playerVO.getPlayerName());
			pstmt.setString(2, playerVO.getId());
			pstmt.setInt(3, playerVO.getHeight());
			pstmt.setInt(4, playerVO.getWeights());
			pstmt.setDate(5, playerVO.getBirthday());
			pstmt.setString(6, playerVO.getNationality());
			pstmt.executeUpdate();
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
	public void update(PlayerVO playerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, playerVO.getPlayerName());
			pstmt.setString(2, playerVO.getId());
			pstmt.setInt(3, playerVO.getHeight());
			pstmt.setInt(4, playerVO.getWeights());
			pstmt.setDate(5, playerVO.getBirthday());
			pstmt.setString(6, playerVO.getNationality());
			pstmt.setInt(7, playerVO.getPlayerID());
			pstmt.executeUpdate();
			
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
	public void delete(Integer playerID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1,playerID);
			pstmt.executeUpdate();
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
	public Set<PlayerVO> findByPlayerName(String playerName) {
		Set<PlayerVO> set = new LinkedHashSet<PlayerVO>();
		PlayerVO playerVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, playerName);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				playerVO = new PlayerVO();
				playerVO.setPlayerID(rs.getInt("playerID"));
				playerVO.setPlayerName(rs.getString("playerName"));
				playerVO.setId(rs.getString("id"));
				playerVO.setHeight(rs.getInt("height"));
				playerVO.setWeights(rs.getInt("weights"));
				playerVO.setBirthday(rs.getDate("birthday"));
				playerVO.setNationality(rs.getString("nationality"));
				set.add(playerVO);
			}
			
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
	public Set<PlayerVO> getAll() {
		Set<PlayerVO> set = new LinkedHashSet<PlayerVO>();
		PlayerVO playerVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				playerVO = new PlayerVO();
				playerVO.setPlayerID(rs.getInt("playerID"));
				playerVO.setPlayerName(rs.getString("playerName"));
				playerVO.setId(rs.getString("id"));
				playerVO.setHeight(rs.getInt("height"));
				playerVO.setWeights(rs.getInt("weights"));
				playerVO.setBirthday(rs.getDate("birthday"));
				playerVO.setNationality(rs.getString("nationality"));
				set.add(playerVO);
			}

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

	public static void main(String[] args) {

		PlayerJDBCDAO dao = new PlayerJDBCDAO();

//		// 新增
//		PlayerVO playerVO = new PlayerVO();
//		playerVO.setPlayer_name("林書豪");
//		playerVO.setId_number("F123456789");
//		playerVO.setHeight(180);
//		playerVO.setWeights(90);
//		playerVO.setBirthday(java.sql.Date.valueOf("2002-01-01"));
//		playerVO.setNationality("taiwan");
//		dao.insert(playerVO);
//		
//		// 修改
//		PlayerVO playerVO2 = new PlayerVO();
//		playerVO2.setPlayer_ID(70005);
//		playerVO2.setPlayer_name("林書偉");
//		playerVO2.setId_number("F123456789");
//		playerVO2.setHeight(180);
//		playerVO2.setWeights(90);
//		playerVO2.setBirthday(java.sql.Date.valueOf("2002-01-01"));
//		playerVO2.setNationality("taiwan");
//		dao.update(playerVO2);
//		// // 刪除
		dao.delete(70005);
//
//		// 查詢
		Set<PlayerVO> set1 = dao.findByPlayerName("蔣淯安");
		for (PlayerVO aPlayer1 : set1) {
			System.out.print(aPlayer1.getPlayerID() + ",");
			System.out.print(aPlayer1.getPlayerName() + ",");
			System.out.print(aPlayer1.getId() + ",");
			System.out.print(aPlayer1.getHeight() + ",");
			System.out.print(aPlayer1.getWeights() + ",");
			System.out.print(aPlayer1.getBirthday() + ",");
			System.out.println(aPlayer1.getNationality());
			System.out.println();
		}
//		 System.out.println("---------------------");

		// 查詢
//		Set<PlayerVO> set2 = dao.getAll();
//		for (PlayerVO aPlayer2 : set2) {
//			System.out.print(aPlayer2.getPlayer_ID() + ",");
//			System.out.print(aPlayer2.getPlayer_name() + ",");
//			System.out.print(aPlayer2.getId_number() + ",");
//			System.out.print(aPlayer2.getHeight() + ",");
//			System.out.print(aPlayer2.getWeights() + ",");
//			System.out.print(aPlayer2.getBirthday() + ",");
//			System.out.println(aPlayer2.getNationality());
//			System.out.println();
		}
	}


//70005,翁嘉鴻,A120156181,182,79,1992-01-10,taiwan