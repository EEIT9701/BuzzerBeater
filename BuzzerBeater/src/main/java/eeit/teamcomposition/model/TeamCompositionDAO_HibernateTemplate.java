package eeit.teamcomposition.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class TeamCompositionDAO_HibernateTemplate implements TeamCompositionDAO_interface {
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String GET_ALL_STMT = "FROM TeamCompositionVO ORDER BY leaveTeamDate DESC";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(TeamCompositionVO teamCompositionVO) {
		hibernateTemplate.save(teamCompositionVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(TeamCompositionVO teamCompositionVO) {
		hibernateTemplate.update(teamCompositionVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer teamID) {
		TeamCompositionVO tcVO = (TeamCompositionVO) hibernateTemplate.get(TeamCompositionVO.class, teamID);
		hibernateTemplate.delete(tcVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Set<TeamCompositionVO> getAll() {
		List<TeamCompositionVO> list = (List<TeamCompositionVO>)hibernateTemplate.find(GET_ALL_STMT);
		return new LinkedHashSet<TeamCompositionVO>(list);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public TeamCompositionVO findByTeamID(Integer teamID) {
		return (TeamCompositionVO) hibernateTemplate.get(TeamCompositionVO.class, teamID);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public TeamCompositionVO findByPlayerID(Integer playerID) {
		return (TeamCompositionVO) hibernateTemplate.get(TeamCompositionVO.class, playerID);
	}

}
