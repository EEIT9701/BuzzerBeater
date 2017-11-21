package eeit.teams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.teams.model.TeamsService;

@Controller
public class TeamsController {

	@RequestMapping(value = { "GET", "/teams/teaminfo.mvc" })
	public String teamInfo(ModelMap model, @RequestParam("teamID") Integer teamID) {
		model.addAttribute("teamsVO", new TeamsService().findByID(teamID));
		return "/teams/teaminfo";
	}

	@RequestMapping(value = { "GET", "/teams/teamList.mvc" })
	public String teamList(ModelMap model) {
		return "/teams/teamList";
	}

}
