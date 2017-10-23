package eeit.personaldata.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class PersonalDataDAO_HibernateTemplate implements PersonalDataDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM PersonalDataVO";

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Set<PersonalDataVO> getAll() {
		Object obj = hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<PersonalDataVO>((List<PersonalDataVO>) obj);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public PersonalDataVO findByPersonalDataID(Integer PersonalDataID) {
		return (PersonalDataVO) hibernateTemplate.get(PersonalDataVO.class, PersonalDataID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(PersonalDataVO personalDataVO) {
		hibernateTemplate.save(personalDataVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(PersonalDataVO personalDataVO) {
		hibernateTemplate.update(personalDataVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer PersonalDataID) {
		PersonalDataVO personalDataVO = (PersonalDataVO) hibernateTemplate.get(PersonalDataVO.class, PersonalDataID);
		hibernateTemplate.delete(personalDataVO);

	}

	public static void main(String args[]) {

		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig1_DataSource.xml");
		PersonalDataDAO_interface dao = (PersonalDataDAO_interface) context.getBean("PersonalDataDAO");

		Set<PersonalDataVO> set = dao.getAll();
		for (PersonalDataVO vo : set) {
			System.out.print(vo.getPlayersVO().getPlayerID() + ", ");
			System.out.print(vo.getGamesVO().getGameID() + ", ");
			System.out.print(vo.getTeamsVO().getTeamName() + ", ");
			System.out.print(vo.getPlayersVO().getPlayerName() + ", ");
			System.out.print(vo.getQuarters() + ", ");
			System.out.println();
		}
	}

}
