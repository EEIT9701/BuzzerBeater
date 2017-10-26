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

public class InsersTeamPhoto {

	public static void main(String[] args) {

		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballDB";
		String user = "sa";
		String pswd = "P@ssw0rd";
		
		String path = "Team Photo";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			// 取得連線
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pswd);

			// 取得查詢字串
			pstmt = conn.prepareStatement("update Teams SET teamBadge=? where teamName=?");

		

				// 取得資料夾內所有檔案
				File[] photoPath = new File(path).listFiles();
				
				for (File photo : photoPath) {
                     
					// 取得所有.jpg檔案
					if (photo.toString().contains(".png")) {

						// 轉成Base64編碼
						FileInputStream in = new FileInputStream(photo);
						byte[] bt = IOUtils.toByteArray(in);
						java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();

						// 取得球員姓名(檔案名稱)
						String fileName = photo.toString();
						String teamName = fileName.substring((fileName.lastIndexOf("\\")) + 1,
								fileName.lastIndexOf("."));

						// 放入查詢參數
						pstmt.setString(1, encoder.encodeToString(bt));
						pstmt.setString(2, teamName);

						// 開始查詢
						count += pstmt.executeUpdate();
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
