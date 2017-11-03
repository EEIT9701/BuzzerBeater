package eeit.personaldata.model;

import java.util.List;

public interface PersonalDataDAO_interface {
	public List<PersonalDataVO> getAll();

	public List<PersonalDataVO> getAll1();

	public List<PersonalDataVO> getAll2();
	
	public List<PersonalDataVO> findByPlyerID2(Integer playerID);

	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID);

	public void insert(PersonalDataVO personalDataVO);

	public void update(PersonalDataVO personalDataVO);

	public void delete(PersonalDataVO personalDataVO);

	public List<PersonalDataVO> findByGameID(Integer GameID);

	public List<PersonalDataVO> findByGameIDAndTeamID(Integer GameID, Integer TeamID);
	
	public List<PersonalDataVO> findByPlayerIDAndGameID(Integer PlayerID, Integer GameID);

	public List<PersonalDataVO> findByPlayerID(Integer playerID);
	
	public List<PersonalDataVO> findByTeamID(Integer teamID);
	

}
