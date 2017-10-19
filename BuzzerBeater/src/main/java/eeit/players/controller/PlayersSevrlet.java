package eeit.players.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.engine.jdbc.BinaryStream;

import eeit.players.model.PlayerService;
import eeit.players.model.PlayersVO;


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
		if("getOne_For_Display".equals(action)){
		
			/***************************1.接收請求參數****************************************/
			String playerName = req.getParameter("playerName");
			
			/***************************2.開始查詢資料****************************************/
			
			Set<PlayersVO> playersVO = playerSvc.getOnePlayer(playerName);
			
			/***************************3.查詢完成,準備轉交(Send the Success view)************/
//			 req.setAttribute("listOnePlayer", playerVO);        // 資料庫取出的empVO物件,存入req
			
			 req.setAttribute("playersVO", playersVO);
			 String url = "/players/listOnePlayer.jsp";
			 RequestDispatcher successView = req.getRequestDispatcher(url);
			 successView.forward(req, resp);

			/***************************其他可能的錯誤處理**********************************/
		
		}
		
		if("getOne_For_Update".equals(action)){
			
			String playerName = req.getParameter("playerName");
			
			
			Set<PlayersVO> playersVO = playerSvc.getOnePlayer(playerName);
			
			req.setAttribute("playersVO", playersVO);
			
			String url = "/players/updatePlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
			
		}
		if("update".equals(action)){
//			Set<String> errorMsgs = new LinkedHashSet<String>();
			Integer playerID = new Integer(req.getParameter("playerID"));
			String playerName = req.getParameter("playerName");
//			if(playerName == null||playerName.trim().length() == 0){
//				errorMsgs.add("球員姓名不可為空白");
//			}
//			String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}$";
//			if(!playerName.trim().matches(nameReg)){
//				errorMsgs.add("球員姓名必須為中、英文字母，且長度必需在2到10之間");
//			}
			
			String id = req.getParameter("id");
//			if(id == null||id.trim().length() == 0){
//				errorMsgs.add("身分證ID不可為空白");
//			}
//			String idReg = "^[A-Z]{1}\\d{9}$";
//			if(!id.trim().matches(idReg)){
//				errorMsgs.add("身分證第一碼必須為英為字母，後九碼必須為數字");
//			}
			Integer height = new Integer(req.getParameter("height")) ;
//			Integer height = null;
//			try{
//			height = (req.getParameter("height").trim()==null)?null:new Integer(req.getParameter("height").trim());
//			}catch(NumberFormatException e) {
//				errorMsgs.add("身高請填數字.");
//			}
//			if(height>=300||height<=100){
//				errorMsgs.add("請填入正確身高");
//			}
			
			
			Integer weights = new Integer(req.getParameter("weights"));
//			Integer weights = null;
//			try{
//				weights = (req.getParameter("weights").trim() == null)?null:new Integer(req.getParameter("weights").trim());
//			}catch(NumberFormatException e){
//				errorMsgs.add("體重請填數字.");
//			}
//			if(weights>=200||weights<=30){
//				errorMsgs.add("請填入正確體重");
//			}
			Date birthday = Date.valueOf(req.getParameter("birthday"));
			String nationality= req.getParameter("nationality");
//			if(!errorMsgs.isEmpty()){
//				req.setAttribute("errorMsgs", errorMsgs);
//				String url = "/players/updatePlayer.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, resp);
//			}
			 ByteArrayOutputStream swapStream = new ByteArrayOutputStream();  
		        byte[] buff = new byte[100];  
		        
		        InputStream inStream = req.getPart("photo").getInputStream();
		        int rc = 0;
		        while ((rc = inStream.read(buff, 0, 100)) > 0) {  
		            swapStream.write(buff, 0, rc);  
		        }  
		        byte[] photo = swapStream.toByteArray();
			
			
			
			
			playerSvc.updatePlayer(playerID, playerName, id, height, weights, birthday, nationality,photo);
			Set<PlayersVO> playersVO = playerSvc.getOnePlayer(playerName);
		
			ByteArrayInputStream in = new ByteArrayInputStream(photo);
			
			req.setAttribute("playersVO", playersVO);
			String url = "/players/listOnePlayer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
	}

	
}
