package eeit.players.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlayersController {

	@RequestMapping(value = { "GET", "/players/playerList.mvc" })
	public String playerList(ModelMap model) {
		return "/players/playerList";
	}
}
