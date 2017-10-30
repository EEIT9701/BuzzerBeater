package eeit.personaldata.model;

import java.util.List;

public class PersonalDataDAO_Hibernate implements PersonalDataDAO_interface {

	private static final String GET_ALL_STMT = "FROM PersonalDataVO";

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonalDataVO> getAll() {
		return null;
	}

	@Override
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(PersonalDataVO personalDataVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer PersonalDataID) {
		// TODO Auto-generated method stub

	}


	@Override
	public List<PersonalDataVO> getAll1() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> getAll2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PersonalDataVO> findByGameID(Integer GameID) {
		// TODO Auto-generated method stub
		return null;
	}

}
