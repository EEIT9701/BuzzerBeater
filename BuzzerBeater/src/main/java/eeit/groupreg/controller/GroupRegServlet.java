package eeit.groupreg.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import eeit.groupreg.model.GroupRegService;
import eeit.groupreg.model.GroupRegVO;


@WebServlet("/GroupReg.do")
public class GroupRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		// 設定Response的Header和編碼
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		if("UPDATE".equals(action)) {
			
			GroupRegService groupregSVC =new GroupRegService();
//			GroupRegVO groupRegVO=new GroupRegVO();
			//取得UPDATE 參數
			String jsonStr=request.getParameter("data");
			JSONObject gVO = new JSONObject(jsonStr);
			
			
			Integer groupID = Integer.valueOf(gVO.getString("groupID"));
			Integer teamID=Integer.valueOf(gVO.getString("teamID"));
			Integer teamStat=Integer.valueOf(gVO.getString("teamStat"));
			Timestamp registerDate=Timestamp.valueOf(gVO.getString("registerDate"));
			String paymentNumber=gVO.getString("paymentNumber");
			groupregSVC.update(groupID,teamID,teamStat,registerDate,paymentNumber);
			
			request.removeAttribute("Action");		
			return;
			
		}
	}

}
