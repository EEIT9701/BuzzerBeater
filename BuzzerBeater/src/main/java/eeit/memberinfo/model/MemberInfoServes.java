package eeit.memberinfo.model;

import java.util.List;

public class MemberInfoServes {
	
	private MemberInfoDAO_interface dao;
	
	public MemberInfoServes(){
		dao = new MemberInfoDAO();
	}
	
	public List<MemberInfoVO> getAll(){
		return dao.getAll();
	}
	
}
