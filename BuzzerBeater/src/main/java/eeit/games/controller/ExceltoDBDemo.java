package eeit.games.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ExceltoDBDemo {

	public static void main(String[] args) throws SQLException, IOException {
		// 資料庫
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=jdbc";
		// SQL指令
		String qry = "INSERT INTO employee values(?,?,?,?,?,?)";
		// 輸入路徑
		String path = "C://test.xls";

		FileInputStream fis = new FileInputStream(path);
		POIFSFileSystem fs = new POIFSFileSystem(fis);
		HSSFWorkbook workbook = new HSSFWorkbook(fs);

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");

			// 取得Excel第一個sheet(從0開始)
			HSSFSheet sheet = workbook.getSheet("employee");

			HSSFCell cell;

			// 欄位名稱(不用回傳、可做check)
			HSSFRow title = sheet.getRow(0);
			for (int i = 0; i < title.getPhysicalNumberOfCells(); i++) {
				System.out.print(title.getCell(i) + " | ");
			}
			System.out.println();

			//
			PreparedStatement stmt = conn.prepareStatement(qry);
			int insertStat = 0;
			// getPhysicalNumberOfRows這個比較好
			for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
				// 由於第 0 Row 為 title, 故 i 從 1 開始
				HSSFRow row = sheet.getRow(i); // 取得第 i Row
				if (row != null) {
					int j = 0;
					for (; j < row.getPhysicalNumberOfCells(); j++) { // 看資料需要的欄數
						cell = row.getCell(j);// 取出儲存格的值
						System.out.print(cell.toString() + " | ");
						stmt.setString(j + 1, cell.toString());
					}
					// 執行
					insertStat += stmt.executeUpdate();
				}
				System.out.println();
			}
			System.out.println("insert " + insertStat);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}

	}

}
