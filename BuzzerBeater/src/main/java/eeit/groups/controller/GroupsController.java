package eeit.groups.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.locationinfo.model.LocationinfoService;
import eeit.season.model.SeasonService;

@Controller
public class GroupsController {
	
	@RequestMapping(value = { "GET", "/groups/groupList.mvc" })
	public String toGroupList(ModelMap model, @RequestParam("seasonID") Integer seasonID) {
		model.addAttribute("seasonVO", new SeasonService().findBySeasonID(seasonID));
		return "/groups/groupList";
	}


}
