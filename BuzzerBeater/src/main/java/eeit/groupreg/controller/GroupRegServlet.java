package eeit.groupreg.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import eeit.groupreg.model.GroupRegService;
import eeit.groupreg.model.GroupRegVO;
import eeit.memberinfo.model.MemberInfoVO;


@WebServlet("/GroupReg.do")
public class GroupRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		// 設定Response的Header和編碼
//		response.setHeader("Access-Control-Allow-Origin", "*");
//		response.setHeader("content-type", "text/html;charset=UTF-8");
//		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if("UPDATE".equals(action)) {
			
			GroupRegService groupregSVC =new GroupRegService();
//			GroupRegVO groupRegVO=new GroupRegVO();
			
			//取得UPDATE 參數
			String jsonStr=request.getParameter("data");
			JSONObject gVO = new JSONObject(jsonStr);
			
			//轉型態
			Integer teamID=Integer.valueOf(gVO.getString("teamID"));
			Integer groupID = Integer.valueOf(gVO.getString("groupID"));
			Integer teamStat=Integer.valueOf(gVO.getString("teamStat"));
			Timestamp registerDate=Timestamp.valueOf(gVO.getString("registerDate"));
			String paymentNumber=gVO.getString("paymentNumber");
			//傳去groupregSVC的update2
			groupregSVC.update2(teamID,groupID,teamStat,registerDate,paymentNumber);
//			System.out.println(teamID+","+groupID+","+teamStat+","+registerDate+","+paymentNumber);
			
			request.removeAttribute("action");		
			return;
			
		}
		if("INSERT".equals(action)) {
//			HttpSession session=request.getSession(false);
//			System.out.println("session="+session);
			request.getParameter("account");
			System.out.println(request.getParameter("account"));
			MemberInfoVO mVO=(MemberInfoVO) request.getSession().getAttribute("LoginOK");
			
			System.out.println("mVO="+mVO.getTeamID());
			
			
			
			
//			Integer teamID=mVO.getTeamID();
//			
//			
//			System.out.println(teamID);
			
			
//			if (session == null) { // 使用逾時
//				request.setAttribute("Errors", "使用逾時，請重新登入");
//				RequestDispatcher rd = request.getRequestDispatcher("<%=request.getContextPath() %>/index.jsp");
//				rd.forward(request, response);
//				return;
//			}
			
//			GroupRegService groupregSVC=new GroupRegService();
			
			
		}
	}

}
