package eeit.personaldata.model;

import java.util.List;

public class PersonalDataService {
   private PersonalDataDAO_interface dao;
	
	public PersonalDataService(){
		dao=new PersonalDataDAO();
	}
	public List<PersonalDataVO> getAll(){
		return dao.getAll();
	}
}
