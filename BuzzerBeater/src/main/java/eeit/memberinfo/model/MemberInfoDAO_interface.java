package eeit.memberinfo.model;

import java.util.Set;

public interface MemberInfoDAO_interface {
	public void insert(MemberInfoVO memberInfoVO);
	public void update(MemberInfoVO memberInfoVO);
	public void delete(Integer memberID);
	public MemberInfoVO findByPK(Integer memberID);
	
	public Set<MemberInfoVO> getAll();

	public MemberInfoVO findByAcc(String acc);
}
