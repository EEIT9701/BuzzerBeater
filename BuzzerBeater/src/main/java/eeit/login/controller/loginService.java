package eeit.login.controller;

import eeit.memberinfo.model.MemberInfoService;

public class loginService {
		public boolean checkIDPassword(String acc) {
			MemberInfoService dao = new MemberInfoService();

			return dao.findByAcc(acc);
		}
	
}
