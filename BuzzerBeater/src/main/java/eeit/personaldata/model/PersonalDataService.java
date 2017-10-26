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
	public List<PersonalDataVO> getAll1(){
		return dao.getAll1();
	}
}
