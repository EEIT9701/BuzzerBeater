package eeit.teams.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.groups.model.GroupsService;
import eeit.groups.model.GroupsVO;
import eeit.personaldata.model.PersonalDataService;
import eeit.personaldata.model.PersonalDataVO;
import eeit.players.model.PlayersVO;
import eeit.teamcomposition.model.TeamCompositionService;
import eeit.teamcomposition.model.TeamCompositionVO;
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
			PersonalDataService playerSvc = new PersonalDataService();
			List<PersonalDataVO> personalDataVO = playerSvc.findByTeamID(teamID);
			TeamsVO teamsVO = tsvc.findByID(teamID);
			List<GamesVO> gamesVO = gsvc.findByTeamID(teamID);
			request.setAttribute("personalDataVO", personalDataVO);
			request.setAttribute("teamsVO", teamsVO);
			request.setAttribute("gamesVO", gamesVO);
			request.getRequestDispatcher("/teams/teamInformation.jsp").forward(request, response);
		}

		if ("GET_MY_TEAM".equals(action)) {
			Integer teamID = Integer.parseInt(request.getParameter("teamID"));

			TeamsService tsvc = new TeamsService();
			GamesService gsvc = new GamesService();
			PersonalDataService playerSvc = new PersonalDataService();
			List<PersonalDataVO> personalDataVO = playerSvc.findByTeamID(teamID);
			TeamsVO teamsVO = tsvc.findByID(teamID);
			List<GamesVO> gamesVO = gsvc.findByTeamID(teamID);
			request.setAttribute("personalDataVO", personalDataVO);
			request.setAttribute("teamsVO", teamsVO);
			request.setAttribute("gamesVO", gamesVO);
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
			// String base64 = request.getParameter("teamBadge");
			Integer teamID = new Integer(request.getParameter("teamID"));
			// String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			// String teamName = request.getParameter("teamName");
			// String captainEmail = request.getParameter("captainEmail");
			// String captainPhone = request.getParameter("captainPhone");
			// String coachName = request.getParameter("coachName");
			// String bossName = request.getParameter("bossName");
			// Integer totalWin = new Integer(request.getParameter("totalWin"));
			// Integer totalLose = new
			// Integer(request.getParameter("totalLose"));
			// Float winRate = new Float(request.getParameter("winRate"));
			// String remarks = request.getParameter("remarks");
			//
			// request.setAttribute("teamBadge", teamBadge);
			// request.setAttribute("teamID", teamID);
			// request.setAttribute("teamName", teamName);
			// request.setAttribute("captainEmail", captainEmail);
			// request.setAttribute("captainPhone", captainPhone);
			// request.setAttribute("coachName", coachName);
			// request.setAttribute("bossName", bossName);
			// request.setAttribute("totalWin", totalWin);
			// request.setAttribute("totalLose", totalLose);
			// request.setAttribute("winRate", winRate);
			// request.setAttribute("remarks", remarks);
			TeamsService tsvc = new TeamsService();
			TeamsVO teamsVO = tsvc.findByID(teamID);
			request.setAttribute("teamsVO", teamsVO);

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

		if ("buildMyTeam".equals(action)) {
//			request.getSession().setAttribute("teamID", 3006);
//			request.getSession().setAttribute("groupID", 3006);
			String base64 = request.getParameter("teamBadge");
			String teamBadge = base64.substring(base64.lastIndexOf(",") + 1);
			String teamName = request.getParameter("teamName");
			String captainEmail = request.getParameter("captainEmail");
			String captainPhone = request.getParameter("captainPhone");
			String coachName = request.getParameter("coachName");
			String bossName = request.getParameter("bossName");
			Integer totalWin = 0;
			Integer totalLose = 0;
			Float winRate = (float) 0.0;
			String remarks = request.getParameter("remarks");
			TeamsService teamSvc = new TeamsService();
			teamSvc.insert(teamBadge, teamName, captainEmail, captainPhone, coachName, bossName, totalWin, totalLose,
					winRate, remarks);
		}
		if ("findMyTeamPlayer".equals(action)) {
			TeamsService tsvc = new TeamsService();
			TeamCompositionService tcsvc = new TeamCompositionService();
			List<TeamCompositionVO> list = tcsvc.findByTeamID(3009);
			List<HashMap<String, String>> returnlist = new ArrayList<HashMap<String, String>>();
			Map<String, String> map = null;

			for (TeamCompositionVO teamCompositionVO : list) {
				map = new HashMap<String, String>();
				map.put("photo", teamCompositionVO.getPlayersVO().getPhoto());
				map.put("playerName", teamCompositionVO.getPlayersVO().getPlayerName());
				map.put("id", teamCompositionVO.getPlayersVO().getId());
				map.put("playerNo", teamCompositionVO.getPlayerNo().toString());
				map.put("playerRole", teamCompositionVO.getPlayerRole());
				map.put("height", teamCompositionVO.getPlayersVO().getHeight().toString());
				map.put("weights", teamCompositionVO.getPlayersVO().getWeights().toString());
				map.put("birthday", teamCompositionVO.getPlayersVO().getBirthday().toString());
				map.put("nationality", teamCompositionVO.getPlayersVO().getNationality());

				returnlist.add((HashMap<String, String>) map);
			}

			Gson gson = new Gson();
			String jsonList = gson.toJson(returnlist);

			PrintWriter out = response.getWriter();
			out.println(jsonList);
		}
	}

}
