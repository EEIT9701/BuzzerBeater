package eeit.opay;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutATM;
import allPay.payment.integration.domain.AioCheckOutOneTime;

/**
 * Servlet implementation class opaytest
 */
@WebServlet("/opayReturnCheckServlet.do")
public class opayReturnCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //取得opay實例
//		AllInOne allInOne = new AllInOne("");
//		String a = (String) request.getAttribute("MerchantID");	
	    System.out.println("繳費完成背景回傳Servlet"); 
	}

}
