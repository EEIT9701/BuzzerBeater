package eeit.players.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.players.model.PlayerService;
import eeit.players.model.PlayersVO;
import eeit.teamcomposition.model.TeamCompositionService;
import eeit.teamcomposition.model.TeamCompositionVO;
import eeit.teams.model.TeamsService;
import eeit.teams.model.TeamsVO;

@WebServlet("/Players.do")
@MultipartConfig
public class PlayersSevrlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("action: " + action);
		PlayerService playerSvc = new PlayerService();

		if ("getOne_For_Display".equals(action)) {

			/*************************** 1.接收請求參數 ****************************************/
			String playerName = req.getParameter("playerName");

			/*************************** 2.開始查詢資料 ****************************************/

			Set<PlayersVO> playersVO = playerSvc.getOnePlayerName(playerName);

			/***************************
			 * 3.查詢完成,準備轉交(Send the Success view)
			 ************/
			// req.setAttribute("listOnePlayer", playerVO); //
			// 資料庫取出的empVO物件,存入req

			req.setAttribute("playersVO", playersVO);
			String url = "/players/listOnePlayer_back.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);

			/*************************** 其他可能的錯誤處理 **********************************/

		}
		

		if ("insertMyPlayer".equals(action)) {
			String url = "/players/insertMyPlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
		
		if ("listMyPlayer".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			Integer playerNo = Integer.parseInt(req.getParameter("playerNo"));
			String playerRole = req.getParameter("playerRole");
			Double height = new Double(req.getParameter("height"));
			Double weights = new Double(req.getParameter("weights"));
			Date birthday = Date.valueOf(req.getParameter("birthday"));
			String nationality = req.getParameter("nationality");

			playerSvc.insertPlayer(playerName, id, height, weights, birthday, nationality, photo);
			TeamCompositionService tcsvc =new TeamCompositionService();
			
			TeamsService svc = new TeamsService();
			System.out.println(svc.findMaxID());
			System.out.println(playerSvc.findMaxID());
			tcsvc.insert(svc.findMaxID(), playerSvc.findMaxID(), playerNo, playerRole, new Timestamp(System.currentTimeMillis()),null);
			
			Integer teamID = Integer.valueOf(svc.findMaxID());
			System.out.println(teamID);
			TeamsService tsvc = new TeamsService();
			TeamsVO teamsVO = tsvc.findByID(teamID);
			
			System.out.println("123");
			for(TeamCompositionVO vo : teamsVO.getTeamCompositionSet()){
				System.out.print(vo.getPlayersVO().getPlayerName());
				System.out.println();
			}
			
			req.setAttribute("teamsVO", teamsVO);
			
			String url = "/players/listMyPlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);

		}
		if ("insertPlayer".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			String height = req.getParameter("height");
			String weights = req.getParameter("weights");
			String birthday = req.getParameter("birthday");
			String nationality = req.getParameter("nationality");

			req.setAttribute("photo", photo);
			req.setAttribute("playerName", playerName);
			req.setAttribute("id", id);
			req.setAttribute("height", height);
			req.setAttribute("weights", weights);
			req.setAttribute("birthday", birthday);
			req.setAttribute("nationality", nationality);

			String url = "/players/insertPlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);

		}
		if ("insertCheck".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			String height = req.getParameter("height");
			String weights = req.getParameter("weights");
			String birthday = req.getParameter("birthday");
			String nationality = req.getParameter("nationality");

			req.setAttribute("photo", photo);
			req.setAttribute("playerName", playerName);
			req.setAttribute("id", id);
			req.setAttribute("height", height);
			req.setAttribute("weights", weights);
			req.setAttribute("birthday", birthday);
			req.setAttribute("nationality", nationality);

			String url = "/players/insertCheck.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
		
		if ("insert".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			Double height = new Double(req.getParameter("height"));
			Double weights = new Double(req.getParameter("weights"));
			Date birthday = Date.valueOf(req.getParameter("birthday"));
			String nationality = req.getParameter("nationality");

			playerSvc.insertPlayer(playerName, id, height, weights, birthday, nationality, photo);
			String url = "/players/listAllPlayer_back.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}

		if ("updatePlayer".equals(action))

		{
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerID = req.getParameter("playerID");
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			Double height = new Double(req.getParameter("height"));
			Double weights = new Double(req.getParameter("weights"));
			String birthday = req.getParameter("birthday");
			String nationality = req.getParameter("nationality");

			req.setAttribute("photo", photo);
			req.setAttribute("playerID", playerID);
			req.setAttribute("playerName", playerName);
			req.setAttribute("id", id);
			req.setAttribute("height", height);
			req.setAttribute("weights", weights);
			req.setAttribute("birthday", birthday);
			req.setAttribute("nationality", nationality);

			String url = "/players/updatePlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);

		}

		if ("updateCheck".equals(action)) {
			// Set<String> errorMsgs = new LinkedHashSet<String>();
			String base64 = req.getParameter("photo");
			System.out.println(base64);
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			System.out.println(photo);
			String playerID = req.getParameter("playerID");
			;
			String playerName = req.getParameter("playerName");
			// if(playerName == null||playerName.trim().length() == 0){
			// errorMsgs.add("球員姓名不可為空白");
			// }
			// String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
			// if(!playerName.trim().matches(nameReg)){
			// errorMsgs.add("球員姓名必須為中、英文字母，且長度必需在2到10之間");
			// }

			String id = req.getParameter("id");
			// if(id == null||id.trim().length() == 0){
			// errorMsgs.add("身分證ID不可為空白");
			// }
			// String idReg = "^[A-Z]{1}\\d{9}$";
			// if(!id.trim().matches(idReg)){
			// errorMsgs.add("身分證第一碼必須為英為字母，後九碼必須為數字");
			// }
			Double height = new Double(req.getParameter("height"));
			// Integer height = null;
			// try{
			// height = (req.getParameter("height").trim()==null)?null:new
			// Integer(req.getParameter("height").trim());
			// }catch(NumberFormatException e) {
			// errorMsgs.add("身高請填數字.");
			// }
			// if(height>=300||height<=100){
			// errorMsgs.add("請填入正確身高");
			// }

			Double weights = new Double(req.getParameter("weights"));
			// Integer weights = null;
			// try{
			// weights = (req.getParameter("weights").trim() == null)?null:new
			// Integer(req.getParameter("weights").trim());
			// }catch(NumberFormatException e){
			// errorMsgs.add("體重請填數字.");
			// }
			// if(weights>=200||weights<=30){
			// errorMsgs.add("請填入正確體重");
			// }
			String birthday = req.getParameter("birthday");
			String nationality = req.getParameter("nationality");
			// if(!errorMsgs.isEmpty()){
			// req.setAttribute("errorMsgs", errorMsgs);
			// String url = "/players/updatePlayer.jsp";
			// RequestDispatcher successView = req.getRequestDispatcher(url);
			// successView.forward(req, resp);
			// }

			//
			// Set<PlayersVO> playersVO =
			// playerSvc.getOnePlayerName(playerName);

			req.setAttribute("photo", photo);
			req.setAttribute("playerID", playerID);
			req.setAttribute("playerName", playerName);
			req.setAttribute("id", id);
			req.setAttribute("height", height);
			req.setAttribute("weights", weights);
			req.setAttribute("birthday", birthday);
			req.setAttribute("nationality", nationality);
			String url = "/players/updateCheck.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}

		if ("update".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			Integer playerID = Integer.parseInt(req.getParameter("playerID"));
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			Double height = new Double(req.getParameter("height"));
			Double weights = new Double(req.getParameter("weights"));
			Date birthday = Date.valueOf(req.getParameter("birthday"));
			String nationality = req.getParameter("nationality");

			playerSvc.updatePlayer(playerID, playerName, id, height, weights, birthday, nationality, photo);
			String url = "/players/listAllPlayer_back.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}

		if ("goTolistAllPlayer_back".equals(action)) {
			String url = "/players/listAllPlayer_back.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
		
		if ("delete".equals(action)) {
			Integer playerID = Integer.parseInt(req.getParameter("playerID"));

			playerSvc.deletePlayer(playerID);
			String url = "/players/listAllPlayer_back.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
		
		if ("buildPlayer".equals(action)) {
			String base64 = req.getParameter("photo");
			String photo = base64.substring(base64.lastIndexOf(",") + 1);
			String playerName = req.getParameter("playerName");
			String id = req.getParameter("id");
			Integer playerNo = Integer.parseInt(req.getParameter("playerNo"));
			String playerRole = req.getParameter("playerRole");
			Double height = new Double(req.getParameter("height"));
			Double weights = new Double(req.getParameter("weights"));
			Date birthday = Date.valueOf(req.getParameter("birthday"));
			String nationality = req.getParameter("nationality");

			playerSvc.insertPlayer(playerName, id, height, weights, birthday, nationality, photo);
			TeamCompositionService tcsvc =new TeamCompositionService();
			
			TeamsService svc = new TeamsService();

			tcsvc.insert(svc.findMaxID(), playerSvc.findMaxID(), playerNo, playerRole, new Timestamp(System.currentTimeMillis()),null);
			

		}

	}
}
