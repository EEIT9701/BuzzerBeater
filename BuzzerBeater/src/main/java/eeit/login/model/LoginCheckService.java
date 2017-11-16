package eeit.login.model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import eeit.memberinfo.model.MemberInfoService;
import eeit.memberinfo.model.MemberInfoVO;



@Controller
public class LoginCheckService {
	
	@RequestMapping(method = RequestMethod.POST, value="/LoginCheckService/checkAcc.mvc")
	public String method1(ModelMap model, @RequestParam("uname") String uname , @RequestParam("psw") String psw){
			
			System.out.println("帳號:"+ uname);
			System.out.println("密碼:"+ psw);
			return uname;
	}
	
	public MemberInfoVO findByAcc(String acc){
		MemberInfoService dao = new MemberInfoService();
		
		
		return dao.findByAcc(acc);
	}
	
}
