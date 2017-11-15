package eeit.season.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.season.model.SeasonService;

@Controller
public class SeasonController {

	@RequestMapping(value = { "GET", "/season/listall.mvc" })
	public String toSeasonList(ModelMap model) {
		return "season/seasonList";
	}

	@RequestMapping(value = { "GET", "/season/toGroups.mvc" })
	public String toGroupList(ModelMap model, @RequestParam("seasonID") Integer seasonID) {
		model.addAttribute("seasonVO", new SeasonService().findBySeasonID(seasonID));
		return "groups/groupList";
	}

}
