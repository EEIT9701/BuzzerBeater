package eeit.personaldata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalDataController {

	@RequestMapping(value = { "GET", "/personalData/personalData.mvc" })
	public String personalData(ModelMap model) {
		return "/personalData/personalData";
	}

	@RequestMapping(value = { "GET", "/personalData/teamData.mvc" })
	public String teamData(ModelMap model) {
		return "/personalData/teamData";
	}

}
