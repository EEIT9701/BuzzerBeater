package eeit.memberinfo.model;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import eeit.season.model.SeasonDAO_interface;
import eeit.season.model.SeasonVO;

public class MemberInfoService {
	private MemberInfoDAO_interface dao;
	
	public MemberInfoService(){
		//dao = new MemberInfoDAO();
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("modelConfig2_JNDI.xml");
		dao = (MemberInfoDAO_interface) context.getBean("MemberInfoDAO");

	}
	
	public MemberInfoVO findByPK(Integer memberID){
		return dao.findByPK(memberID);
	}
	
	public MemberInfoVO findByAcc(String account){
		return dao.findByAcc(account);
	}
	
	public Set<HashMap<String, Object>> getAll() {
		// Domain Knowledge 在Service內實作

		// 取得DAO回傳的原始資料
		Set<MemberInfoVO> set = dao.getAll();

		Set<HashMap<String, Object>> returnSet = new LinkedHashSet<HashMap<String, Object>>();
		Map<String, Object> map = null;

		// 根據需要轉換型態並以字串回傳
		for (MemberInfoVO sVO : set) {
			map = new HashMap<String, Object>();
			map.put("seasonID", sVO.getAcc());
			map.put("seasonName", sVO.getAuth());
			map.put("seasonBeginDate", sVO.getMemberID());
			map.put("seasonEndDate", sVO.getName());
			
			map.put("seasonEndDate", sVO.getTeamID());

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			map.put("signUpBegin", (sVO.getRegisterTime() != null) ? sdf.format(sVO.getRegisterTime()) : " ");
			
			
			returnSet.add((HashMap<String, Object>) map);
		}

		return returnSet;
	}
}
