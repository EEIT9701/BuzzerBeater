package 資料庫表格;

import java.io.*;
import java.sql.*;

import org.apache.commons.io.IOUtils;

public class InsertGameMediaPhoto {

	public static void main(String[] args) {
		
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=basketballdb";
		String user = "sa";
		String pswd = "P@ssw0rd";
		String path = "C:/TeamProject/Repository/BuzzerBeater/BuzzerBeater/src/main/java/資料庫表格/GameMedia Photo";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 6001;
		int count1 = 0;
		
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, pswd);
			pstmt = conn.prepareStatement("update GameMedia SET gamePhoto=? where mediaID=?");
			
			File[] photoPath = new File(path).listFiles();
			System.out.println(photoPath);
			
			for(File photo:photoPath){
				
				if(photo.toString().contains(".jpg")){
					FileInputStream fis = new FileInputStream(photo);
					byte[] bt = IOUtils.toByteArray(fis);
					java.util.Base64.Encoder encoder = java.util.Base64.getEncoder();
					
					pstmt.setString(1, encoder.encodeToString(bt));
					pstmt.setInt(2, count);
					
					count+=1;
					count1 += pstmt.executeUpdate();
				}
			}
			
			
			
		}catch(ClassNotFoundException | SQLException e){
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
				System.out.println("上傳"+count1+"筆照片成功");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
