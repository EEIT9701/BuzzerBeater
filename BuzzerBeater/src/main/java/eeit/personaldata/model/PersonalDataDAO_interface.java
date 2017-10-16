package eeit.personaldata.model;

<<<<<<< HEAD
import java.util.List;

public interface PersonalDataDAO_interface {
   public List<PersonalDataVO> getAll(); 
	
	
	
=======
import java.util.Set;

public interface PersonalDataDAO_interface {
	
	public Set<PersonalDataVO> getAll();

	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID);
	
	public void insert(PersonalDataVO personalDataVO);
	
	public void update(PersonalDataVO personalDataVO);
	
	public void delete(Integer PersonalDataID);
>>>>>>> branch 'master' of https://github.com/EEIT9701/BuzzerBeater.git
}
