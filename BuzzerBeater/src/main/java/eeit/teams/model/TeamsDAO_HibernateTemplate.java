package eeit.teams.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class TeamsDAO_HibernateTemplate implements TeamsDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM TeamsVO ORDER BY teamID";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(TeamsVO teamsVO) {
		hibernateTemplate.save(teamsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(TeamsVO teamsVO) {
		hibernateTemplate.update(teamsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer teamID) {
		hibernateTemplate.delete((TeamsVO) hibernateTemplate.get(TeamsVO.class, teamID));
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Set<TeamsVO> getAll() {
		List<TeamsVO> list = (List<TeamsVO>) hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<TeamsVO>(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public TeamsVO findByID(Integer teamID) {
		return (TeamsVO) hibernateTemplate.get(TeamsVO.class, teamID);
	}

	public static void main(String[] args){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		TeamsDAO_interface dao = (TeamsDAO_interface) context.getBean("TeamsDAO");
		
		Set<TeamsVO> set = dao.getAll();
		for(TeamsVO vo : set){
			System.out.print(vo.getTeamID()+", ");
			System.out.print(vo.getBossName()+", ");
			System.out.print(vo.getCaptainPhone()+", ");
			System.out.println();
		}

	}
}
