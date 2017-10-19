package eeit.personaldata.model;

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
import java.util.Set;

public interface PersonalDataDAO_interface {
	
	public Set<PersonalDataVO> getAll();

	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID);
	
	public void insert(PersonalDataVO personalDataVO);
	
	public void update(PersonalDataVO personalDataVO);
	
	public void delete(Integer PersonalDataID);
}
