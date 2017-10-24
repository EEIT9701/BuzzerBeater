package eeit.teams.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.teams.model.TeamsService;

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

	}

}
