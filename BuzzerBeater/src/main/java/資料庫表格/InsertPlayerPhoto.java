package 資料庫表格;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

public class InsertPlayerPhoto {

	public static void main(String[] args) {

		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
		String user = "sa";
		String pswd = "P@ssw0rd";
		
		String path = "Player Photo";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			// 取得連線
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);

			// 取得查詢字串
			pstmt = conn.prepareStatement("update Players SET photo=? where playerName=?");

			// 取得路徑底下所有檔案(第一層資料夾)
			File[] photoPath = new File(path).listFiles();

			for (File photoFile : photoPath) {

				// 取得資料夾內所有檔案
				File[] arrPhoto = new File(photoFile.toString()).listFiles();

				for (File photo : arrPhoto) {

					// 取得所有.jpg檔案
					if (photo.toString().contains(".jpg")) {

						// 轉成Base64編碼
						FileInputStream in = new FileInputStream(photo);
						byte[] bt = IOUtils.toByteArray(in);
						java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();

						// 取得球員姓名(檔案名稱)
						String fileName = photo.toString();
						String playerName = fileName.substring((fileName.lastIndexOf("\\")) + 1,
								fileName.lastIndexOf("."));

						// 放入查詢參數
						pstmt.setString(1, encoder.encodeToString(bt));
						pstmt.setString(2, playerName);

						// 開始查詢
						count += pstmt.executeUpdate();
					}
				}
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				System.out.println("已更新 " + count + " 筆資料");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
