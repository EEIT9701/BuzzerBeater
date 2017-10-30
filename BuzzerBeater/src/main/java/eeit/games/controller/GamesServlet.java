package eeit.games.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.json.simple.JSONValue;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;

@WebServlet("/Games.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class GamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GamesServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("UPLOAD_GAMES_EXCEL".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				// 取得上傳檔案轉為資料流
				Part part = request.getPart("uploadExcel");
				FileInputStream fis = (FileInputStream) part.getInputStream();

				// 用此資料流建立workbook
				HSSFWorkbook workbook = new HSSFWorkbook(fis);

				HSSFSheet sheet = workbook.getSheetAt(0);
				HSSFRow row;
				HSSFCell cell;

				Iterator<Row> rows = sheet.rowIterator();

				int i = 0;
				while (rows.hasNext()) {
					row = (HSSFRow) rows.next();
					
					if (i++ == 0) {
						continue; // 為了跳過標題列
					}

					Iterator<Cell> cells = row.cellIterator();
					while (cells.hasNext()) {
						cell = (HSSFCell) cells.next();

						if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
							System.out.print(cell.getStringCellValue() + " ");
						} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							System.out.print(cell.getNumericCellValue() + " ");
						} else {
							// Handle Boolean, Formula, Errors
						}
					}
					System.out.println();
				}
				System.out.println("共取得 " + (i - 1) + " 筆資料");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if ("GET_GAMES_EXCEL".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				// 取得回傳值 groupID
				Integer groupID = new Integer(request.getParameter("groupID"));

				// 根據groupID取得賽事資料
				GamesService gSvc = new GamesService();
				List<GamesVO> gamesList = gSvc.findByGroupID(groupID);

				// 創建excel
				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet sheet = workbook.createSheet("賽事資料");

				// 設定欄位文字樣式
				Font titleFont = workbook.createFont();
				titleFont.setColor(HSSFColor.BLACK.index); // 顏色黑色
				titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD); // 粗體
				titleFont.setFontHeightInPoints((short) 14); // 字體大小12點
				titleFont.setFontName("微軟正黑體"); // 字型

				// 設定欄位樣式
				CellStyle titleStyle = workbook.createCellStyle();
				titleStyle.setFont(titleFont); // 設定文字樣式
				titleStyle.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index); // 填滿顏色
				titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平置中
				titleStyle.setBorderBottom((short) 1); // 設定框線

				// 設定表格內容文字樣式
				Font cellFont = workbook.createFont();
				cellFont.setFontHeightInPoints((short) 12);
				cellFont.setFontName("微軟正黑體"); // 字型

				// 設定表格內容樣式
				CellStyle cellStyle = workbook.createCellStyle();
				cellStyle.setFont(cellFont); // 設定文字樣式

				// 設置欄位名稱
				HSSFRow titleRow = sheet.createRow(0); // 產生row(橫排)
				String[] column = { "比賽時間", "地點", "主隊", "比分", "客隊" };

				for (int i = 0; i < column.length; i++) {
					HSSFCell cell = titleRow.createCell(i); // Cell == 儲存格
					cell.setCellValue(column[i]);
					cell.setCellStyle(titleStyle);
				}

				// 設置表格內容
				int rowNum = 1;
				for (GamesVO vo : gamesList) {
					HSSFRow row = sheet.createRow(rowNum);

					HSSFCell cell0 = row.createCell(0);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					cell0.setCellValue(sdf.format(vo.getGameBeginDate()));
					cell0.setCellStyle(cellStyle);

					HSSFCell cell1 = row.createCell(1);
					cell1.setCellValue(vo.getLocationinfoVO().getLocationName());
					cell1.setCellStyle(cellStyle);

					HSSFCell cell2 = row.createCell(2);
					cell2.setCellValue(vo.getTeamAVO().getTeamName());
					cell2.setCellStyle(cellStyle);

					HSSFCell cell3 = row.createCell(3);
					cell3.setCellValue(vo.getTeamAScore().toString() + " - " + vo.getTeamBScore().toString());
					cell3.setCellStyle(cellStyle);

					HSSFCell cell4 = row.createCell(4);
					cell4.setCellValue(vo.getTeamBVO().getTeamName());
					cell4.setCellStyle(cellStyle);

					rowNum++;
				}

				// 設置全部欄位自動調整大小
				for (int i = 0; i < column.length; i++) {
					sheet.autoSizeColumn(i);
				}

				// 設定header
				response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
				response.setHeader("Content-Disposition",
						"attachment;filename=\"" + URLEncoder.encode("賽事資料.xls", "UTF-8") + "\"");

				// 回傳
				OutputStream out = response.getOutputStream();
				workbook.write(out);
				out.flush();
				out.close();
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/games/WebTemplate.jsp");
				failureView.forward(request, response);
			}
		}

		if ("GETALLGAMES".equals(action)) {
			GamesService gSvc = new GamesService();

			Set<GamesVO> set = gSvc.getAll();

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();

			String jsonString = JSONValue.toJSONString(set);
			out.println(jsonString);
		}

		if ("ADDGAME".equals(action)) {
			Integer groupID = (request.getParameter("groupID").equals("")) ? null
					: Integer.valueOf(request.getParameter("groupID"));
			Integer locationID = (request.getParameter("locationID").equals("")) ? null
					: Integer.valueOf(request.getParameter("locationID"));
			Integer teamAID = (request.getParameter("teamAID").equals("")) ? null
					: Integer.valueOf(request.getParameter("teamAID"));
			Integer teamAScore = (request.getParameter("teamAScore").equals("")) ? null
					: Integer.valueOf(request.getParameter("teamAScore"));
			Integer teamBID = (request.getParameter("teamBID").equals("")) ? null
					: Integer.valueOf(request.getParameter("teamBID"));
			Integer teamBScore = (request.getParameter("teamBScore").equals("")) ? null
					: Integer.valueOf(request.getParameter("teamBScore"));
			Integer winnerID = (request.getParameter("winnerID").equals("")) ? null
					: Integer.valueOf(request.getParameter("winnerID"));

			new Timestamp(System.currentTimeMillis());
			Timestamp gameBeginDate = (request.getParameter("gameBeginDate").equals("")) ? null
					: Timestamp.valueOf(request.getParameter("gameBeginDate"));
			Timestamp gameEndDate = (request.getParameter("gameEndDate").equals("")) ? null
					: Timestamp.valueOf(request.getParameter("gameEndDate"));

			GamesService gSvc = new GamesService();

			gSvc.addGames(groupID, locationID, teamAID, teamAScore, teamBID, teamBScore, winnerID, gameBeginDate,
					gameEndDate);
		}
	}

}
