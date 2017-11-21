package eeit.season.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeasonController {

	@RequestMapping(value = { "GET", "/season/seasonList.mvc" })
	public String toSeasonList(ModelMap model) {
		return "/season/seasonList";
	}
	
	@RequestMapping(value={"GET","/season/seasonList_back.mvc"})
	public String seasonListback(ModelMap model){
		return "/season/seasonList_back";
	}

}
