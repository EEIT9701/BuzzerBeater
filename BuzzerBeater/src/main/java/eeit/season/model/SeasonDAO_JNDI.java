package eeit.season.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SeasonDAO_JNDI implements SeasonDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSER_TSTMT = "INSERT INTO season (seasonName,seasonBeginDate,seasonEndDate,signUpBegin,signUpEnd,descriptions) VALUES (?,?,?,?,?,?)";
	private static final String UPDATE_STMT = "UPDATE season SET seasonName=?,seasonBeginDate=?,seasonEndDate=?,signUpBegin=?,signUpEnd=?, descriptions=? where seasonID=?";
	private static final String DELETE_STMT = "DELETE from season WHERE seasonID=?";
	private static final String GET_ALL_STMT = "SELECT seasonID, seasonName, seasonBeginDate, seasonEndDate, signUpBegin, signUpEnd, descriptions FROM season ORDER BY seasonBeginDate DESC";
	private static final String GET_ONE_BY_ID = "SELECT seasonID, seasonName, seasonBeginDate, seasonEndDate, signUpBegin, signUpEnd, descriptions FROM season WHERE seasonID=?";
	private static final String GET_LATEST_ID = "SELECT MAX(seasonID) FROM Season";

	@Override
	public Integer getLatestID() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Integer latestID = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(GET_LATEST_ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				latestID = rs.getInt(1);
			}

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

		return latestID;
	}
	@Override
	public SeasonVO findBySeasonID(Integer SeasonID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		SeasonVO sVO = new SeasonVO();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_ID);
			pstmt.setInt(1, SeasonID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sVO.setSeasonID(rs.getInt(1));
				sVO.setSeasonName(rs.getString(2));
				sVO.setSeasonBeginDate(rs.getDate(3));
				sVO.setSeasonEndDate(rs.getDate(4));
				sVO.setSignUpBegin(rs.getTimestamp(5));
				sVO.setSignUpEnd(rs.getTimestamp(6));
				sVO.setDescriptions(rs.getString(7));
			}

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

		return sVO;
	}

	@Override
	public Integer insert(SeasonVO seasonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSER_TSTMT);

			pstmt.setString(1, seasonVO.getSeasonName());
			pstmt.setDate(2, seasonVO.getSeasonBeginDate());
			pstmt.setDate(3, seasonVO.getSeasonEndDate());
			pstmt.setTimestamp(4, seasonVO.getSignUpBegin());
			pstmt.setTimestamp(5, seasonVO.getSignUpEnd());
			pstmt.setString(6, seasonVO.getDescriptions());
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
		return null;
	}

	@Override
	public void update(SeasonVO seasonVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, seasonVO.getSeasonName());
			pstmt.setDate(2, seasonVO.getSeasonBeginDate());
			pstmt.setDate(3, seasonVO.getSeasonEndDate());
			pstmt.setTimestamp(4, seasonVO.getSignUpBegin());
			pstmt.setTimestamp(5, seasonVO.getSignUpEnd());
			pstmt.setString(6, seasonVO.getDescriptions());
			pstmt.setInt(7, seasonVO.getSeasonID());
			pstmt.executeUpdate();


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
	public Integer delete(Integer seasonID) {

		Connection con = null;
		PreparedStatement pstmt = null;
		Integer result = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, seasonID);
			result = pstmt.executeUpdate();

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

		return result;
	}

	@Override
	public Set<SeasonVO> getAll() {
		Set<SeasonVO> set = new LinkedHashSet<SeasonVO>();
		SeasonVO seasonVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				seasonVO = new SeasonVO();
				seasonVO.setSeasonID(rs.getInt(1));
				seasonVO.setSeasonName(rs.getString(2));
				seasonVO.setSeasonBeginDate(rs.getDate(3));
				seasonVO.setSeasonEndDate(rs.getDate(4));
				seasonVO.setSignUpBegin(rs.getTimestamp(5));
				seasonVO.setSignUpEnd(rs.getTimestamp(6));
				seasonVO.setDescriptions(rs.getString(7));
				set.add(seasonVO);
			}

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

	public static void main(String args[]) {
		SeasonDAO_JNDI dao = new SeasonDAO_JNDI();

		/****************** getOneByID ******************/

		// SeasonVO sVO3 = dao.getOneByID(1001);
		// System.out.println(sVO3.getSeasonName());

		/****************** insert ******************/

		SeasonVO sVO1 = new SeasonVO();
		sVO1.setSeasonName("第十六季例行賽");
		sVO1.setSeasonBeginDate(null);
		sVO1.setSignUpBegin(Timestamp.valueOf("2017-10-10 18:00:00"));
		sVO1.setDescriptions("...");
		dao.insert(sVO1);

		/****************** update ******************/

		// SeasonVO sVO2 = new SeasonVO();
		// sVO2.setSeasonID(1003);
		// sVO2.setSeasonName("已修改");
		// sVO2.setDescriptions("已修改");
		// dao.update(sVO2);

		/****************** delete ******************/

		// int i = dao.delete(1011);
		// System.out.println(i + " rows has been deleted.");

		/****************** getAll ******************/

		Set<SeasonVO> set = dao.getAll();
		for (SeasonVO sVO : set) {
			System.out.print(sVO.getSeasonID() + ", ");
			System.out.print(sVO.getSeasonName() + ", ");
			System.out.print(sVO.getSeasonBeginDate() + ", ");
			System.out.print(sVO.getSeasonEndDate() + ", ");
			System.out.print(sVO.getSignUpBegin() + ", ");
			System.out.print(sVO.getSignUpEnd() + ", ");
			System.out.print(sVO.getDescriptions());
			System.out.println();
		}

	}

}
