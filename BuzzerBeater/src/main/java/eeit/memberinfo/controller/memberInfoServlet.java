package eeit.memberinfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import eeit.memberinfo.model.MemberInfoService;

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
		
		if("GET_ALL_MEMBERINFO_JSON".equals(action)){
	
			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			//取得service實例
			MemberInfoService mSvc = new MemberInfoService();
			
			// 轉換為JSON格式
			ObjectMapper mapper = new ObjectMapper();
			String jsonInString = mapper.writeValueAsString(mSvc.getAll());
			//JSONObject json = JSONObject.toJSONString(mSvc.getAll());
			
			// 經由Response送往瀏覽器
			PrintWriter out = response.getWriter();
			out.println(jsonInString);
				
			return;
		}
		else System.out.println("HELLO");
		
		return;
		
	}

}
