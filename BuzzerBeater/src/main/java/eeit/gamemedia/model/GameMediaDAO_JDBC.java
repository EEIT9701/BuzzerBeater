package eeit.gamemedia.model;

import java.sql.*;
import java.util.*;

import eeit.games.model.GamesVO;


public class GameMediaDAO_JDBC implements GameMediaDAO_Interface{
	
	
	
	
	private static final String GET_ONE_STMT =
		      "SELECT gameID,mediaID,mediasName,gameVideo,gamePhoto,mediaType,mediaDate,descriptions,tag FROM GameMedia where mediaID = ?";
	private static final String GET_ALL_STMT =
		      "SELECT * FROM GameMedia order by mediaID WHERE mediaType = 'photo'";
	private static final String GET_ALL_VIDEO_STMT =
			  "SELECT * FROM GameMedia WHERE MediaType = 'video'";

	@Override
	public List<GameMediaVO> getAll() {
		
		
		List<GameMediaVO> list = new ArrayList<GameMediaVO>();
		GameMediaVO gameMediaVO = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=BasketBallDB";
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");
			
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
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
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
		GameMediaDAO_JDBC dao = new GameMediaDAO_JDBC();

		List<GameMediaVO> list = null;
		
		list = dao.getAll();
		for (GameMediaVO media : list) {
			
			System.out.print(media.getGamesVO().getGameID() + ",");
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
//		
//		GameMediaVO gameMediaVO = dao.findByPrimaryKey(6001);
//		
//		System.out.println(gameMediaVO.getTag());
		
	}

	@Override
	public Integer insert(GameMediaVO gameMediaVO) {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(GameMediaVO gameMediaVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer mediaID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GameMediaVO findByPrimaryKey(Integer ID) {
		
		GameMediaVO gameMediaVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=BasketBallDB";
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");
			
			pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, ID);
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
		} catch (SQLException | ClassNotFoundException se) {
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

	@Override
	public List<GameMediaVO> getAllVideo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GameMediaVO> tagFunction(String tag) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
