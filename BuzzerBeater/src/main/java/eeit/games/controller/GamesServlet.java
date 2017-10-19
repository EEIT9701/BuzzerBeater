package eeit.games.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import net.minidev.json.JSONValue;

@WebServlet("/GamesServlet")
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
		GamesService gSvc = new GamesService();

		if ("GETALLGAMES".equals(action)) {
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

			gSvc.addGames(groupID, locationID, teamAID, teamAScore, teamBID, teamBScore, winnerID,
					gameBeginDate, gameEndDate);
		}
	}

}
