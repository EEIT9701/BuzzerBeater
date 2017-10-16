package eeit.gamemedia.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eeit.gamemedia.model.GameMediaService;
import eeit.gamemedia.model.GameMediaVO;




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
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/video.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/video.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				GameMediaService GameMediaSvc = new GameMediaService();
				GameMediaVO gameMediaVO = GameMediaSvc.getOneGameMedia(gameID);
				if (gameMediaVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/video.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("gameMediaVO", gameMediaVO); // 資料庫取出的gameMediaVO物件,存入req
				String url = "/gamemedia/video.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/video.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer gameID = new Integer(req.getParameter("gameID"));
				
				/***************************2.開始查詢資料****************************************/
				GameMediaService GameMediaSvc = new GameMediaService();
				GameMediaVO gameMediaVO = GameMediaSvc.getOneGameMedia(gameID);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("gameMediaVO", gameMediaVO);         // 資料庫取出的gameMediaVO物件,存入req
				String url = "/gamemedia/video.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/gamemedia/video.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getAll".equals(action)) {
			/***************************開始查詢資料 ****************************************/
			GameMediaService GameMediaSvc = new GameMediaService();
			List<GameMediaVO> list = GameMediaSvc.getAll();

			/***************************查詢完成,準備轉交(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // 資料庫取出的list物件,存入session
			// Send the Success view
			String url = "/gamemedia/video.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);  // 成功轉交listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}
		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer gameID = new Integer(req.getParameter("gameID").trim());
				String mediasName = req.getParameter("mediasName").trim();
				String gameVideo = req.getParameter("gameVideo").trim();
				/*不確定為何不能用Blob*/String gamePhoto = req.getParameter("gamePhoto").trim();
				String mediaType = req.getParameter("mediaType").trim();
				String descriptions = req.getParameter("descriptions").trim(); 
				String tag = req.getParameter("tag").trim();
				String tags[] = tag.split(",");
				
				Timestamp mediaDate = null;
				try {
					mediaDate = java.sql.Timestamp.valueOf(req.getParameter("mediaDate").trim());
				} catch (IllegalArgumentException e) {
					mediaDate=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				GameMediaVO gamemediaVO = new GameMediaVO();
				gamemediaVO.setGameID(gameID);
				gamemediaVO.setMediasName(mediasName);
				gamemediaVO.setGameVideo(gameVideo);
				gamemediaVO.setMediaType(mediaType);
				gamemediaVO.setDescriptions(descriptions);
				gamemediaVO.setTag(tag);
				gamemediaVO.setMediaDate(mediaDate);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("gamemediaVO", gamemediaVO); // 含有輸入格式錯誤的gamemediaVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				GameMediaService gameMediaSvc = new GameMediaService();
				gamemediaVO = gameMediaSvc.updateGameMedia(gameID,mediaID/*主鍵不用查詢?*/, mediasName, gameVideo, mediaType, descriptions,tag, mediaDate);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("gamemediaVO", gamemediaVO); // 資料庫update成功後,正確的的gamemediaVO物件,存入req
				String url = "/gamemedia/video.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/gamemedia/video.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String ename = req.getParameter("ename").trim();
				String job = req.getParameter("job").trim();
				
				java.sql.Date hiredate = null;
				try {
					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
				} catch (IllegalArgumentException e) {
					hiredate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				Double sal = null;
				try {
					sal = new Double(req.getParameter("sal").trim());
				} catch (NumberFormatException e) {
					sal = 0.0;
					errorMsgs.add("薪水請填數字.");
				}
				
				Double comm = null;
				try {
					comm = new Double(req.getParameter("comm").trim());
				} catch (NumberFormatException e) {
					comm = 0.0;
					errorMsgs.add("獎金請填數字.");
				}
				
				Integer deptno = new Integer(req.getParameter("deptno").trim());

				EmpVO empVO = new EmpVO();
				empVO.setEname(ename);
				empVO.setJob(job);
				empVO.setHiredate(hiredate);
				empVO.setSal(sal);
				empVO.setComm(comm);
				DeptVO deptVO = new DeptVO();
				deptVO.setDeptno(deptno);
				empVO.setDeptVO(deptVO);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				EmpService empSvc = new EmpService();
				empVO = empSvc.addEmp(ename, job, hiredate, sal, comm, deptno);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/emp/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer empno = new Integer(req.getParameter("empno"));
				
				/***************************2.開始刪除資料***************************************/
				EmpService empSvc = new EmpService();
				empSvc.deleteEmp(empno);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/emp/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
