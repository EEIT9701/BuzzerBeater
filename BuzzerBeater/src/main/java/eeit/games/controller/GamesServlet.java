package eeit.games.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;
import eeit.locationinfo.model.LocationinfoVO;
import eeit.personaldata.model.PersonalDataVO;
import eeit.players.model.PlayersVO;
import eeit.season.model.SeasonService;
import eeit.season.model.SeasonVO;
import eeit.teams.model.TeamsVO;

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

		// ADD_GAME_JSON 接收JSON並新增賽事
		// INSERT_TEMP_SEASON 將session內的賽季整筆新增
		// DELETE_TEMP_SEASON 移除session內的賽季
		// PUT_FULL_SEASON 讀取EXCEL內的整筆賽季
		// GET_TEMP_EXCEL 以EXCEL取得session內的賽季及賽程
		// UPDATE_TEMP_EXCEL 更新session內的賽季及賽程
		// GET_GAMES_EXCEL 取得賽事EXCEL
		// ADD_GAME 新增賽事

		/********************************************************************/
		if ("GET_CALENDAR".equals(action)) {
			Integer seasonID = Integer.valueOf(request.getParameter("seasonID"));
			SeasonVO seasonVO = new SeasonService().findBySeasonID(seasonID);

			List<Object> list = new ArrayList<Object>();
			Map<String, Object> map = null;
			for (GroupsVO gvo : seasonVO.getGroupsSet()) {
				for (GamesVO vo : gvo.getGamesSet()) {
					map = new HashMap<String, Object>();
					map.put("title", vo.getTeamAVO().getTeamName() + " vs " + vo.getTeamBVO().getTeamName() + " 地點: "
							+ vo.getLocationinfoVO().getLocationName());
					map.put("start", vo.getGameBeginDate());
					map.put("end", vo.getGameEndDate());
					list.add(map);
				}
			}

			String jsonStr = new JSONArray(list).toString();

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.getWriter().println(jsonStr);
		}

		/********************************************************************/
		if ("ADD_GAME_JSON".equals(action)) {
			Integer gameID = Integer.valueOf(request.getParameter("gameID"));
			GamesService gsvc = new GamesService();
			GamesVO gamesVO = gsvc.findByGameID(gameID);
			Integer teamAID = gamesVO.getTeamAVO().getTeamID();
			Integer teamBID = gamesVO.getTeamBVO().getTeamID();

			JSONArray gameData = new JSONArray(request.getParameter("gameData"));
			gamesVO.setGameID(gameID);
			Integer teamAScore = 0;
			Integer teamBScore = 0;
			for (int i = 0; i < gameData.length(); i++) {
				JSONObject obj = gameData.getJSONObject(i);
				PersonalDataVO pvo = new PersonalDataVO();

				PlayersVO playersVO = new PlayersVO();
				playersVO.setPlayerID(Integer.valueOf(obj.getString("playerID")));
				pvo.setPlayersVO(playersVO);

				TeamsVO teamsVO = new TeamsVO();
				Integer teamID = Integer.valueOf(obj.getString("teamID"));
				teamsVO.setTeamID(teamID);
				pvo.setTeamsVO(teamsVO);

				pvo.setGameTime(Integer.valueOf(obj.getString("gameTime")));
				pvo.setTwoPoint(Integer.valueOf(obj.getString("twoPoint")));
				pvo.setTwoPointShot(Integer.valueOf(obj.getString("twoPointShot")));
				pvo.setThreePoint(Integer.valueOf(obj.getString("threePoint")));
				pvo.setThreePointShot(Integer.valueOf(obj.getString("threePointShot")));
				pvo.setFg(Integer.valueOf(obj.getString("fg")));
				pvo.setFgShot(Integer.valueOf(obj.getString("fgShot")));
				pvo.setOffReb(Integer.valueOf(obj.getString("offReb")));
				pvo.setDefReb(Integer.valueOf(obj.getString("defReb")));
				pvo.setAssist(Integer.valueOf(obj.getString("assist")));
				pvo.setSteal(Integer.valueOf(obj.getString("steal")));
				pvo.setBlocks(Integer.valueOf(obj.getString("blocks")));
				pvo.setTurnover(Integer.valueOf(obj.getString("turnover")));
				pvo.setPersonalFouls(Integer.valueOf(obj.getString("personalFouls")));
				pvo.setStartingPlayer(Integer.valueOf(obj.getString("startingPlayer")));

				Integer points = Integer.valueOf(obj.getString("twoPoint")) * 2
						+ Integer.valueOf(obj.getString("threePoint")) * 3 + Integer.valueOf(obj.getString("fg")) * 1;

				pvo.setPoints(points);

				if (teamID == teamAID) {
					teamAScore += points;
				} else if (teamID == teamBID) {
					teamBScore += points;
				}

				pvo.setGamesVO(gamesVO);
				gamesVO.getPersonalDataSet().add(pvo);
			}

			gamesVO.setTeamAScore(teamAScore);
			gamesVO.setTeamBScore(teamBScore);

			gsvc.updateWithPersonalData(gamesVO);

		}

		/********************************************************************/
		if ("INSERT_TEMP_SEASON".equals(action)) {
			HttpSession session = request.getSession();
			SeasonVO seasonVO = (SeasonVO) session.getAttribute("tempSeason");
			SeasonService svc = new SeasonService();
			svc.addFullSeason(seasonVO);

			session.removeAttribute("tempSeason");
			response.sendRedirect(
					request.getContextPath() + "/groups/groupList_back.jsp?seasonID=" + seasonVO.getSeasonID());
		}

		/********************************************************************/
		if ("DELETE_TEMP_SEASON".equals(action)) {
			request.getSession().removeAttribute("tempSeason");
			response.sendRedirect(request.getContextPath() + "/season/seasonList_back.jsp");
		}

		/********************************************************************/
		if ("PUT_FULL_SEASON".equals(action)) {
			// 取得上傳檔案並轉為資料流
			Part part = request.getPart("uploadExcel");
			FileInputStream fis = (FileInputStream) part.getInputStream();

			// 用此資料流建立workbook
			XSSFWorkbook workbook = new XSSFWorkbook(fis);

			// 讀取賽季資料
			XSSFRow seasonRow = workbook.getSheet("賽事").getRow(1);

			SeasonVO seasonVO = new SeasonVO();
			seasonVO.setSeasonName(seasonRow.getCell(0).toString());
			seasonVO.setSeasonBeginDate(Date.valueOf(seasonRow.getCell(1).toString().replaceAll("/", "-").trim()));
			seasonVO.setSeasonEndDate(Date.valueOf(seasonRow.getCell(2).toString().replaceAll("/", "-").trim()));
			seasonVO.setSignUpBegin(Timestamp.valueOf(seasonRow.getCell(3).toString().replaceAll("/", "-").trim()));
			seasonVO.setSignUpEnd(Timestamp.valueOf(seasonRow.getCell(4).toString().replaceAll("/", "-").trim()));

			XSSFRow groupRow = workbook.getSheet("分組").getRow(1);

			GroupsVO groupsVO = new GroupsVO();
			groupsVO.setGroupName(groupRow.getCell(0).toString());
			groupsVO.setMaxTeams(Integer.valueOf(groupRow.getCell(1).toString().replaceAll(".0", "")));
			groupsVO.setMinTeams(Integer.valueOf(groupRow.getCell(2).toString().replaceAll(".0", "")));
			groupsVO.setMaxPlayers(Integer.valueOf(groupRow.getCell(3).toString().replaceAll(".0", "")));
			groupsVO.setMinPlayers(Integer.valueOf(groupRow.getCell(4).toString().replaceAll(".0", "")));

			Set<Integer> currentTeams = new HashSet<Integer>();// 為了計算隊伍數量

			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss.0");

			XSSFSheet sheet = workbook.getSheet("分組");
			for (int i = 4; i < sheet.getPhysicalNumberOfRows() - 4; i++) {
				GamesVO gamesVO = new GamesVO();
				XSSFRow gameRow = sheet.getRow(i);

				XSSFCell cell0 = gameRow.getCell(0);
				String dat = date.format(DateUtil.getJavaDate(cell0.getNumericCellValue()));

				XSSFCell cell1 = gameRow.getCell(1);
				String begin = time.format(DateUtil.getJavaDate(cell1.getNumericCellValue()));
				Timestamp gameBeginDate = Timestamp.valueOf(dat + " " + begin);
				gamesVO.setGameBeginDate(gameBeginDate);

				XSSFCell cell2 = gameRow.getCell(2);
				String end = time.format(DateUtil.getJavaDate(cell2.getNumericCellValue()));
				Timestamp gameEndDate = Timestamp.valueOf(dat + " " + end);
				gamesVO.setGameEndDate(gameEndDate);

				String cell3 = gameRow.getCell(3).toString();
				LocationinfoVO locVO = new LocationinfoVO();
				locVO.setLocationID(Integer.valueOf(cell3.substring(cell3.indexOf("(") + 1, cell3.indexOf(")"))));
				locVO.setLocationName(cell3.substring(0, cell3.indexOf("(")).trim());
				gamesVO.setLocationinfoVO(locVO);

				String cell4 = gameRow.getCell(4).toString();
				TeamsVO teamAVO = new TeamsVO();
				Integer teamAID = Integer.valueOf(cell4.substring(cell4.indexOf("(") + 1, cell4.indexOf(")")));
				teamAVO.setTeamID(teamAID);
				teamAVO.setTeamName(cell4.substring(0, cell4.indexOf("(")).trim());
				gamesVO.setTeamAVO(teamAVO);
				currentTeams.add(teamAID);

				String cell5 = gameRow.getCell(5).toString();
				TeamsVO teamBVO = new TeamsVO();
				Integer teamBID = Integer.valueOf(cell5.substring(cell5.indexOf("(") + 1, cell5.indexOf(")")));
				teamBVO.setTeamID(teamBID);
				teamBVO.setTeamName(cell5.substring(0, cell5.indexOf("(")).trim());
				gamesVO.setTeamBVO(teamBVO);
				currentTeams.add(teamBID);

				gamesVO.setTeamAScore(0);
				gamesVO.setTeamBScore(0);

				gamesVO.setGroupsVO(groupsVO);
				groupsVO.getGamesSet().add(gamesVO);
			}

			groupsVO.setCurrentTeams(currentTeams.size());
			groupsVO.setSeasonVO(seasonVO);
			seasonVO.getGroupsSet().add(groupsVO);

			request.getSession().setAttribute("tempSeason", seasonVO);
			response.sendRedirect(request.getContextPath() + "/season/addSeason_temp.jsp");
		}

		/********************************************************************/
		if ("GET_TEMP_EXCEL".equals(action)) {

			// 創建excel
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("賽事資料");

			// 設定欄位文字樣式
			Font titleFont = workbook.createFont();
			titleFont.setColor(HSSFColor.BLACK.index); // 顏色黑色
			titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD); // 粗體
			titleFont.setFontHeightInPoints((short) 16); // 字體大小
			titleFont.setFontName("微軟正黑體"); // 字型

			// 設定欄位樣式
			CellStyle titleStyle = workbook.createCellStyle();
			// titleStyle.setFillForegroundColor(HSSFColor.AQUA.index); // 填滿顏色
			// titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); //
			// 填滿顏色
			titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平置中
			titleStyle.setFont(titleFont); // 設定文字樣式
			titleStyle.setBorderBottom((short) 1); // 設定框線
			titleStyle.setBorderLeft((short) 1);
			titleStyle.setBorderRight((short) 1);
			titleStyle.setBorderTop((short) 1);

			// 設定表格內容文字樣式
			Font cellFont = workbook.createFont();
			cellFont.setFontHeightInPoints((short) 14);
			cellFont.setFontName("微軟正黑體"); // 字型

			// 設定表格內容樣式
			CellStyle cellStyle = workbook.createCellStyle();
			// cellStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index); //
			// 填滿顏色
			// cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); // 填滿顏色
			cellStyle.setFont(cellFont); // 設定文字樣式
			cellStyle.setBorderBottom((short) 1); // 設定框線
			cellStyle.setBorderLeft((short) 1);
			cellStyle.setBorderRight((short) 1);
			cellStyle.setBorderTop((short) 1);

			// 設置欄位名稱
			HSSFRow titleRow = sheet.createRow(0); // 產生row(橫排)
			String[] column = { "賽事日期", "開始時間", "結束時間", "比賽地點", "主隊", "客隊" };

			for (int i = 0; i < column.length; i++) {
				HSSFCell cell = titleRow.createCell(i); // Cell == 儲存格
				cell.setCellValue(column[i]);
				cell.setCellStyle(titleStyle);
			}

			// 取得session內資料
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			List<Map<String, String>> gameSchedule = (List<Map<String, String>>) session.getAttribute("gameSchedule");

			// 設置表格內容
			int rowNum = 1;
			for (Map<String, String> map : gameSchedule) {
				HSSFRow row = sheet.createRow(rowNum);

				HSSFCell cell0 = row.createCell(0);
				cell0.setCellValue(map.get("date").replace("-", "/"));
				cell0.setCellStyle(cellStyle);

				HSSFCell cell1 = row.createCell(1);
				cell1.setCellValue(map.get("beginTime"));
				cell1.setCellStyle(cellStyle);

				HSSFCell cell2 = row.createCell(2);
				cell2.setCellValue(map.get("endTime"));
				cell2.setCellStyle(cellStyle);

				HSSFCell cell3 = row.createCell(3);
				cell3.setCellValue(map.get("locationName") + " (" + map.get("locationID") + ")");
				cell3.setCellStyle(cellStyle);

				HSSFCell cell4 = row.createCell(4);
				cell4.setCellValue(map.get("teamAName") + " (" + map.get("teamAID") + ")");
				cell4.setCellStyle(cellStyle);

				HSSFCell cell5 = row.createCell(5);
				cell5.setCellValue(map.get("teamBName") + " (" + map.get("teamBID") + ")");
				cell5.setCellStyle(cellStyle);

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
		}

		/********************************************************************/
		if ("UPDATE_TEMP_EXCEL".equals(action)) {
			// 取得上傳檔案並轉為資料流
			Part part = request.getPart("uploadExcel");
			FileInputStream fis = (FileInputStream) part.getInputStream();

			// 用此資料流建立workbook
			HSSFWorkbook workbook = new HSSFWorkbook(fis);

			// 取得第一個工作表
			HSSFSheet sheet = workbook.getSheetAt(0);

			List<Map<String, String>> gameSchedule = new ArrayList<Map<String, String>>();
			Map<String, String> map = null;

			// 取得所有row
			for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {
				HSSFRow row = sheet.getRow(i);

				if (i == 0) {
					continue; // 為了跳過標題列
				}

				map = new HashMap<String, String>();

				// 讀取cell內容存入session
				String cell0 = row.getCell(0).toString().replaceAll("/", "-");
				map.put("date", cell0);

				String cell1 = row.getCell(1).toString();
				map.put("beginTime", cell1);

				String cell2 = row.getCell(2).toString();
				map.put("endTime", cell2);

				String cell3 = row.getCell(3).toString();
				map.put("locationName", cell3.substring(0, cell3.indexOf("(")).trim());
				map.put("locationID", cell3.substring(cell3.indexOf("(") + 1, cell3.indexOf(")")));

				String cell4 = row.getCell(4).toString();
				map.put("teamAName", cell4.substring(0, cell4.indexOf("(")).trim());
				map.put("teamAID", cell4.substring(cell4.indexOf("(") + 1, cell4.indexOf(")")));

				String cell5 = row.getCell(5).toString();
				map.put("teamBName", cell5.substring(0, cell5.indexOf("(")).trim());
				map.put("teamBID", cell5.substring(cell5.indexOf("(") + 1, cell5.indexOf(")")));

				gameSchedule.add(map);
			}

			request.getSession().setAttribute("gameSchedule", gameSchedule);

			response.sendRedirect(request.getContextPath() + "/games/showSchedule.jsp#teamList");
		}

		/********************************************************************/
		if ("ADD_GAME".equals(action)) {
			HttpSession session = request.getSession();
			Integer groupID = (Integer) session.getAttribute("groupID");
			@SuppressWarnings("unchecked")
			List<Map<String, String>> gameSchedule = (List<Map<String, String>>) session.getAttribute("gameSchedule");

			GamesService gameSvc = new GamesService();
			for (Map<String, String> game : gameSchedule) {
				Integer locationID = Integer.valueOf(game.get("locationID"));
				Integer teamAID = Integer.valueOf(game.get("teamAID"));
				Integer teamBID = Integer.valueOf(game.get("teamBID"));
				String date = game.get("date");
				Timestamp gameBeginDate = Timestamp.valueOf(date + " " + game.get("beginTime") + ":00");
				Timestamp gameEndDate = Timestamp.valueOf(date + " " + game.get("endTime") + ":00");

				gameSvc.addGames(groupID, locationID, teamAID, 0, teamBID, 0, gameBeginDate, gameEndDate);
			}

			session.removeAttribute("groupID");
			session.removeAttribute("gameSchedule");
			response.sendRedirect(request.getContextPath() + "/games/gameList_back.jsp?groupID=" + groupID);
		}

		/********************************************************************/
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
				request.setAttribute("groupID", groupID);

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

					// 將資料寫入表格
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

				// 若無錯誤才將剛剛紀錄的比賽刪除
				for (Integer gameID : gameIDList) {
					gSvc.delete(gameID);
				}

				response.setContentType("text/html; charset=UTF-8");
				response.sendRedirect(request.getContextPath() + "/Games.do?action=GET_GAMES&groupID=" + groupID);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/games/gameList.jsp");
				failureView.forward(request, response);
			}
		}

		/********************************************************************/
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
				titleFont.setFontHeightInPoints((short) 16); // 字體大小
				titleFont.setFontName("微軟正黑體"); // 字型

				// 設定欄位樣式
				CellStyle titleStyle = workbook.createCellStyle();
				// titleStyle.setFillForegroundColor(HSSFColor.AQUA.index); //
				// 填滿顏色
				// titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); //
				// 填滿顏色
				titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平置中
				titleStyle.setFont(titleFont); // 設定文字樣式
				titleStyle.setBorderBottom((short) 1); // 設定框線
				titleStyle.setBorderLeft((short) 1);
				titleStyle.setBorderRight((short) 1);
				titleStyle.setBorderTop((short) 1);

				// 設定表格內容文字樣式
				Font cellFont = workbook.createFont();
				cellFont.setFontHeightInPoints((short) 14);
				cellFont.setFontName("微軟正黑體"); // 字型

				// 設定表格內容樣式
				CellStyle cellStyle = workbook.createCellStyle();
				// cellStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
				// // 填滿顏色
				// cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); //
				// 填滿顏色
				cellStyle.setFont(cellFont); // 設定文字樣式
				cellStyle.setBorderBottom((short) 1); // 設定框線
				cellStyle.setBorderLeft((short) 1);
				cellStyle.setBorderRight((short) 1);
				cellStyle.setBorderTop((short) 1);

				// 設置欄位名稱
				HSSFRow titleRow = sheet.createRow(0); // 產生row(橫排)
				String[] column = { "比賽開始時間", "比賽結束時間", "地點", "主隊", "比數", "客隊" };

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
					cell4.setCellValue(gamesVO.getTeamAScore() + "-" + gamesVO.getTeamBScore());
					cell4.setCellStyle(cellStyle);

					HSSFCell cell5 = row.createCell(5);
					cell5.setCellValue(
							gamesVO.getTeamBVO().getTeamName() + " (" + gamesVO.getTeamBVO().getTeamID() + ")");
					cell5.setCellStyle(cellStyle);

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
		}

	}

}
