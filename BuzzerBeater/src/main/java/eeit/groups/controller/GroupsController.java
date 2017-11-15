package eeit.groups.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.locationinfo.model.LocationinfoService;

@Controller
public class GroupsController {

	@RequestMapping(value = { "GET", "/groups/toLocation.mvc" })
	public String toLocation(ModelMap model, @RequestParam("locationID") Integer locationID) {
		model.addAttribute("locationinfoVO", new LocationinfoService().findByID(locationID));
		return "location/locationinfo";
	}
}
