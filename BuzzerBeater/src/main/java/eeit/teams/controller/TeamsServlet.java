package eeit.teams.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.players.model.PlayersVO;
import eeit.teams.model.TeamsService;
import eeit.teams.model.TeamsVO;

@WebServlet("/Teams.do")
public class TeamsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TeamsServlet() {
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

		if ("GET_ONE_TEAM".equals(action)) {
			Integer teamID = Integer.parseInt(request.getParameter("teamID"));

			TeamsService svc = new TeamsService();
			request.setAttribute("teamsVO", svc.findByID(teamID));
			request.getRequestDispatcher("/teams/teamInformation.jsp").forward(request, response);
		}
		
		if ("getOne_For_Update".equals(action)) {
			Integer teamID = Integer.parseInt(request.getParameter("teamID"));

			TeamsService svc = new TeamsService();
			request.setAttribute("teamsVO", svc.findByID(teamID));
			request.getRequestDispatcher("/teams/updateTeam.jsp").forward(request, response);
		}
		
		if("update".equals(action)){
			String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
			String teamBadge = base64.substring(base64.lastIndexOf(",")+1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = new Integer(request.getParameter("totalWin"));
			Integer totalLose = new Integer(request.getParameter("totalLose"));
			Float winRate = new Float(request.getParameter("winRate"));
			String remarks = request.getParameter("remarks");
			TeamsService teamSvc = new TeamsService();
			teamSvc.update(teamBadge, teamName, captainEmail, captainPhone, coachName, bossName,totalWin,totalLose,winRate, remarks,teamID);
			TeamsVO teamsVO = teamSvc.findByID(teamID);
		
			
			request.setAttribute("teamsVO", teamsVO);
			String url = "/teams/listOneTeam_updateCheck.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		if("goTolistAllTeam_back".equals(action)){
			String url = "/teams/listAllteam_back.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}

	}

}
