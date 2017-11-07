package eeit.season.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONValue;

import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;
import eeit.season.model.SeasonService;
import eeit.season.model.SeasonVO;

@WebServlet("/Season.do")
public class SeasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 設定Request的編碼為"UTF-8"，必須在取得請求參數前設定才有用
		request.setCharacterEncoding("UTF-8");

		// 取得請求參數"action"，此為自行設定的回傳參數，判斷將要執行的動作
		String action = request.getParameter("action");

		// GET_ALL_SEASON 以JSON格式取得所有賽季
		//

		/********************************************************************/
		if ("GET_GROUP".equals(action)) {
			Integer seasonID = Integer.valueOf(request.getParameter("seasonID"));

			SeasonService svc = new SeasonService();
			SeasonVO seasonVO = svc.findBySeasonID(seasonID);

			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

			for (GroupsVO groupsVO : seasonVO.getGroupsSet()) {
				Map<String, Object> map = new HashMap<String, Object>();

				map.put("groupID", groupsVO.getGroupID().toString());
				map.put("groupName", groupsVO.getGroupName());

				list.add(map);
			}

			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(list);

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.getWriter().println(json);

		}


		/********************************************************************/
		if ("GET_ALL_SEASON".equals(action)) {

			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			// 取得Service的實例
			SeasonService sSvc = new SeasonService();

			// 轉換為JSON格式(最好轉為純String的List或Map)
			String jsonString = JSONValue.toJSONString(sSvc.getPureList());

			// 經由Response送往瀏覽器
			PrintWriter out = response.getWriter();
			out.println(jsonString);

			return;
		}

		/********************************************************************/
		if ("ADD_SEASON".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				HttpSession session = request.getSession();
				Map<String, Object> seasonVO = (Map<String, Object>) session.getAttribute("seasonVO");
				Set<GroupsVO> groupsSet = (Set<GroupsVO>) session.getAttribute("groupsSet");

				SeasonService sSvc = new SeasonService();

				String seasonName = (String) seasonVO.get("seasonName");
				Date seasonBeginDate = (Date) seasonVO.get("seasonBeginDate");
				Date seasonEndDate = (Date) seasonVO.get("seasonEndDate");
				Timestamp signUpBegin = (Timestamp) seasonVO.get("signUpBegin");
				Timestamp signUpEnd = (Timestamp) seasonVO.get("signUpEnd");
				String descriptions = (String) seasonVO.get("descriptions");

				Integer seasonID = sSvc.addSeason(seasonName, seasonBeginDate, seasonEndDate, signUpBegin, signUpEnd,
						descriptions);

				// 新增分組
				GroupsService gSvc = new GroupsService();
				for (GroupsVO gvo : groupsSet) {
					gSvc.addGroups(seasonID, gvo.getGroupName(), gvo.getMaxTeams(), gvo.getMinTeams(),
							gvo.getMaxPlayers(), gvo.getMinPlayers());
				}

				response.sendRedirect(request.getContextPath() + "/season/seasonList_back.jsp");

			} catch (Exception e) {

				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/season/addSeason.jsp");
				failureView.forward(request, response);
			}
			return;

		}

		/********************************************************************/
		if ("TO_ADD_GROUPS".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			Map<String, Object> sVO = null;
			try {

				// 取值以及錯誤處理
				String seasonName = request.getParameter("seasonName").trim();
				if (seasonName.trim().equals(null) || seasonName.trim().length() == 0) {
					errorMsgs.add("請輸入賽季名稱");
				} else if (!seasonName.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,20}$")) {
					errorMsgs.add("賽季名稱只能是中、英文字母、和數字 , 且長度必需在2到20之間");
				}

				Date seasonBeginDate = null;
				try {
					seasonBeginDate = Date.valueOf(request.getParameter("seasonBeginDate").trim());
				} catch (IllegalArgumentException e) {
					seasonBeginDate = null;
				}

				Date seasonEndDate = null;
				try {
					seasonEndDate = Date.valueOf(request.getParameter("seasonEndDate").trim());
				} catch (IllegalArgumentException e) {
					seasonEndDate = null;
				}

				if (seasonBeginDate != null && seasonEndDate != null && seasonBeginDate.after(seasonEndDate)) {
					errorMsgs.add("賽季開始日期必須早於賽季結束日期");
				}

				Timestamp signUpBegin = null;
				try {
					signUpBegin = Timestamp.valueOf(request.getParameter("signUpBegin").trim());
				} catch (IllegalArgumentException e) {
					signUpBegin = null;
				}

				Timestamp signUpEnd = null;
				try {
					signUpEnd = Timestamp.valueOf(request.getParameter("signUpEnd").trim());
				} catch (IllegalArgumentException e) {
					signUpEnd = null;
				}

				if (signUpBegin != null && signUpEnd != null && signUpBegin.after(signUpEnd)) {
					errorMsgs.add("報名開始日期必須早於報名結束日期");
				}

				String descriptions = request.getParameter("descriptions").trim();

				// 放入VO
				sVO = new HashMap<String, Object>();
				sVO.put("seasonName", seasonName);
				sVO.put("seasonBeginDate", seasonBeginDate);
				sVO.put("seasonEndDate", seasonEndDate);
				sVO.put("signUpBegin", signUpBegin);
				sVO.put("signUpEnd", signUpEnd);
				sVO.put("descriptions", descriptions);

				// 錯誤處理
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("seasonVO", sVO);
					RequestDispatcher failView = request.getRequestDispatcher("/season/addSeason.jsp");
					failView.forward(request, response);
					return;
				}

				// 成功處理
				request.getSession().setAttribute("seasonVO", sVO);
				RequestDispatcher successView = request.getRequestDispatcher("/groups/addGroups.jsp");
				successView.forward(request, response);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				request.setAttribute("seasonVO", sVO);
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/season/addSeason.jsp");
				failureView.forward(request, response);
			}
			return;
		}

		/********************************************************************/
		if ("UPDATE_SEASON".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				// 取值以及錯誤處理
				String seasonName = request.getParameter("seasonName");
				// if (seasonName == null || seasonName.trim().length() == 0) {
				// errorMsgs.add("請輸入賽季名稱");
				// } else if
				// (!seasonName.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,20}$"))
				// {
				// errorMsgs.add("賽季名稱只能是中、英文字母、和數字 , 且長度必需在2到20之間");
				// }

				Date seasonBeginDate = null;
				try {
					seasonBeginDate = Date.valueOf(request.getParameter("seasonBeginDate").trim());
				} catch (IllegalArgumentException e) {
					seasonBeginDate = null;
				}

				Date seasonEndDate = null;
				try {
					seasonEndDate = Date.valueOf(request.getParameter("seasonEndDate").trim());
				} catch (IllegalArgumentException e) {
					seasonEndDate = null;
				}

				if (seasonBeginDate != null && seasonEndDate != null && seasonBeginDate.after(seasonEndDate)) {
					errorMsgs.add("賽季開始日期必須早於賽季結束日期");
				}

				Timestamp signUpBegin = null;
				try {
					signUpBegin = Timestamp.valueOf(request.getParameter("signUpBegin").trim());
				} catch (IllegalArgumentException e) {
					signUpBegin = null;
				}

				Timestamp signUpEnd = null;
				try {
					signUpEnd = Timestamp.valueOf(request.getParameter("signUpEnd").trim());
				} catch (IllegalArgumentException e) {
					signUpEnd = null;
				}

				if (signUpBegin != null && signUpEnd != null && signUpBegin.after(signUpEnd)) {
					errorMsgs.add("報名開始日期必須早於報名結束日期");
				}

				String descriptions = request.getParameter("descriptions").trim();
				Integer seasonID = new Integer(request.getParameter("seasonID"));

				SeasonVO sVO = new SeasonVO();
				sVO.setSeasonName(seasonName);
				sVO.setSeasonBeginDate(seasonBeginDate);
				sVO.setSeasonEndDate(seasonEndDate);
				sVO.setSignUpBegin(signUpBegin);
				sVO.setSignUpEnd(signUpEnd);
				sVO.setDescriptions(descriptions);
				sVO.setSeasonID(seasonID);

				if (errorMsgs.isEmpty()) {
					// 呼叫永續層
					SeasonService sSvc = new SeasonService();
					sSvc.updateSeason(seasonName, seasonBeginDate, seasonEndDate, signUpBegin, signUpEnd, seasonID,
							descriptions);

					// 處理完成，準備轉交
					response.sendRedirect(request.getContextPath() + "/season/seasonList_back.jsp");

				} else {

					request.setAttribute("sVO", sVO);
					RequestDispatcher failureView = request.getRequestDispatcher("/season/addSeason.jsp");
					failureView.forward(request, response);

				}

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/season/updateSeason.jsp");
				failureView.forward(request, response);
			}

			return;
		}

		/********************************************************************/
		if ("GET_ONE_TO_UPDATE".equals(action)) {
			try {
				Integer seasonID = Integer.parseInt(request.getParameter("seasonID"));

				// 呼叫永續層
				SeasonService sSvc = new SeasonService();
				request.setAttribute("seasonVO", sSvc.findBySeasonID(seasonID));

				// 轉交
				RequestDispatcher successView = request.getRequestDispatcher("/season/updateSeason.jsp");
				successView.forward(request, response);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				RequestDispatcher failureView = request.getRequestDispatcher("/season/seasonList_back.jsp");
				failureView.forward(request, response);
			}
		}

		/********************************************************************/
		if ("DELETE_SEASON".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			// 取得Service的實例
			SeasonService sSvc = new SeasonService();

			try {
				// 呼叫永續層
				Integer seasonID = new Integer(request.getParameter("seasonID"));
				Integer result = sSvc.deleteSeason(seasonID);

				if (result == 0) {
					errorMsgs.add("刪除失敗");
				}

				RequestDispatcher successView = request.getRequestDispatcher("/season/seasonList_back.jsp");
				successView.forward(request, response);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/season/seasonList_back.jsp");
				failureView.forward(request, response);
			}
		}

		/********************************************************************/
		if ("GET_GROUPS".equals(action)) {
			Integer seasonID = Integer.parseInt(request.getParameter("seasonID"));
			SeasonService sSvc = new SeasonService();
			request.setAttribute("seasonVO", sSvc.findBySeasonID(seasonID));

			RequestDispatcher successView = request.getRequestDispatcher("/groups/groupList.jsp");
			successView.forward(request, response);
		}

		if ("TO_GROUPS_BACK".equals(action)) {
			Integer seasonID = Integer.parseInt(request.getParameter("seasonID"));
			SeasonService sSvc = new SeasonService();
			request.setAttribute("seasonVO", sSvc.findBySeasonID(seasonID));

			request.getRequestDispatcher("/groups/groupList_back.jsp").forward(request, response);

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
