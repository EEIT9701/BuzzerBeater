package eeit.gamemedia.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import eeit.games.model.GamesVO;


public class GameMediaDAO_JDBC implements GameMediaDAO_Interface{
	
	
	
	
	

	private static final String GET_ALL_STMT =
		      "SELECT * FROM GameMedia order by gameID";

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
				gameMediaVO.setGamePhoto(rs.getBlob("gamePhoto"));
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
		
		
	}

	@Override
	public void insert(GameMediaVO gameMediaVO) {
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
	public GameMediaVO findByPrimaryKey(Integer gameMediaVO) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
