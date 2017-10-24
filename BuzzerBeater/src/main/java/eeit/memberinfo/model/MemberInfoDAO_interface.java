package eeit.memberinfo.model;

import java.util.List;

public interface MemberInfoDAO_interface {
	public void insert(MemberInfoVO memberInfoVO);
	public void update(MemberInfoVO memberInfoVO);
	public void delete(Integer memberID);
	public MemberInfoVO findByPK(Integer memberID);
	public List<MemberInfoVO> getAll();

	public boolean findByAcc(String acc);
}
