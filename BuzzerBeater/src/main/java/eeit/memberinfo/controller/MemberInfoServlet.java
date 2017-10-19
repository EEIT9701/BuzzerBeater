package eeit.memberinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eeit.memberinfo.model.MemberInfoServes;

/**
 * Servlet implementation class memberInfoServlet
 */
@WebServlet("/MemberInfo.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		//String action = req.getParameter("action");
		
		MemberInfoServes dao = new MemberInfoServes();
		System.out.println(dao.getAll());
	}

}
