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
import eeit.locationinfo.model.LocationinfoService;

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

			try {

				String group_Name = request.getParameter("group_Name");
				if (group_Name == null || group_Name.trim().length() == 0) {
					errorMsgs.add("請輸入分組名稱");
				} else if (!group_Name.trim().matches("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$")) {
					errorMsgs.add("分組名稱只能是中、英文字母、數字和 _ , 且長度必需在2到10之間");
				}

				Integer max_Teams = null;
				try {
					max_Teams = new Integer(request.getParameter("max_Teams"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊數量上限:請輸入數字");
				}

				Integer min_Teams = null;
				try {
					min_Teams = new Integer(request.getParameter("min_Teams"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊數量下限:請輸入數字");
				}

				if (max_Teams != null && min_Teams != null & max_Teams < min_Teams) {
					errorMsgs.add("球隊數量上限必須大於或等於球隊數量下限");
				}

				Integer max_Players = null;
				try {
					max_Players = new Integer(request.getParameter("max_Players"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊成員上限:請輸入數字");
				}

				Integer min_Players = null;
				try {
					min_Players = new Integer(request.getParameter("min_Players"));
				} catch (IllegalArgumentException e) {
					errorMsgs.add("球隊成員下限:請輸入數字");
				}

				if (max_Players != null && min_Players != null & max_Players < min_Players) {
					errorMsgs.add("球隊成員上限必須大於或等於球隊成員下限");
				}

				Integer season_ID = new Integer(request.getParameter("season_ID"));

				if (!errorMsgs.isEmpty()) {
					response.setHeader("Access-Control-Allow-Origin", "*");
					response.setHeader("content-type", "text/html;charset=UTF-8");
					response.setCharacterEncoding("UTF-8");

					String jsonString = JSONValue.toJSONString(errorMsgs);

					PrintWriter out = response.getWriter();
					out.println(jsonString);
				} else {
					GroupsService gSvc = new GroupsService();
					gSvc.addGroups(season_ID, group_Name, max_Teams, min_Teams, max_Players, min_Players);
				}

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());

				response.setHeader("Access-Control-Allow-Origin", "*");
				response.setHeader("content-type", "text/html;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");

				String jsonString = JSONValue.toJSONString(errorMsgs);

				PrintWriter out = response.getWriter();
				out.println(jsonString);
			}
		}

		if ("GET_GAMES".equals(action)) {
			Integer groupID = Integer.parseInt(request.getParameter("groupID"));
			GroupsService gSvc = new GroupsService();

			request.setAttribute("groupsVO", gSvc.findByGroupID(groupID));
			RequestDispatcher successView = request.getRequestDispatcher("/games/gameList.jsp");
			successView.forward(request, response);

		}

		//根據隊伍數量計算所需比賽場數
		if ("ALGORITHM_COUNT".equals(action)) {
			Integer groupID = Integer.parseInt(request.getParameter("groupID"));
			GroupsService gSvc = new GroupsService();
			GroupsVO gVO = gSvc.findByGroupID(groupID);

			int teamsCount = gVO.getGroupRegSet().size();
			int result = (teamsCount * (teamsCount - 1)) / 2; //Round-robin tournament 循環賽
			
			request.setAttribute("teamsCount", teamsCount);
			request.setAttribute("result", result);
			RequestDispatcher view = request.getRequestDispatcher("/groups/algorithm_test.jsp");
			view.forward(request, response);
		}
		
		
		
		

	}

}
