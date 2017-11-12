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
@WebServlet("/opaytest.do")
public class opayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //取得opay實例
		AllInOne allInOne = new AllInOne("");
		//信用卡現上付款函數
		AioCheckOutOneTime creditCardCheck = new AioCheckOutOneTime();
		//取得現在時間
		Date dNow = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String merchantTradeDate = formatter.format(dNow);
		//利用時間產生訂單序號
		creditCardCheck.setMerchantTradeNo(merchantTradeDate + "F");
//		creditCardCheck.setStoreID(storeID);
		
		//設定訂單時間
		formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		merchantTradeDate = formatter.format(dNow);
		//System.out.println(merchantTradeDate);
		creditCardCheck.setMerchantTradeDate(merchantTradeDate);
//		creditCardCheck.setIgnorePayment(ignorePayment);
        //訂單價格
		creditCardCheck.setTotalAmount("1200");
		//訂單名稱
		creditCardCheck.setTradeDesc("BuzzerBeater");
		//商品名稱
		creditCardCheck.setItemName("BuzzerBeater辦比賽");
		
		creditCardCheck.setNeedExtraPaidInfo("N");
		//付款結果回傳網址
		creditCardCheck.setReturnURL("http://211.23.128.214:5000");
		//creditCardCheck.setReturnURL("http://localhost:8080/BuzzerBeater/opayReturnCheckServlet.do");
		//付款完成後"返回商城"鍵
		creditCardCheck.setClientBackURL("http://localhost:8080/BuzzerBeater/jumpPage.jsp");
		creditCardCheck.setRedeem("Y");
		
		String b = allInOne.aioCheckOut(creditCardCheck, null);
		System.out.println(b);
		response.setHeader("content-type", "text/html;charset=UTF-8");		
		PrintWriter outPrint = response.getWriter();
	
		outPrint.write("<html>");
		outPrint.write("<body>");
		outPrint.write(b);
		outPrint.write("</body>");
		outPrint.write("</html>");
		outPrint.close();
	}

}
