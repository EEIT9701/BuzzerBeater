package eeit.personaldata.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.personaldata.model.PersonalDataService;
import eeit.personaldata.model.PersonalDataVO;

@WebServlet("/PersonalData.do")
public class PersonalDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		if ("Get_All_PersonalData_JSON".equals(action)) {

			// 設定Response的Header和編碼
			resp.setHeader("Access-Control-Allow-Origin", "*");
			resp.setHeader("content-type", "text/html;charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");

			PersonalDataService pSvc = new PersonalDataService();

			ObjectMapper mapper = new ObjectMapper();
			String jsonInString = mapper.writeValueAsString(pSvc.getAll2());
			// JSONObject json = JSONObject.toJSONString(mSvc.getAll());

			// 經由Response送往瀏覽器
			PrintWriter out = resp.getWriter();
			out.println(jsonInString);

			return;
		}

		if ("Get_singlefieldData".equals(action)) {
			Integer gameID = new Integer(req.getParameter("gameID"));

			GamesService gsvc = new GamesService();
			GamesVO gamesVO = gsvc.findByGameID(gameID);
			Integer teamAID = gamesVO.getTeamAVO().getTeamID();
			Integer teamBID = gamesVO.getTeamBVO().getTeamID();

			PersonalDataService svc = new PersonalDataService();
			List<PersonalDataVO> teamAList = svc.findByGameIDAndTeamID(gameID, teamAID);
			List<PersonalDataVO> teamBList = svc.findByGameIDAndTeamID(gameID, teamBID);

			req.setAttribute("teamAList", teamAList);
			req.setAttribute("teamBList", teamBList);
			req.getRequestDispatcher("/personaldata/SinglefieldData.jsp").forward(req, resp);
			
		}
	}

}
