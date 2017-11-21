package eeit.games.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.games.model.GamesService;
import eeit.games.model.GamesVO;
import eeit.personaldata.model.PersonalDataService;

@Controller
public class GamesController {

	@RequestMapping(value = { "GET", "/games/gameinfo.mvc" })
	public String gameinfo(ModelMap model, @RequestParam("gameID") Integer gameID) {

		GamesService gsvc = new GamesService();
		GamesVO gamesVO = gsvc.findByGameID(gameID);
		Integer teamAID = gamesVO.getTeamAVO().getTeamID();
		Integer teamBID = gamesVO.getTeamBVO().getTeamID();

		PersonalDataService svc = new PersonalDataService();
		model.addAttribute("teamAList", svc.findByGameIDAndTeamID(gameID, teamAID));
		model.addAttribute("teamBList", svc.findByGameIDAndTeamID(gameID, teamBID));

		return "/games/gameinfo";
	}
}
