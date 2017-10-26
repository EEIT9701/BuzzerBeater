package eeit.players.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PlayerDAO implements PlayerDAO_interface {
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
	
	//宣告sql指令。
	private static final String INSERT_STMT = "INSERT INTO Players (PlayerName,ID,Height,Weights,Birthday,Nationality) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE Players SET PlayerName=?, ID=?, Height=?, Weights=?, Birthday=?, Nationality=?,Photo=? where PlayerID = ?";
	private static final String DELETE_STMT = "DELETE FROM Players where PlayerID = ?";
	private static final String GET_ONENAME_STMT = "SELECT PlayerID,PlayerName,ID,Height,Weights,Birthday,Nationality,photo FROM Players where PlayerName = ?";
	private static final String GET_ONEID_STMT = "SELECT PlayerID,PlayerName,ID,Height,Weights,Birthday,Nationality,Photo FROM Players where PlayerID = ?";
	private static final String GET_ALL_STMT = "SELECT PlayerID,PlayerName,ID,Height,Weights,Birthday,Nationality,Photo FROM Players";
	
	//新增method
	@Override
	public void insert(PlayersVO playerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, playerVO.getPlayerName());
			pstmt.setString(2, playerVO.getId());
			pstmt.setDouble(3, playerVO.getHeight());
			pstmt.setDouble(4, playerVO.getWeights());
			pstmt.setDate(5, playerVO.getBirthday());
			pstmt.setString(6, playerVO.getNationality());
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
	public void update(PlayersVO playerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, playerVO.getPlayerName());
			pstmt.setString(2, playerVO.getId());
			pstmt.setDouble(3, playerVO.getHeight());
			pstmt.setDouble(4, playerVO.getWeights());
			pstmt.setDate(5, playerVO.getBirthday());
			pstmt.setString(6, playerVO.getNationality());
			pstmt.setString(7, playerVO.getPhoto());
			pstmt.setInt(8, playerVO.getPlayerID());
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
	public void delete(Integer playerID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1,playerID);
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
	public Set<PlayersVO> findByPlayerName(String playerName) {
		Set<PlayersVO> set = new LinkedHashSet<PlayersVO>();
		PlayersVO playerVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONENAME_STMT);
			pstmt.setString(1, playerName);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				playerVO = new PlayersVO();
				playerVO.setPlayerID(rs.getInt("playerID"));
				playerVO.setPlayerName(rs.getString("playerName"));
				playerVO.setId(rs.getString("id"));
				playerVO.setHeight(rs.getDouble("height"));
				playerVO.setWeights(rs.getDouble("weights"));
				playerVO.setBirthday(rs.getDate("birthday"));
				playerVO.setNationality(rs.getString("nationality"));
				playerVO.setPhoto(rs.getString("photo"));
				set.add(playerVO);
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
	public PlayersVO findByID(Integer playerID) {
		PlayersVO playerVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONEID_STMT);
			pstmt.setInt(1, playerID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				playerVO = new PlayersVO();
				playerVO.setPlayerID(rs.getInt("playerID"));
				playerVO.setPlayerName(rs.getString("playerName"));
				playerVO.setId(rs.getString("id"));
				playerVO.setHeight(rs.getDouble("height"));
				playerVO.setWeights(rs.getDouble("weights"));
				playerVO.setBirthday(rs.getDate("birthday"));
				playerVO.setNationality(rs.getString("nationality"));
				playerVO.setPhoto(rs.getString("photo"));
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
		
		return playerVO;
	}

	@Override
	public Set<PlayersVO> getAll() {
		Set<PlayersVO> set = new LinkedHashSet<PlayersVO>();
		PlayersVO playerVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				playerVO = new PlayersVO();
				playerVO.setPlayerID(rs.getInt("playerID"));
				playerVO.setPlayerName(rs.getString("playerName"));
				playerVO.setId(rs.getString("id"));
				playerVO.setHeight(rs.getDouble("height"));
				playerVO.setWeights(rs.getDouble("weights"));
				playerVO.setBirthday(rs.getDate("birthday"));
				playerVO.setNationality(rs.getString("nationality"));
                playerVO.setPhoto(rs.getString("photo"));
				set.add(playerVO);
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
	
	

	public static void main(String[] args) {

		PlayerDAO dao = new PlayerDAO();

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
		//dao.delete(70005);
//
		// 查詢
//		Set<PlayersVO> set1 = dao.findByPlayerName("Matt Barnes");
//		for (PlayersVO aPlayer1 : set1) {
//			System.out.print(aPlayer1.getPlayerID() + ",");
//			System.out.print(aPlayer1.getPlayerName() + ",");
//			System.out.print(aPlayer1.getId() + ",");
//			System.out.print(aPlayer1.getHeight() + ",");
//			System.out.print(aPlayer1.getWeights() + ",");
//			System.out.print(aPlayer1.getBirthday() + ",");
//			System.out.println(aPlayer1.getNationality()+ ",");
//			System.out.println(aPlayer1.getPhoto());
//			System.out.println();
//	}
//		 System.out.println("---------------------");

		// 查詢
//		Set<PlayersVO> set2 = dao.getAll();
//		for (PlayersVO aPlayer2 : set2) {
//			System.out.print(aPlayer2.getPlayerID() + ",");
//			System.out.print(aPlayer2.getPlayerName() + ",");
//			System.out.print(aPlayer2.getId() + ",");
//			System.out.print(aPlayer2.getHeight() + ",");
//			System.out.print(aPlayer2.getWeights() + ",");
//			System.out.print(aPlayer2.getBirthday() + ",");
//			System.out.println(aPlayer2.getNationality());
//			System.out.println(aPlayer2.getPhoto());
//			System.out.println();
//		}
	}
}


//70005,翁嘉鴻,A120156181,182,79,1992-01-10,taiwan