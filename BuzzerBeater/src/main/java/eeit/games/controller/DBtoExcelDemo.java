package eeit.games.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class DBtoExcelDemo {

	public static void main(String[] args) throws SQLException, IOException {
		// 資料庫
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=jdbc";
		// SQL指令
		String qryStmt = "SELECT * FROM employee";
		// 輸出路徑
		String path = "C://test.xls";

		// Workbook == Excel檔案
		HSSFWorkbook workbook = new HSSFWorkbook();

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");

			PreparedStatement stmt = conn.prepareStatement(qryStmt);
			ResultSet rs = stmt.executeQuery();

			// 獲取Metadata
			ResultSetMetaData rsmd = rs.getMetaData();
			// 取得欄位數量
			int colCount = rsmd.getColumnCount();

			// Sheet == 工作表
			HSSFSheet sheet = workbook.createSheet("employee");

			// Row == 橫排欄位
			HSSFRow header = sheet.createRow(0);
			// 此迴圈產生欄位名稱
			for (int i = 0; i < colCount; i++) {
				// Cell == 儲存格
				HSSFCell cell = header.createCell(i);
				cell.setCellValue(rsmd.getColumnLabel(i + 1));
			}

			// 迴圈設定每個儲存格的資料
			int rowNum = 0;
			while (rs.next()) {
				rowNum++;
				HSSFRow row = sheet.createRow(rowNum);
				for (int i = 0; i < colCount; i++) {
					HSSFCell cell = row.createCell(i);
					cell.setCellValue(rs.getString(i + 1));
				}
			}

			// 將整個Workbook物件(Excel)輸出
			FileOutputStream out = new FileOutputStream(path);
			workbook.write(out);
			out.flush();
			out.close();
			System.out.println("Export success!!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}

	}

}
