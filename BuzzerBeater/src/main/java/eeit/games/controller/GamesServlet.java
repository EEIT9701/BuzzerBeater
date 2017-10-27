package eeit.games.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.json.simple.JSONValue;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;

@WebServlet("/Games.do")
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
		System.out.println("action: " + action);

		if ("GET_GAMES_EXCEL".equals(action)) {
			// 取得回傳值 groupID
			Integer groupID = new Integer(request.getParameter("groupID"));

			// 根據groupID取得賽事資料
			GamesService gSvc = new GamesService();
			List<GamesVO> gamesList = gSvc.findByGroupID(groupID);

			// 創建excel
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("123");

			String[] column = { "比賽時間", "比賽地點", "主隊", "比分", "客隊" };

			// Row == 橫排欄位
			HSSFRow header = sheet.createRow(0);

			// 此迴圈產生欄位名稱
			for (int i = 0; i < column.length; i++) {
				// Cell == 儲存格
				HSSFCell cell = header.createCell(i);
				cell.setCellValue(column[i]);
			}

			int rowNum = 0;
			for (GamesVO vo : gamesList) {
				HSSFRow row = sheet.createRow(++rowNum);

				HSSFCell gameBeginDate = row.createCell(0);
				gameBeginDate.setCellValue(vo.getGameBeginDate());

				HSSFCell locationName = row.createCell(1);
				locationName.setCellValue(vo.getLocationinfoVO().getLocationName());

				HSSFCell teamAName = row.createCell(2);
				teamAName.setCellValue(vo.getTeamAVO().getTeamName());

				HSSFCell Score = row.createCell(3);
				Score.setCellValue(vo.getTeamAScore() + " - " + vo.getTeamBScore());

				HSSFCell teamBName = row.createCell(4);
				teamBName.setCellValue(vo.getTeamBVO().getTeamName());
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
