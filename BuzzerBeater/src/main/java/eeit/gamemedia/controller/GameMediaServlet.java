package eeit.gamemedia.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eeit.gamemedia.model.GameMediaService;
import eeit.gamemedia.model.GameMediaVO;
import eeit.games.model.GamesVO;
import eeit.players.model.PlayersVO;




@SuppressWarnings("serial")
@WebServlet("/GameMedia.do")
public class GameMediaServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		GameMediaService gameMediaSvc = new GameMediaService();
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("gameID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入賽事編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOneVideo.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer gameID = null;
				try {
					gameID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("賽事編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOneVideo.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				
				GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(gameID);
				if (gameMediaVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOneVideo.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("gameMediaVO", gameMediaVO); // 資料庫取出的gameMediaVO物件,存入req
				String url = "/gamemedia/displayOneVideo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOneVideo.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOneForUpdate".equals(action)){
			
			
			Integer mediaID = new Integer(req.getParameter("mediaID"));
			
			GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
			
			req.setAttribute("gameMediaVO", gameMediaVO);
			
			String url = "/gamemedia/displayOneVideo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer gameID = new Integer(req.getParameter("gameID"));
				Integer mediaID = new Integer(req.getParameter("mediaID")); 
				String mediasName = req.getParameter("mediasName");
				String gameVideo = req.getParameter("gameVideo");
				String gamePhoto = req.getParameter("gamePhoto");
				String mediaType = req.getParameter("mediaType");
				Timestamp mediaDate = new Timestamp(System.currentTimeMillis());
				String descriptions = req.getParameter("descriptions");
				String tag = req.getParameter("tag");
				
				
				
				gameMediaSvc.updateGameMedia(gameID, mediaID,mediasName,gameVideo,gamePhoto,mediaType,mediaDate,descriptions,tag);				
				
				GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
				
				
				req.setAttribute("gameMediaVO", gameMediaVO);         // 資料庫取出的gameMediaVO物件,存入req
				String url = "/gamemedia/displayOneVideo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOneVideo.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getAll".equals(action)) {
			/***************************開始查詢資料 ****************************************/
			
			List<GameMediaVO> list = gameMediaSvc.getAll();

			/***************************查詢完成,準備轉交(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // 資料庫取出的list物件,存入session
			// Send the Success view
			String url = "/gamemedia/video.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);  // 成功轉交listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}
		
		if ("getTopFour".equals(action)){
			
			List<GameMediaVO> list = gameMediaSvc.getAll();

			for(int i=0;i<4;i++){
				
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // 資料庫取出的list物件,存入session
			// Send the Success view
			String url = "/gamemedia/video.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);  // 成功轉交listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}
		
		
//		if ("update".equals(action)) { 
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//		
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				GamesVO gamesVO = new GamesVO();
//				
//				Integer gameID = new Integer(req.getParameter("gameID").trim());
//				String mediasName = req.getParameter("mediasName").trim();
//				String gameVideo = req.getParameter("gameVideo").trim();
//				String gamePhoto = req.getParameter("gamePhoto").toString().trim();
//				String mediaType = req.getParameter("mediaType").trim();
//				String descriptions = req.getParameter("descriptions").trim(); 
//				String tag = req.getParameter("tag").trim();
//								
//				Timestamp mediaDate = new Timestamp(System.currentTimeMillis()); 
//
//				GameMediaVO gamemediaVO = new GameMediaVO();
//				gamesVO.setGameID(gameID);
//				gamemediaVO.setMediasName(mediasName);
//				gamemediaVO.setGameVideo(gameVideo);
//				gamemediaVO.setMediaType(mediaType);
//				gamemediaVO.setDescriptions(descriptions);
//				gamemediaVO.setTag(tag);
//				gamemediaVO.setMediaDate(mediaDate);
//				
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("gamemediaVO", gamemediaVO); // 含有輸入格式錯誤的gamemediaVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/updateVideo.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
//				/***************************2.開始修改資料*****************************************/
//				GameMediaService gameMediaSvc = new GameMediaService();
//				gamemediaVO = gameMediaSvc.updateGameMedia(gameID,mediaID/*主鍵不用查詢?*/, mediasName, gameVideo, mediaType, descriptions,tag, mediaDate);
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("gamemediaVO", gamemediaVO); // 資料庫update成功後,正確的的gamemediaVO物件,存入req
//				String url = "/gamemedia/video.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/gamemedia/video.jsp");
//				failureView.forward(req, res);
//			}
//		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer gameID = null; 
				try{
					gameID = new Integer(req.getParameter("gameID"));
				}catch(NumberFormatException e){
					errorMsgs.add("賽事ID請輸入數字");
				}
				
				String mediasName = req.getParameter("mediasName");
				String gameVideo = req.getParameter("gameVideo");
				String gamePhoto = req.getParameter("gamePhoto");
				String mediaType = req.getParameter("mediaType");
				Timestamp mediaDate = new Timestamp(System.currentTimeMillis());
				String descriptions = req.getParameter("descriptions");
				String tag = req.getParameter("tag");
				
				GameMediaVO gameMediaVO = new GameMediaVO();
				GamesVO gamesVO = new GamesVO();   //GamesVO 所要傳的GameID是否有傳到?
				
				gamesVO.setGameID(gameID);
				gameMediaVO.setMediasName(mediasName);
				gameMediaVO.setGameVideo(gameVideo);
				gameMediaVO.setGamePhoto(gamePhoto);
				gameMediaVO.setMediaType(mediaType);
				gameMediaVO.setMediaDate(mediaDate);
				gameMediaVO.setDescriptions(descriptions);
				gameMediaVO.setTag(tag);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("gameMediaVO", gameMediaVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/addGameMedia.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				
				gameMediaVO = gameMediaSvc.insertGameMedia(gameID, mediasName, gameVideo, gamePhoto, mediaType, mediaDate, descriptions, tag);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/gamemedia/addGameMedia.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/addGameMedia.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer mediaID = new Integer(req.getParameter("mediaID"));
				
				/***************************2.開始刪除資料***************************************/
				
				gameMediaSvc.deleteGameMedia(mediaID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/gamemedia/videoBackEnd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/videoBackEnd.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
