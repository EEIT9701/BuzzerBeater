package eeit.memberinfo.model;

import java.util.List;

public class MemberInfoService {
	private MemberInfoDAO_interface dao;
	
	public MemberInfoService(){
		dao = new MemberInfoDAO();
	}
	
	public void insert(MemberInfoVO memberInfoVO){
		dao.insert(memberInfoVO);
	}
	
	public void update(MemberInfoVO memberInfoVO){
		dao.update(memberInfoVO);
	}
	
	public List<MemberInfoVO>getAll(){
		
		return dao.getAll();
	}
	
	public MemberInfoVO findByPK(Integer memberID){
		return dao.findByPK(memberID);
	}
	
	public MemberInfoVO findByAcc(String account){
		return dao.findByAcc(account);
	}
}
