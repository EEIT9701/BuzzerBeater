package eeit.opay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class OpayTest
 */
@WebServlet("/OpayTest.do")
public class OpayTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HELLO OPay!!");
		
//		response.setHeader("content-type", "text/html;charset=UTF-8");
//		response.setCharacterEncoding("UTF-8");
		
		String MerchantID = "2000132";
		String MerchantTradeNo = "DX20171102155642f55f";       //交易訂單標號 變動
		String MerchantTradeDate = "2017/11/02 15:56:42";  //時間 變動
		String PaymentType = "aio";        //交易類型
		String TotalAmount = "5";       //交易金額
		String TradeDesc =  "建立信用卡測試訂單";  //交易描述
		//String ItemName = "隊伍報名費";      //商品名稱
		String ItemName = "MacBook 30元X2#iPhone6s 40元X1";      
		//String ReturnURL = "http://localhost:8080/BuzzerBeater/login/HelloGoogle4.jsp";             //付款完成通知回傳網址
		String ReturnURL = "https://developers.allpay.com.tw/AioMock/MerchantReturnUrl";
		String ChoosePayment  = "Credit";  //預設付款方式
		String StoreID = "";
		//String ClientBackURL = "http://localhost:8080/BuzzerBeater/login/HelloGoogle3.jsp";         //Client端返回廠商網址
		String ClientBackURL = "https://developers.allpay.com.tw/AioMock/MerchantClientBackUrl";
		String CreditInstallment = "";
		String InstallmentAmount= "";
		String Redeem = "";
		String EncryptType  = "1";          //CheckMacValue 簽章類型
		String CheckMacValue = "25195988A2F2B01B3D2FE6D8A323BFFCF0D04B8F3711BF391636606A4972D147";         //檢查碼
		
		String HashKey = "5294y06JbISpM5x9";
		String HashIV = "v77hoKGq4kWxNNIS";	
		
		String opayReq = "https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V4?" +  "MerchantID=" + MerchantID + "&" + "MerchantTradeNo=" + MerchantTradeNo+ "&" 
		+ "MerchantTradeDate=" + MerchantTradeDate+ "&" + "PaymentType=" + PaymentType + "&" + "TotalAmount=" + TotalAmount+ "&" + "TradeDesc=" + TradeDesc+ "&" 
		+ "ItemName=" + ItemName+ "&" +	"ReturnURL=" + ReturnURL + "&" + "ChoosePayment=" + ChoosePayment + "&" + "StoreID=" + "&" + "ClientBackURL=" + ClientBackURL+ "&"
		+ "CreditInstallment=" + "&" + "InstallmentAmount=" + "&" + "Redeem="+ "&" + "EncryptType=" +EncryptType + "&" + "CheckMacValue=" + CheckMacValue;
		
		//String opayReq1 = "https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V4";

		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect(opayReq);
		
	}

}
