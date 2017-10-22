package eeit.locationinfo.model;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import org.apache.commons.io.IOUtils;

public class LocationinfoDAO_JDBC {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
	String user = "sa";
	String pswd = "P@ssw0rd";

	private static final String INSERT_STMT = "INSERT INTO locationinfo (locationName,locationAddr,locationMark,locationPhoto) VALUES(?,?,?,?)";

	public void addPhoto(LocationinfoVO locationinfoVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);
			pstmt = conn.prepareStatement(INSERT_STMT);

			pstmt.setString(1, locationinfoVO.getLocationName());
			pstmt.setString(2, locationinfoVO.getLocationAddr());
			pstmt.setString(3, locationinfoVO.getLocationMark());
			pstmt.setString(4, locationinfoVO.getLocationPhoto());
			pstmt.executeUpdate();

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
	}

	public static void main(String[] args) throws Exception {
		LocationinfoDAO_JDBC dao = new LocationinfoDAO_JDBC();

		LocationinfoVO locVO = new LocationinfoVO();
		locVO.setLocationName("圖片測試");
		locVO.setLocationAddr("addr");
		locVO.setLocationMark("mark");

		File file = new File("C:/Users/Night/Downloads/tomcat.gif");
		FileInputStream fis = new FileInputStream(file);
		byte[] bt = IOUtils.toByteArray(fis);
		Base64.Encoder encoder = Base64.getEncoder();
		String encodedText = encoder.encodeToString(bt);
		
		locVO.setLocationPhoto(encodedText);
		
		dao.addPhoto(locVO);
	}

}
