package eeit.gamemedia.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import eeit.gamemedia.model.GameMediaService;
import eeit.gamemedia.model.GameMediaVO;
import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;


@WebServlet("/GameMedia.do")
@MultipartConfig(location = "C:\\TeamProject\\Repository\\BuzzerBeater\\BuzzerBeater\\src\\main\\webapp\\videos",maxFileSize=1000*1024*1024,maxRequestSize=1000*1024*1024,fileSizeThreshold=1000*1024*1024)
public class GameMediaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings("null")
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		GroupsService groupSvc = new GroupsService();
		GamesService gameSvc = new GamesService();
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			GameMediaService gameMediaSvc = new GameMediaService();
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
		
		if ("getOnePhotoForDisplay".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			GameMediaService gameMediaSvc = new GameMediaService();
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
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOnePhoto.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOnePhoto.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOnePhoto.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("gameMediaVO", gameMediaVO); // 資料庫取出的gameMediaVO物件,存入req
				String url = "/gamemedia/displayOnePhoto.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/displayOnePhoto.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if("getOneForUpdate".equals(action)){
			
			Integer mediaID = new Integer(req.getParameter("mediaID"));
			GameMediaService gameMediaSvc = new GameMediaService();
			GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
			
			req.setAttribute("gameMediaVO", gameMediaVO);
			
			String url = "/gamemedia/displayOneVideo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if("getOnePhotoForUpdate".equals(action)){
			
			Integer mediaID = new Integer(req.getParameter("mediaID"));
			GameMediaService gameMediaSvc = new GameMediaService();
			GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
			
			req.setAttribute("gameMediaVO", gameMediaVO);
			
			String url = "/gamemedia/displayOnePhoto.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("searchTag".equals(action)){
			String tag = "%"+req.getParameter("tag")+",%";
			GameMediaService gameMediaSvc = new GameMediaService();
			List<GameMediaVO> list = gameMediaSvc.tagFunction(tag);
			
			List<HashMap<String,Object>> returnlist = new ArrayList<HashMap<String, Object>>();
			Map<String, Object> map = null;
			
			for(GameMediaVO gameMediaVO:list){
				
				String[] tag1 = gameMediaVO.getTag().split(",");
				
				map = new HashMap<String,Object>();
				map.put("groupName", gameMediaVO.getGamesVO().getGroupsVO().getGroupName());
				map.put("teamA", gameMediaVO.getGamesVO().getTeamAVO().getTeamName());
				map.put("teamB", gameMediaVO.getGamesVO().getTeamBVO().getTeamName());
				map.put("gameID",gameMediaVO.getGamesVO().getGameID().toString());
				map.put("mediaID",gameMediaVO.getMediaID().toString());
				map.put("mediasName",gameMediaVO.getMediasName());
				map.put("gameVideo",gameMediaVO.getGameVideo());
				map.put("gamePhoto",gameMediaVO.getGamePhoto());
				map.put("mediaType",gameMediaVO.getMediaType());
				map.put("mediaDate",gameMediaVO.getMediaDate().toString());
				map.put("descriptions",gameMediaVO.getDescriptions());
				map.put("tag", tag1);
				
				returnlist.add((HashMap<String, Object>) map);
			}
			
			Gson gson = new Gson();
			String jsonList = gson.toJson(returnlist); 
			
            PrintWriter out = res.getWriter();
			out.println(jsonList);
			
		}
		
		if ("Update".equals(action)) { // 來自listAllEmp.jsp的請求
			
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			
			String tag1 = req.getParameter("tag")+",";
			Integer mediaID = Integer.valueOf(req.getParameter("mediaID"));
			String title = req.getParameter("title");
			String descriptions1 = req.getParameter("descriptions");
			//JSONObject gVO = new JSONObject(jsonString);
			//================================================		
			GameMediaService gameMediaSvc = new GameMediaService();
			GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
			Integer gameID = gameMediaVO.getGamesVO().getGameID();
			String mediasName = title;
			String gameVideo = gameMediaVO.getGameVideo();
			String gamePhoto = gameMediaVO.getGamePhoto();
			String mediaType = gameMediaVO.getMediaType();
			Timestamp mediaDate = new Timestamp(System.currentTimeMillis());
			String descriptions = descriptions1;
			String tag = tag1;
				
				
			gameMediaSvc.updateGameMedia(gameID, mediaID,mediasName,gameVideo,gamePhoto,mediaType,mediaDate,descriptions,tag);				
				
//			GameMediaVO gameMediaVO = gameMediaSvc.getOneGameMedia(mediaID);
				
//			ObjectMapper jsonMapper = new ObjectMapper();
//	        String jsonString = jsonMapper.writeValueAsString(gameMediaVO); 
			
			return;	
//			req.setAttribute("gameMediaVO", gameMediaVO);         // 資料庫取出的gameMediaVO物件,存入req
//			String url = "/gamemedia/displayOneVideo.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);
//			successView.forward(req, res);

//	        PrintWriter out = res.getWriter();
//			out.println(jsonString);
//	         
		}
		
		if ("getAll".equals(action)) {
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			
			GameMediaService gameMediaSvc = new GameMediaService();
			//String jsonList = JSONValue.toJSONString(gameMediaSvc.getAllInJsonForm());
			Gson gson = new Gson();
			String jsonList = gson.toJson(gameMediaSvc.getAllInJsonForm());
			
			PrintWriter out = res.getWriter();
			out.println(jsonList);
			
//			HttpSession session = req.getSession();
//			session.setAttribute("jsonList", jsonList);    // 資料庫取出的list物件,存入session
//			// Send the Success view
//			String url = "/gamemedia/video.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);  // 成功轉交listAllEmp2_getFromSession.jsp
//			successView.forward(req, res);
			return;
		}
		
		if ("getOneForJSON".equals(action)) {
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			
			GameMediaService gameMediaSvc = new GameMediaService();
			Integer mediaID = new Integer(req.getParameter("mediaID"));
			//String jsonList = JSONValue.toJSONString(gameMediaSvc.getAllInJsonForm());
			//Gson gson = new Gson();
			//String jsonList = gson.toJson(gameMediaSvc.getOneInJsonForm(mediaID));
			ObjectMapper jsonMapper = new ObjectMapper();
            String jsonString = jsonMapper.writeValueAsString(gameMediaSvc.getAllInJsonForm()); 
			
			PrintWriter out = res.getWriter();
			out.println(jsonString);
			return;
		}
		
		if("cancel".equals(action)){
			String url = "/BuzzerBeater/gamemedia/photoBackEnd.jsp";
			res.sendRedirect(url);
			
		}
		
		if ("uploadVideo".equals(action)){
			
			GameMediaService gameMediaSvc = new GameMediaService();
			List<GameMediaVO> gameVideoAmount = gameMediaSvc.getAllVideo();
			int count = (gameVideoAmount.size()+8);
			String gameVideo = "";
			gameVideo = String.format("%03d", (count+1))+".mp4";
			
			//getPart()方法是getParameter()的檔案版
			try{
				Part part = req.getPart("upload_file");
				String fileName = gameVideo;
//				System.out.println(part.getSize());
//				System.out.println(req.getServletContext().getRealPath("")+"\\videos\\"+fileName);
//				System.out.println(req.getSession().getServletContext().getRealPath("")+"\\videos\\"+fileName);
//				System.out.println(req.getServletContext());
//				System.out.println(req.getServletPath());
				FileOutputStream fos=new FileOutputStream(req.getSession().getServletContext().getRealPath("")+"\\videos\\"+fileName);
				InputStream is= part.getInputStream();

				int data=0;
				while((data=is.read())!=-1){
					fos.write(data);
				}
				fos.flush();
				fos.close();
				//part.write(fileName);
				
				
//				if(!part.getName().equals("")){
//					File video = new File(req.getServletContext().getRealPath("")+"\\videos", part.getName());
//					video.getParentFile().mkdirs();
//					
//					InputStream ins = part.getInputStream();
//					OutputStream ous = new FileOutputStream(video);
//					System.out.println(video);
//					byte[] temp = new byte[1024];
//					int len = -1;
//
//					while ((len = ins.read(temp)) != -1) {
//						ous.write(temp, 0, len);
//					}
//
//					ous.close();
//					ins.close();
//					
//					res.getWriter().println(video);
//				}
				
			}catch(Exception e){
				e.printStackTrace();
				
			}
		}

        if ("insertVideo".equals(action)) {   
			
			Integer gameID = Integer.valueOf(req.getParameter("gameID"));
			String mediasName = req.getParameter("mediasName");
			GameMediaService gameMediaSvc = new GameMediaService();
			
			List<GameMediaVO> gameVideoAmount = gameMediaSvc.getAllVideo();
			int count = (gameVideoAmount.size()+8);
	
				
			String base64 = req.getParameter("gamePhoto");
			String photo = base64.substring(base64.lastIndexOf(",")+1);
			String mediaType = "video";
			Timestamp mediaDate = new Timestamp(System.currentTimeMillis());
			String descriptions = req.getParameter("descriptions");
			String tag = req.getParameter("tag")+",";
			String gameVideo = "";
			gameVideo = String.format("%03d", (count+1))+".mp4";
			
			
			
			
				/***************************2.開始新增資料***************************************/
				gameMediaSvc.insertGameMedia(gameID, mediasName, gameVideo, photo, mediaType, mediaDate, descriptions, tag);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				String url = "/gamemedia/videoBackEnd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); 
//				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/addGameMedia.jsp");
//				failureView.forward(req, res);
//			}
		}
		if ("findGroupNameBySeasonID".equals(action)){
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			
			Integer seasonID = new Integer(req.getParameter("seasonID"));
			
			List<GroupsVO> list = groupSvc.findBySeasonID(seasonID);
			List<HashMap<String,String>> returnlist = new ArrayList<HashMap<String, String>>();
			Map<String,String> map = null;

			
			for(GroupsVO groupsVO:list){
				map = new HashMap<String,String>();
				map.put("groupID", groupsVO.getGroupID().toString());
				map.put("seasonID", groupsVO.getSeasonVO().getSeasonID().toString());
				map.put("groupName", groupsVO.getGroupName());
				map.put("maxTeams", groupsVO.getMaxTeams().toString());
				map.put("minTeams", groupsVO.getMinTeams().toString());
				map.put("currentTeams", groupsVO.getCurrentTeams().toString());
				map.put("maxPlayers", groupsVO.getMaxPlayers().toString());
				map.put("minPlayers", groupsVO.getMinPlayers().toString());
				
				returnlist.add((HashMap<String, String>) map);
			}
			
			
			Gson gson = new Gson();
			String jsonList = gson.toJson(returnlist); 
			
			
            PrintWriter out = res.getWriter();
			out.println(jsonList);
			
			
		}
		
		if ("getGameInformation".equals(action)){
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			
			gameSvc = new GamesService();
			Integer groupID = Integer.valueOf(req.getParameter("groupID"));
			
			List<GamesVO> list = gameSvc.findByGroupID(groupID);
			
			List<HashMap<String,String>> returnlist = new ArrayList<HashMap<String, String>>();
			Map<String,String> map = null;
			
			for(GamesVO gamesVO:list){
				map = new HashMap<String,String>();
				map.put("gameID", gamesVO.getGameID().toString());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				map.put("gameBeginDate", (gamesVO.getGameBeginDate() != null) ? sdf.format(gamesVO.getGameBeginDate()) : " ");
				map.put("teamA", gamesVO.getTeamAVO().getTeamName());
				map.put("teamB", gamesVO.getTeamBVO().getTeamName());
				
				returnlist.add((HashMap<String, String>) map);
			}
			
			Gson gson = new Gson();
			String jsonString = gson.toJson(returnlist); 
			
			PrintWriter out = res.getWriter();
			out.println(jsonString);
		}
		
		if ("delete".equals(action)) {
			
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("content-type", "text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
						
			/***************************1.接收請求參數***************************************/
			
			Integer mediaID = Integer.valueOf(req.getParameter("mediaID"));
			
			/***************************2.開始刪除資料***************************************/
			GameMediaService gameMediaSvc = new GameMediaService();
			gameMediaSvc.deleteGameMedia(mediaID);
			
			/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
			
			return;
			
		}
		
		if ("deletePhoto".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer mediaID = new Integer(req.getParameter("mediaID"));
				
				/***************************2.開始刪除資料***************************************/
				GameMediaService gameMediaSvc = new GameMediaService();
				gameMediaSvc.deleteGameMedia(mediaID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/gamemedia/photoBackEnd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/PhotoBackEnd.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
