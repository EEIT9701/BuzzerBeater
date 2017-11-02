package eeit.gamemedia.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import eeit.games.model.GamesVO;


public class GameMediaDAO_JNDI implements GameMediaDAO_Interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT =
		      "INSERT INTO GameMedia (gameID,mediasName,gameVideo,gamePhoto,mediaType,mediaDate,descriptions,tag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT * FROM GameMedia order by gameID";
	private static final String GET_ONE_STMT =
		      "SELECT gameID,mediaID,mediasName,gameVideo,gamePhoto,mediaType,mediaDate,descriptions,tag FROM GameMedia where mediaID = ?";
	private static final String DELETE =
		      "DELETE FROM GameMedia where mediaID = ?";
	private static final String UPDATE =
		      "UPDATE GameMedia set gameID=?,mediasName=?, gameVideo=?, gamePhoto=?, mediaType=?, mediaDate=?, descriptions=?, tag=? where mediaID = ?";
	private static final String GET_ALL_VIDEO_STMT = 
			  "SELECT * FROM GameMedia WHERE MediaType = 'video'";;
	
	@Override
	public Integer insert(GameMediaVO gameMediaVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, gameMediaVO.getGamesVO().getGameID());
			pstmt.setString(2, gameMediaVO.getMediasName());
			pstmt.setString(3, gameMediaVO.getGameVideo());
			pstmt.setString(4, gameMediaVO.getGamePhoto());
			pstmt.setString(5, gameMediaVO.getMediaType());
			pstmt.setTimestamp(6, gameMediaVO.getMediaDate());
			pstmt.setString(7, gameMediaVO.getDescriptions());
			pstmt.setString(8, gameMediaVO.getTag());

			pstmt.executeUpdate();

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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return null;
	}

	@Override
	public void update(GameMediaVO gameMediaVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(UPDATE);

			pstmt.setInt(1, gameMediaVO.getGamesVO().getGameID());
			pstmt.setString(2, gameMediaVO.getMediasName());
			pstmt.setString(3, gameMediaVO.getGameVideo());
			pstmt.setString(4, gameMediaVO.getGamePhoto());
			pstmt.setString(5, gameMediaVO.getMediaType());
			pstmt.setTimestamp(6, gameMediaVO.getMediaDate());
			pstmt.setString(7, gameMediaVO.getDescriptions());
			pstmt.setString(8, gameMediaVO.getTag());
			pstmt.setInt(9, gameMediaVO.getMediaID());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(Integer gameMediaVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(DELETE);

			pstmt.setInt(1, gameMediaVO);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public GameMediaVO findByPrimaryKey(Integer mediaID) {
		
		GameMediaVO gameMediaVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			conn=ds.getConnection();
			pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, mediaID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				gameMediaVO = new GameMediaVO();
				GamesVO gamesVO = new GamesVO();
				gamesVO.setGameID(rs.getInt("gameID"));
				gameMediaVO.setGamesVO(gamesVO);
				gameMediaVO.setMediaID(rs.getInt("mediaID"));
				gameMediaVO.setMediasName(rs.getString("mediasName"));
				gameMediaVO.setGameVideo(rs.getString("gameVideo"));
				gameMediaVO.setGamePhoto(rs.getString("gamePhoto"));
				gameMediaVO.setMediaType(rs.getString("mediaType"));
				gameMediaVO.setMediaDate(rs.getTimestamp("mediaDate"));
				gameMediaVO.setDescriptions(rs.getString("descriptions"));
				gameMediaVO.setTag(rs.getString("tag"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
		return gameMediaVO;
	}
	
	public List<GameMediaVO> getAllVideo(){
		List<GameMediaVO> list = new ArrayList<GameMediaVO>();
		GameMediaVO gameMediaVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_VIDEO_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gameMediaVO = new GameMediaVO();
				GamesVO game = new GamesVO();
				game.setGameID(rs.getInt("gameID"));
				gameMediaVO.setGamesVO(game);
				
				gameMediaVO.setMediaID(rs.getInt("mediaID"));
				gameMediaVO.setMediasName(rs.getString("mediasName"));
				gameMediaVO.setGameVideo(rs.getString("gameVideo"));
				gameMediaVO.setGamePhoto(rs.getString("gamePhoto"));
				gameMediaVO.setMediaType(rs.getString("mediaType"));
				gameMediaVO.setMediaDate(rs.getTimestamp("mediaDate"));
				gameMediaVO.setDescriptions(rs.getString("descriptions"));
				gameMediaVO.setTag(rs.getString("tag"));
				list.add(gameMediaVO);
			}
			
			// Handle any driver errors
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
	public List<GameMediaVO> getAll() {
		List<GameMediaVO> list = new ArrayList<GameMediaVO>();
		GameMediaVO gameMediaVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gameMediaVO = new GameMediaVO();
				GamesVO game = new GamesVO();
				game.setGameID(rs.getInt("gameID"));
				gameMediaVO.setGamesVO(game);
				
				gameMediaVO.setMediaID(rs.getInt("mediaID"));
				gameMediaVO.setMediasName(rs.getString("mediasName"));
				gameMediaVO.setGameVideo(rs.getString("gameVideo"));
				gameMediaVO.setGamePhoto(rs.getString("gamePhoto"));
				gameMediaVO.setMediaType(rs.getString("mediaType"));
				gameMediaVO.setMediaDate(rs.getTimestamp("mediaDate"));
				gameMediaVO.setDescriptions(rs.getString("descriptions"));
				gameMediaVO.setTag(rs.getString("tag"));
				list.add(gameMediaVO);
			}
			
			// Handle any driver errors
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
	

	
	public static void main(String[] args) {
		GameMediaDAO_JNDI dao = new GameMediaDAO_JNDI();
		
		List<GameMediaVO> list = null;
		
		list = dao.getAll();
		System.out.println(list);
		for (GameMediaVO media : list) {
			
			System.out.print(media.getGamesVO() + ",");
			System.out.print(media.getMediaID() + ",");
			System.out.print(media.getMediasName() + ",");
			System.out.print(media.getGameVideo() + ",");
			System.out.print(media.getGamePhoto() + ",");
			System.out.print(media.getMediaType() + ",");
			System.out.print(media.getMediaDate() + ",");
			System.out.print(media.getDescriptions() + ",");
			System.out.print(media.getTag());
			System.out.println();
		}
		
		
	}
	
}
