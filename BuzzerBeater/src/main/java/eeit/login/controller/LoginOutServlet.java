package eeit.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GoogleLoginOutServlet
 */
@WebServlet("/LoginOutServlet.do")
public class LoginOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginOutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//
		//request.getRequestDispatcher("header.jsp").include(request, response);

		HttpSession session = request.getSession();
		session.removeAttribute("LoginOK");
		session.removeAttribute("memberInfoVO");
		session.invalidate();

		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);

//		out.close();
	}
}
