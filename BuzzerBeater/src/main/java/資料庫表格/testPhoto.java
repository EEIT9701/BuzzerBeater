package 資料庫表格;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.io.IOUtils;
import org.bouncycastle.util.encoders.Base64;

public class testPhoto {

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pst = null;
		int count = 0;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=BasketBallDB", "sa",
					"P@ssw0rd");
			pst = con.prepareStatement("update Players SET photo=? where playerName=?");
			File playerPhotoPath = new File("C:/Users/Student/Desktop/playerPhoto");
			File[] fs = playerPhotoPath.listFiles();
			for (File photo : fs) {

				File playerTeamPath = new File(photo.toString());
				File[] teamPhoto = playerTeamPath.listFiles();
				for (File photo2 : teamPhoto) {
					if (photo2.toString().contains(".jpg")) {
						FileInputStream in = new FileInputStream(photo2);
						byte[] b = IOUtils.toByteArray(in);
						java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();
						pst.setString(1, encoder.encodeToString(b));
						pst.setString(2, photo2.toString().substring(photo2.toString().lastIndexOf("/") + 1,
								photo2.toString().lastIndexOf(".")));
						int i = pst.executeUpdate();
						count += i;
					}

				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				con.close();
				System.out.println(count);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
