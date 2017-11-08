package eeit.groupreg.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eeit.groupreg.model.GroupRegService;
import eeit.groupreg.model.GroupRegVO;


@WebServlet(name = "opayReturnCheckServlet_1", urlPatterns = { "/opayReturnCheckServlet_1" })
public class opayReturnCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		GroupRegVO gVO=(GroupRegVO) session.getAttribute("opayCheck");
		
		GroupRegService groupRegService=new GroupRegService();
		GroupRegVO groupRegVO=new GroupRegVO();
		
		
		
		
	}

}
