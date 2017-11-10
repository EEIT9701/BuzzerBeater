package eeit.personaldata.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.personaldata.model.PersonalDataService;
import eeit.personaldata.model.PersonalDataVO;
import eeit.players.model.PlayerService;
import eeit.players.model.PlayersVO;
import eeit.season.model.SeasonService;

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
		
		if("FIND_BY_SEASONID".equals(action)) {
			Integer seasonID = Integer.valueOf(req.getParameter("seasonID"));
			PersonalDataService svc = new PersonalDataService();
			List<PersonalDataVO> list = svc.FindBySeasonID(seasonID);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonInString = mapper.writeValueAsString(list);
			resp.getWriter().println(jsonInString);
		}
		
		if("FIND_BY_GROUPID".equals(action)) {
			Integer groupID = Integer.valueOf(req.getParameter("groupID"));
			PersonalDataService svc = new PersonalDataService();
			ObjectMapper mapper = new ObjectMapper();
			String jsonInString = mapper.writeValueAsString(svc.findByGroupID(groupID));
			resp.getWriter().println(jsonInString);
		}
		
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

		if ("Get_personalData".equals(action)) {
			Integer seasonID = new Integer(req.getParameter("seasonID"));
			Integer groupID = new Integer(req.getParameter("groupID"));
			                                                  
			PersonalDataService pdsvc = new PersonalDataService();
			List<PersonalDataVO> list = pdsvc.getAll();

			
			req.setAttribute("list1", list);

			req.getRequestDispatcher("/personaldata/PersonalDataindex.jsp").forward(req, resp);

		}
		if ("Get_singleData".equals(action)) {
			Integer playerID = new Integer(req.getParameter("playerID"));

			PersonalDataService pdsvc = new PersonalDataService();
			List<PersonalDataVO> list = pdsvc.getAll();

			PlayerService psvc = new PlayerService();
			PlayersVO playersVO = psvc.findByPlayerID(playerID);

			req.setAttribute("playersVO", playersVO);

			req.setAttribute("list1", list);

			req.getRequestDispatcher("/players/playerInformation.jsp").forward(req, resp);

		}

		if ("UPDATE".equals(action)) {
			// 設定Response的Header和編碼
			resp.setHeader("Access-Control-Allow-Origin", "*");
			resp.setHeader("content-type", "text/html;charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			//取得service實體
			PersonalDataService pSvc = new PersonalDataService();
			PersonalDataVO personalDataVO = new PersonalDataVO();
			//取得UPDATE 參數
			String pDVOStr = req.getParameter("PersonalDataVO");
		    System.out.println(pDVOStr);
		    JSONObject pVO = new JSONObject(pDVOStr);
	
		    personalDataVO.setPlayerID(Integer.parseInt(pVO.get("playerID").toString()));
     	    personalDataVO.setGameID(Integer.parseInt(pVO.get("gameID").toString()));
		    personalDataVO.setTeamID(Integer.parseInt(pVO.get("teamID").toString()));
		    personalDataVO.setGameTime(Integer.parseInt(pVO.get("gameTime").toString()));
		    personalDataVO.setTwoPoint(Integer.parseInt(pVO.get("twoPoint").toString()));
		    personalDataVO.setTwoPointShot(Integer.parseInt(pVO.get("twoPointShot").toString()));
		    personalDataVO.setThreePoint(Integer.parseInt(pVO.get("threePoint").toString()));
		    personalDataVO.setThreePointShot(Integer.parseInt(pVO.get("threePointShot").toString()));
		    personalDataVO.setFg(Integer.parseInt(pVO.get("fg").toString()));
		    personalDataVO.setFgShot(Integer.parseInt(pVO.get("fgShot").toString()));
		    personalDataVO.setOffReb(Integer.parseInt(pVO.get("offReb").toString()));
		    personalDataVO.setDefReb(Integer.parseInt(pVO.get("defReb").toString()));
		    personalDataVO.setAssist(Integer.parseInt(pVO.get("assist").toString()));
		    personalDataVO.setSteal(Integer.parseInt(pVO.get("steal").toString()));
		    personalDataVO.setBlocks(Integer.parseInt(pVO.get("blocks").toString()));
		    personalDataVO.setTurnover(Integer.parseInt(pVO.get("turnover").toString()));
		    personalDataVO.setPersonalFouls(Integer.parseInt(pVO.get("personalFouls").toString()));
		    personalDataVO.setPoints(Integer.parseInt(pVO.get("points").toString()));
		    personalDataVO.setStartingPlayer(Integer.parseInt(pVO.get("startingPlayer").toString()));
		    	
            pSvc.update(personalDataVO);			
		
		}  
		
		if ("INSERT".equals(action)) {
			// 設定Response的Header和編碼
			resp.setHeader("Access-Control-Allow-Origin", "*");
			resp.setHeader("content-type", "text/html;charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			//取得service實體
			PersonalDataService pSvc = new PersonalDataService();
			PersonalDataVO personalDataVO = new PersonalDataVO();
			//取得UPDATE 參數
			String pDVOStr = req.getParameter("PersonalDataVO");
		    System.out.println(pDVOStr);
		    JSONObject pVO = new JSONObject(pDVOStr);
	
		    personalDataVO.setPlayerID(Integer.parseInt(pVO.get("playerID").toString()));
     	    personalDataVO.setGameID(Integer.parseInt(pVO.get("gameID").toString()));
		    personalDataVO.setTeamID(Integer.parseInt(pVO.get("teamID").toString()));
		    personalDataVO.setGameTime(Integer.parseInt(pVO.get("gameTime").toString()));
		    personalDataVO.setTwoPoint(Integer.parseInt(pVO.get("twoPoint").toString()));
		    personalDataVO.setTwoPointShot(Integer.parseInt(pVO.get("twoPointShot").toString()));
		    personalDataVO.setThreePoint(Integer.parseInt(pVO.get("threePoint").toString()));
		    personalDataVO.setThreePointShot(Integer.parseInt(pVO.get("threePointShot").toString()));
		    personalDataVO.setFg(Integer.parseInt(pVO.get("fg").toString()));
		    personalDataVO.setFgShot(Integer.parseInt(pVO.get("fgShot").toString()));
		    personalDataVO.setOffReb(Integer.parseInt(pVO.get("offReb").toString()));
		    personalDataVO.setDefReb(Integer.parseInt(pVO.get("defReb").toString()));
		    personalDataVO.setAssist(Integer.parseInt(pVO.get("assist").toString()));
		    personalDataVO.setSteal(Integer.parseInt(pVO.get("steal").toString()));
		    personalDataVO.setBlocks(Integer.parseInt(pVO.get("blocks").toString()));
		    personalDataVO.setTurnover(Integer.parseInt(pVO.get("turnover").toString()));
		    personalDataVO.setPersonalFouls(Integer.parseInt(pVO.get("personalFouls").toString()));
		    personalDataVO.setPoints(Integer.parseInt(pVO.get("points").toString()));
		    personalDataVO.setStartingPlayer(Integer.parseInt(pVO.get("startingPlayer").toString()));
		    	
            pSvc.insert(personalDataVO);			
		
		}
		
		if ("DELETE".equals(action)) {
			// 設定Response的Header和編碼
			resp.setHeader("Access-Control-Allow-Origin", "*");
			resp.setHeader("content-type", "text/html;charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			//取得service實體
			PersonalDataService pSvc = new PersonalDataService();
			PersonalDataVO personalDataVO = new PersonalDataVO();
			//取得UPDATE 參數
			String pDVOStr = req.getParameter("PersonalDataVO");
		    System.out.println(pDVOStr);
		    JSONObject pVO = new JSONObject(pDVOStr);
	
		    personalDataVO.setPlayerID(Integer.parseInt(pVO.get("playerID").toString()));
     	    personalDataVO.setGameID(Integer.parseInt(pVO.get("gameID").toString()));
		    personalDataVO.setTeamID(Integer.parseInt(pVO.get("teamID").toString()));
	
            pSvc.delete(personalDataVO);			
		
		}
		if ("from1".equals(action)) {
			 String gameID=req.getParameter("gameID");
			Integer game=Integer.valueOf(gameID);
			
			String seasonID=req.getParameter("seasonID");
			
	
			
			
			
			jdbc jd=new jdbc();
		    jd.main(game);
		    
		    String url ="/groups/groupList.jsp?seasonID="+seasonID;
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
		}
		
		
		
	}

}
