package eeit.memberinfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import eeit.memberinfo.model.MemberInfoService;
import eeit.season.model.SeasonService;

/**
 * Servlet implementation class memberInfoServlet
 */
@WebServlet("/memberInfoServlet")
public class memberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 設定Request的編碼為"UTF-8"，必須在取得請求參數前設定才有用
		request.setCharacterEncoding("UTF-8");

		// 取得請求參數"action"，此為自行設定的回傳參數，判斷將要執行的動作
		String action = request.getParameter("action");
		

		if ("GET_ALL_SEASON".equals(action)) {
			// 設定Response的Header和編碼
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");

			// 取得Service的實例
			MemberInfoService mSvc= new MemberInfoService();

			// 轉換為JSON格式(最好轉為純String的List或Map)
			//String jsonString = JSONValue.toJSONString(mSvc.getPureList());
			mSvc.getAll();
			
			
			
			// 經由Response送往瀏覽器
			PrintWriter out = response.getWriter();
			//out.println(jsonString);

			return;
		}
		
		
	}
}
