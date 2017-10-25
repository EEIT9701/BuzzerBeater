package eeit.groups.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;
import eeit.season.model.SeasonService;
import eeit.season.model.SeasonVO;

@WebServlet("/Groups.do")
public class GroupsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GroupsServlet() {
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

		if ("GET_ALL_GROUPS".equals(action)) {

			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			// 取得Service回傳的資料
			GroupsService gSvc = new GroupsService();
			Set<GroupsVO> set = gSvc.getAll();

			// 將Set轉換為JSON格式
			String jsonString = JSONValue.toJSONString(set);

			// 經由Response送往瀏覽器
			PrintWriter out = response.getWriter();
			out.println(jsonString);

			return;
		}

		if ("ADD_GROUP".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			GroupsVO groupsVO = null;
			try {

				String groupName = request.getParameter("groupName");
				if (groupName == null || groupName.trim().length() == 0) {
					errorMsgs.add("請輸入分組名稱");
				} else if (!groupName.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$")) {
					errorMsgs.add("分組名稱只能是中、英文字母、數字和 _ , 且長度必需在2到10之間");
				}

				Integer maxTeams = null;
				try {
					maxTeams = new Integer(request.getParameter("maxTeams"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊數量上限:請輸入數字");
				}

				Integer minTeams = null;
				try {
					minTeams = new Integer(request.getParameter("minTeams"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊數量下限:請輸入數字");
				}

				if (maxTeams != null && minTeams != null & maxTeams < minTeams) {
					errorMsgs.add("球隊數量上限必須大於或等於球隊數量下限");
				}

				Integer maxPlayers = null;
				try {
					maxPlayers = new Integer(request.getParameter("maxPlayers"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊成員上限:請輸入數字");
				}

				Integer minPlayers = null;
				try {
					minPlayers = new Integer(request.getParameter("minPlayers"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊成員下限:請輸入數字");
				}

				if (maxPlayers != null && minPlayers != null & maxPlayers < minPlayers) {
					errorMsgs.add("球隊成員上限必須大於或等於球隊成員下限");
				}

				Integer seasonID = new Integer(request.getParameter("seasonID"));

				groupsVO = new GroupsVO();
				groupsVO.setGroupName(groupName);
				groupsVO.setMaxPlayers(maxPlayers);
				groupsVO.setMinPlayers(minPlayers);
				groupsVO.setMaxTeams(maxTeams);
				groupsVO.setMinTeams(minTeams);

				if (!errorMsgs.isEmpty()) {
					request.setAttribute("groupsVO", groupsVO);
					RequestDispatcher failView = request.getRequestDispatcher("/groups/addGroups.jsp");
					failView.forward(request, response);
					return;
				}

				GroupsService gSvc = new GroupsService();
				gSvc.addGroups(seasonID, groupName, maxTeams, minTeams, maxPlayers, minPlayers);

				SeasonService sSvc = new SeasonService();
				request.setAttribute("seasonVO", sSvc.findBySeasonID(seasonID));
				RequestDispatcher successView = request.getRequestDispatcher("/groups/addGroups.jsp");
				successView.forward(request, response);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				request.setAttribute("groupsVO", groupsVO);
				RequestDispatcher failView = request.getRequestDispatcher("/groups/addGroups.jsp");
				failView.forward(request, response);
			}
		}

		if ("GET_GAMES".equals(action)) {
			Integer groupID = Integer.parseInt(request.getParameter("groupID"));
			GroupsService gSvc = new GroupsService();

			request.setAttribute("groupsVO", gSvc.findByGroupID(groupID));
			RequestDispatcher successView = request.getRequestDispatcher("/games/gameList.jsp");
			successView.forward(request, response);

		}

		// 根據隊伍數量計算所需比賽場數
		if ("ALGORITHM_COUNT".equals(action)) {
			Integer groupID = Integer.parseInt(request.getParameter("groupID"));
			GroupsService gSvc = new GroupsService();
			GroupsVO gVO = gSvc.findByGroupID(groupID);

			int teamsCount = gVO.getGroupRegSet().size();
			int result = (teamsCount * (teamsCount - 1)) / 2; // Round-robin
																// tournament
																// 循環賽

			request.setAttribute("teamsCount", teamsCount);
			request.setAttribute("result", result);
			RequestDispatcher view = request.getRequestDispatcher("/groups/algorithm_test.jsp");
			view.forward(request, response);
		}

	}

}
