package eeit.games.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

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
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;

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

		if ("GET_GAMES".equals(action)) {
			Integer groupID = Integer.valueOf(request.getParameter("groupID"));
			GroupsService svc = new GroupsService();
			GroupsVO groupsVO = svc.findByGroupID(groupID);
			request.setAttribute("groupsVO", groupsVO);
			request.getRequestDispatcher("/games/gameList.jsp").forward(request, response);
		}

		if ("UPLOAD_GAMES_EXCEL".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				// 取得上傳檔案並轉為資料流
				Part part = request.getPart("uploadExcel");
				FileInputStream fis = (FileInputStream) part.getInputStream();

				// 用此資料流建立workbook
				HSSFWorkbook workbook = new HSSFWorkbook(fis);

				// 取得第一個工作表
				HSSFSheet sheet = workbook.getSheetAt(0);

				// 從工作表名稱取得groupID
				String sName = sheet.getSheetName();
				Integer groupID = Integer.valueOf(sName.substring(sName.indexOf("(") + 1, sName.indexOf(")")));

				// 取得該組比賽的所有gameID(等一下Excel資料新增成功才刪除)
				List<Integer> gameIDList = new ArrayList<Integer>();
				GamesService gSvc = new GamesService();
				for (GamesVO gamesVO : gSvc.findByGroupID(groupID)) {
					gameIDList.add(gamesVO.getGameID());
				}

				// 取得所有row
				for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {
					HSSFRow row = sheet.getRow(i);

					if (i == 0) {
						continue; // 為了跳過標題列
					}

					String cell0 = row.getCell(0).toString();
					Timestamp gameBeginDate = Timestamp.valueOf(cell0 + ":00");

					String cell1 = row.getCell(1).toString();
					Timestamp gameEndDate = Timestamp.valueOf(cell1 + ":00");

					String cell2 = row.getCell(2).toString();
					Integer locationID = Integer.valueOf(cell2.substring(cell2.indexOf("(") + 1, cell2.indexOf(")")));

					String cell3 = row.getCell(3).toString();
					Integer teamAID = Integer.valueOf(cell3.substring(cell3.indexOf("(") + 1, cell3.indexOf(")")));

					String cell4 = row.getCell(4).toString();
					Integer teamBID = Integer.valueOf(cell4.substring(cell4.indexOf("(") + 1, cell4.indexOf(")")));

					gSvc.addGames(groupID, locationID, teamAID, 0, teamBID, 0, gameBeginDate, gameEndDate);
				}

				for (Integer gameID : gameIDList) {
					gSvc.delete(gameID);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
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
				HSSFSheet sheet = workbook.createSheet("賽事資料 (" + groupID + ")");

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
				String[] column = { "比賽開始時間", "比賽結束時間", "地點", "主隊", "客隊" };

				for (int i = 0; i < column.length; i++) {
					HSSFCell cell = titleRow.createCell(i); // Cell == 儲存格
					cell.setCellValue(column[i]);
					cell.setCellStyle(titleStyle);
				}

				// 設置表格內容
				int rowNum = 1;
				for (GamesVO gamesVO : gamesList) {
					HSSFRow row = sheet.createRow(rowNum);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

					HSSFCell cell0 = row.createCell(0);
					cell0.setCellValue(sdf.format(gamesVO.getGameBeginDate()));
					cell0.setCellStyle(cellStyle);

					HSSFCell cell1 = row.createCell(1);
					cell1.setCellValue(sdf.format(gamesVO.getGameEndDate()));
					cell1.setCellStyle(cellStyle);

					HSSFCell cell2 = row.createCell(2);
					cell2.setCellValue(gamesVO.getLocationinfoVO().getLocationName() + " ("
							+ gamesVO.getLocationinfoVO().getLocationID() + ")");
					cell2.setCellStyle(cellStyle);

					HSSFCell cell3 = row.createCell(3);
					cell3.setCellValue(
							gamesVO.getTeamAVO().getTeamName() + " (" + gamesVO.getTeamAVO().getTeamID() + ")");
					cell3.setCellStyle(cellStyle);

					HSSFCell cell4 = row.createCell(4);
					cell4.setCellValue(
							gamesVO.getTeamBVO().getTeamName() + " (" + gamesVO.getTeamBVO().getTeamID() + ")");
					cell4.setCellStyle(cellStyle);

					rowNum++;
				}

				// 設置全部欄位自動調整大小
				for (int i = 0; i < column.length; i++) {
					sheet.autoSizeColumn(i);
				}

				GroupsService groupsSvc = new GroupsService();
				GroupsVO groupsVO = groupsSvc.findByGroupID(groupID);
				String groupName = groupsVO.getGroupName();
				String seasonName = groupsVO.getSeasonVO().getSeasonName();
				// 設定header
				response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
				response.setHeader("Content-Disposition", "attachment;filename=\""
						+ URLEncoder.encode(seasonName + "_" + groupName + "_賽事資料.xls", "UTF-8") + "\"");

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
			return;
		}

	}

}
