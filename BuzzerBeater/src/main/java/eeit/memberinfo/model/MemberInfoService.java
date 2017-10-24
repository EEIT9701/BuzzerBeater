package eeit.memberinfo.model;

import java.util.List;

public class MemberInfoService {
	private MemberInfoDAO_interface dao;
	
	public MemberInfoService(){
		dao = new MemberInfoDAO();
	}
	
	public List<MemberInfoVO>getAll(){
		
		return dao.getAll();
	}
	
	public MemberInfoVO findByPK(Integer memberID){
		return dao.findByPK(memberID);
	}
	
	public boolean findByAcc(String acc){
		return dao.findByAcc(acc);
	}
}
