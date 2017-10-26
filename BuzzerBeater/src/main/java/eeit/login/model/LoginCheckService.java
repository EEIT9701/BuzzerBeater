package eeit.login.model;

import eeit.memberinfo.model.MemberInfoService;
import eeit.memberinfo.model.MemberInfoVO;

public class LoginCheckService {
		public MemberInfoVO findByAcc(String acc) {
			MemberInfoService dao = new MemberInfoService();

			return dao.findByAcc(acc);
		}
	
}
