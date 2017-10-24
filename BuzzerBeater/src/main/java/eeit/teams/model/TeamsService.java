package eeit.teams.model;

import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TeamsService {
	private TeamsDAO_interface dao;

	public TeamsService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (TeamsDAO_interface) context.getBean("TeamsDAO");
	}

	public Set<TeamsVO> getAll() {
		return dao.getAll();
	}
	
	public TeamsVO findByID(Integer teamID){
		return dao.findByID(teamID);
	}
}
