package eeit.teams.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.players.model.PlayersVO;
import eeit.teamcomposition.model.TeamCompositionService;
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
		
		if ("listMyPlayer".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
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
			teamSvc.insert(teamBadge, teamName, captainEmail, captainPhone, coachName, bossName, totalWin, totalLose,
					winRate, remarks);
			
			
			request.setAttribute("teamsVO", teamSvc.findByID(teamSvc.findMaxID()));
			String url = "/players/listMyPlayer.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		
		if ("insertTeam".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = new Integer(request.getParameter("totalWin"));
			Integer totalLose = new Integer(request.getParameter("totalLose"));
			Float winRate = new Float(request.getParameter("winRate"));
			String remarks = request.getParameter("remarks");

			request.setAttribute("teamBadge", teamBadge);
			request.setAttribute("teamName", teamName);
			request.setAttribute("captainEmail", captainEmail);
			request.setAttribute("captainPhone", captainPhone);
			request.setAttribute("coachName", coachName);
			request.setAttribute("bossName", bossName);
			request.setAttribute("totalWin", totalWin);
			request.setAttribute("totalLose", totalLose);
			request.setAttribute("winRate", winRate);
			request.setAttribute("remarks", remarks);
			String url = "/teams/insertTeam.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}

		if ("insert".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = new Integer(request.getParameter("totalWin"));
			Integer totalLose = new Integer(request.getParameter("totalLose"));
			Float winRate = new Float(request.getParameter("winRate"));
			String remarks = request.getParameter("remarks");

			request.setAttribute("teamBadge", teamBadge);
			request.setAttribute("teamName", teamName);
			request.setAttribute("captainEmail", captainEmail);
			request.setAttribute("captainPhone", captainPhone);
			request.setAttribute("coachName", coachName);
			request.setAttribute("bossName", bossName);
			request.setAttribute("totalWin", totalWin);
			request.setAttribute("totalLose", totalLose);
			request.setAttribute("winRate", winRate);
			request.setAttribute("remarks", remarks);
			String url = "/teams/insertCheck.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}

		if ("GET_ONE_TEAM".equals(action)) {
			Integer teamID = Integer.parseInt(request.getParameter("teamID"));
			
			
			TeamsService tsvc = new TeamsService();
			GamesService gsvc = new GamesService();
			TeamsVO teamsVO = tsvc.findByID(teamID);
			List<GamesVO> gamesVO = gsvc.findByTeamID(teamID);
			request.setAttribute("teamsVO",teamsVO);
			request.setAttribute("gamesVO",gamesVO);
			request.getRequestDispatcher("/teams/teamInformation.jsp").forward(request, response);
		}
		
		if ("GET_MY_TEAM".equals(action)) {
			Integer teamID = Integer.parseInt(request.getParameter("teamID"));
			
			
			TeamsService tsvc = new TeamsService();
			GamesService gsvc = new GamesService();
			TeamsVO teamsVO = tsvc.findByID(teamID);
			List<GamesVO> gamesVO = gsvc.findByTeamID(teamID);
			request.setAttribute("teamsVO",teamsVO);
			request.setAttribute("gamesVO",gamesVO);
			request.getRequestDispatcher("/teams/myTeamInformation.jsp").forward(request, response);
		}

		if ("UpdateTeam".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = new Integer(request.getParameter("totalWin"));
			Integer totalLose = new Integer(request.getParameter("totalLose"));
			Float winRate = new Float(request.getParameter("winRate"));
			String remarks = request.getParameter("remarks");

			request.setAttribute("teamBadge", teamBadge);
			request.setAttribute("teamID", teamID);
			request.setAttribute("teamName", teamName);
			request.setAttribute("captainEmail", captainEmail);
			request.setAttribute("captainPhone", captainPhone);
			request.setAttribute("coachName", coachName);
			request.setAttribute("bossName", bossName);
			request.setAttribute("totalWin", totalWin);
			request.setAttribute("totalLose", totalLose);
			request.setAttribute("winRate", winRate);
			request.setAttribute("remarks", remarks);
			request.getRequestDispatcher("/teams/updateTeam.jsp").forward(request, response);
		}
		
		if ("UpdateMyTeam".equals(action)) {
//			String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
//			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
//			String teamName = request.getParameter("teamName");
//			String captainEmail = request.getParameter("captainEmail");
//			String captainPhone = request.getParameter("captainPhone");
//			String coachName = request.getParameter("coachName");
//			String bossName = request.getParameter("bossName");
//			Integer totalWin = new Integer(request.getParameter("totalWin"));
//			Integer totalLose = new Integer(request.getParameter("totalLose"));
//			Float winRate = new Float(request.getParameter("winRate"));
//			String remarks = request.getParameter("remarks");
//
//			request.setAttribute("teamBadge", teamBadge);
//			request.setAttribute("teamID", teamID);
//			request.setAttribute("teamName", teamName);
//			request.setAttribute("captainEmail", captainEmail);
//			request.setAttribute("captainPhone", captainPhone);
//			request.setAttribute("coachName", coachName);
//			request.setAttribute("bossName", bossName);
//			request.setAttribute("totalWin", totalWin);
//			request.setAttribute("totalLose", totalLose);
//			request.setAttribute("winRate", winRate);
//			request.setAttribute("remarks", remarks);
			TeamsService tsvc = new TeamsService();
			TeamsVO teamsVO = tsvc.findByID(teamID);
			request.setAttribute("teamsVO",teamsVO);
			
			request.getRequestDispatcher("/teams/updateMyTeams.jsp").forward(request, response);
		}

		if ("updateCheck".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = new Integer(request.getParameter("totalWin"));
			Integer totalLose = new Integer(request.getParameter("totalLose"));
			Float winRate = new Float(request.getParameter("winRate"));
			String remarks = request.getParameter("remarks");

			request.setAttribute("teamBadge", teamBadge);
			request.setAttribute("teamID", teamID);
			request.setAttribute("teamName", teamName);
			request.setAttribute("captainEmail", captainEmail);
			request.setAttribute("captainPhone", captainPhone);
			request.setAttribute("coachName", coachName);
			request.setAttribute("bossName", bossName);
			request.setAttribute("totalWin", totalWin);
			request.setAttribute("totalLose", totalLose);
			request.setAttribute("winRate", winRate);
			request.setAttribute("remarks", remarks);
			String url = "/teams/updateCheck.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		if ("goTolistAllTeam_insert".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
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
			teamSvc.insert(teamBadge, teamName, captainEmail, captainPhone, coachName, bossName, totalWin, totalLose,
					winRate, remarks);

			String url = "/teams/listAllteam_back.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		if ("goTolistAllTeam_update".equals(action)) {
			String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
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
			teamSvc.update(teamBadge, teamName, captainEmail, captainPhone, coachName, bossName, totalWin, totalLose,
					winRate, remarks, teamID);

			String url = "/teams/listAllteam_back.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}
		if ("goTolistAllTeam_back".equals(action)) {

			String url = "/teams/listAllteam_back.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}

	}

}
