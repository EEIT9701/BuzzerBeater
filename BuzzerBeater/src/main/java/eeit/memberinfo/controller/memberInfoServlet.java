package eeit.memberinfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.Gson;

import eeit.memberinfo.model.MemberInfoService;
import eeit.memberinfo.model.MemberInfoVO;

/**
 * Servlet implementation class memberInfoServlet
 */
@WebServlet("/memberInfoServlet.do")
public class memberInfoServlet extends HttpServlet {
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
		
		if("GET_ALL_MEMBERINFO_JSON".equals(action)){
			//取得service實例
			MemberInfoService mSvc = new MemberInfoService();
			// 轉換為JSON格式
			/***1***/
			//Gson gson = new Gson();
			//String jsonString = gson.toJson(mSvc.getAll());
			/***2***/
			ObjectMapper jsonMapper = new ObjectMapper();
            String jsonString = jsonMapper.writeValueAsString(mSvc.getAll());          
			/***3***/
			//System.out.println(jsonString);
			//String jsonString = JSONValue.toJSONString(mSvc.getAll());

			// 經由Response送往瀏覽器
			PrintWriter out = response.getWriter();
			out.println(jsonString);
				
			return;
		}
		if("INSERT".equals(action)){
			
			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			//取得service實例
			MemberInfoService mSvc = new MemberInfoService();
			MemberInfoVO memberInfoVO = new MemberInfoVO();
			//取得insert 參數
			String jsonStr  = request.getParameter("data");
			JSONObject mVO = new JSONObject(jsonStr);
						
			memberInfoVO.setAcc(mVO.get("acc").toString());
			memberInfoVO.setName(mVO.get("name").toString());
			memberInfoVO.setAuth(mVO.get("auth").toString());
			//將registerTime轉成Timestamp
			String timeTemp = mVO.getString("registerTime");
			Timestamp registerTimeData = new Timestamp(System.currentTimeMillis()); 
			String timeTemp01 = timeTemp.replace("T", " ");
			String timeTemp02 = timeTemp01.replace("Z", "");
			
			System.out.println(timeTemp02);
			registerTimeData = Timestamp.valueOf(timeTemp02); 
			memberInfoVO.setRegisterTime(registerTimeData);
	
			mSvc.insert(memberInfoVO);
			
			// 經由Response送往瀏覽器
//			PrintWriter out = response.getWriter();
//			out.println();
			request.removeAttribute("Action");	
			return;
		}
		if("UPDATE".equals(action)){
			
			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			//取得service實例
			MemberInfoService mSvc = new MemberInfoService();
			MemberInfoVO memberInfoVO = new MemberInfoVO();
			//取得UPDATE 參數
			String jsonStr  = request.getParameter("data");
			JSONObject mVO = new JSONObject(jsonStr);
			//將registerTime轉成Timestamp
			String timeTemp = mVO.getString("registerTime");
			Timestamp registerTimeData = new Timestamp(System.currentTimeMillis()); 
			String timeTemp01 = timeTemp.replace("T", " ");
			String timeTemp02 = timeTemp01.replace("Z", "");
			
			//System.out.println(timeTemp02);
			registerTimeData = Timestamp.valueOf(timeTemp02); 
			
			//System.out.println(registerTimeData);

			memberInfoVO.setMemberID(Integer.parseInt(mVO.get("memberID").toString()));
			memberInfoVO.setAcc(mVO.get("acc").toString());
			memberInfoVO.setName(mVO.get("name").toString());
			memberInfoVO.setAuth(mVO.get("auth").toString());
			memberInfoVO.setRegisterTime(registerTimeData);
			memberInfoVO.setTeamID(Integer.parseInt(mVO.get("teamID").toString()));
			
			//將傳送過來的值,執行update
			mSvc.update(memberInfoVO);
			
			//把Action 從request清空
			request.removeAttribute("Action");		
			return;
			
		}
		if("DELETE".equals(action)){
			//取得service實例
			MemberInfoService mSvc = new MemberInfoService();
			String memberID = request.getParameter("MemberID");
			mSvc.delete(Integer.parseInt(memberID));         
			
			return;
		}else System.out.println("HELLO");
		
		return;
		
	}

}
