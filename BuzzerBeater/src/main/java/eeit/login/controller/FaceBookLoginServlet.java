package eeit.login.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import eeit.login.model.LoginCheckService;
import eeit.mail.GmailSendMailviaTLS;
import eeit.memberinfo.model.MemberInfoVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;

@WebServlet("/FaceBookLogin.do")
public class FaceBookLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// String code = request.getParameter("code");

		// System.out.println("HELLO FACEBOOK:" + code);
		// Google取得access_token的url
		String f_client_id = "144809318927994";
		String f_client_secret = "18af757805566646b1434b56781b72a2";
		String f_redirect_uri = "http://localhost:8080/BuzzerBeater/FaceBookLogin.do";
		URL urlObtainToken = new URL("https://graph.facebook.com/v2.10/oauth/access_token?");
		// URL urlObtainToken = new
		// URL("https://graph.facebook.com/oauth/access_token??");

		HttpURLConnection connectionObtainToken = (HttpURLConnection) urlObtainToken.openConnection();

		String accessTokenString = null;
		String inputLine;
		StringBuilder sb = null;
		MemberInfoVO memberInfoVO = new MemberInfoVO();
		HttpSession session = request.getSession();

		/*** 設定此connection使用POST ***/
		connectionObtainToken.setRequestMethod("POST");
		connectionObtainToken.setDoOutput(true);

		/*** 開始傳送參數 ***/
		OutputStreamWriter writer = new OutputStreamWriter(connectionObtainToken.getOutputStream());
		writer.write("code=" + request.getParameter("code") + "&"); // 取得FaceBook回傳的參數code
		writer.write("client_id=" + f_client_id + "&"); // 這裡請將xxxx替換成自己的client_id
		writer.write("client_secret=" + f_client_secret + "&"); // 這裡請將xxxx替換成自己的client_serect
		writer.write("redirect_uri=" + f_redirect_uri + "&"); // 這裡請將xxxx替換成自己的redirect_uri
		// writer.write("grant_type=authorization_code");
		writer.close();

		/*** 如果認證成功 ***/
		if (connectionObtainToken.getResponseCode() == HttpURLConnection.HTTP_OK) {
			StringBuilder sbLines = new StringBuilder("");

			// 取得回傳的資料(JSON格式)
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(connectionObtainToken.getInputStream(), "utf-8"));
			String strLine = "";
			while ((strLine = reader.readLine()) != null) {
				System.out.println(strLine);
				sbLines.append(strLine);
			}
			try {
				// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
				JSONObject jo = new JSONObject(sbLines.toString());
				// idTokenString = jo.getString("id_token");

				accessTokenString = jo.getString("access_token");

				// 印出FaceBook回傳的access token
				// resp.getWriter().println(jo.getString("id_token"));
				// System.out.println(accessTokenString);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}

		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		/*** 取得access_Token然後再去 FaceBook端解碼 ***/
		try {

			URL url = new URL(
					"https://graph.facebook.com/v2.5/me?fields=name,email,picture&access_token=" + accessTokenString);
			URLConnection conn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream())); // 接收FaceBook回傳的資料
			sb = new StringBuilder(); // 準備stringBuilder容器接收
			// bufferReader一行一行讀取資料到stringBuilder容器中
			while ((inputLine = in.readLine()) != null) {
				System.out.println(inputLine);
				sb.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException me) {
			me.printStackTrace();
		}
		// System.out.println(sb.toString());
		/*** FaceBook回傳JSON格式,取資料 ***/
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			JSONObject jsonOb = new JSONObject(sb.toString());

			LoginCheckService loginCheckflag = new LoginCheckService();
			String acc = jsonOb.getString("email");
			memberInfoVO = loginCheckflag.findByAcc(acc);
            //System.out.println("Acc:" + memberInfoVO.getAcc());
			if (memberInfoVO.getAcc() != null) { // check Email 是否有在資料庫內
				JSONObject pictureObj = jsonOb.getJSONObject("picture").getJSONObject("data");  //資料格式:有很多層,所以依序用key去取得value

//				memberInfoVO.setAcc(jsonOb.getString("email")); // FaceBook使用者帳號
//				memberInfoVO.setName(jsonOb.getString("name")); // FaceBook使用者姓名
				memberInfoVO.setRegisterTime(ts);               // 註冊時間
				session.setAttribute("LoginOK", memberInfoVO);
				session.setAttribute("pictureUri", pictureObj.getString("url"));

//              response.sendRedirect(request.getContextPath()+"index.jsp");
//				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
//				rd.forward(request, response);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			} else {   // check Email 是否有在資料庫內,沒有則回首頁
				//新帳戶註冊,寄Email
//				GmailSendMailviaTLS gs = new GmailSendMailviaTLS();
//				System.out.println(jsonOb.getString("email"));
//				gs.SendEmail(jsonOb.getString("email"), "歡迎您的加入!");
//				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
//				rd.forward(request, response);				
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}

}