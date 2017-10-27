package eeit.login.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import eeit.login.model.LoginCheckService;
import eeit.memberinfo.model.MemberInfoVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/GoogleLogin.do")
public class GoogleLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				// Google取得access_token的url
				String g_client_id = "879939044143-sfo5p4l1nmd7ndrpdjhg8fh07ass3akm.apps.googleusercontent.com";
				String g_client_secret = "MhfMOERt_clyvAcZpgMqIocG";
				String g_redirect_uri = "http://localhost:8080/BuzzerBeater/GoogleLogin.do";
				URL urlObtainToken = new URL("https://accounts.google.com/o/oauth2/token");
				HttpURLConnection connectionObtainToken = (HttpURLConnection) urlObtainToken.openConnection();
				
				String idTokenString = null;
				String accessTokenString = null;
				String inputLine;
				StringBuilder sb = null;
				MemberInfoVO memberInfoVO = new MemberInfoVO();
				HttpSession session = req.getSession();
				
				// 設定此connection使用POST
				connectionObtainToken.setRequestMethod("POST");
				connectionObtainToken.setDoOutput(true);

				// 開始傳送參數
				OutputStreamWriter writer = new OutputStreamWriter(connectionObtainToken.getOutputStream());
				writer.write("code=" + req.getParameter("code") + "&"); // 取得Google回傳的參數code
				writer.write("client_id=" + g_client_id + "&"); // 這裡請將xxxx替換成自己的client_id
				writer.write("client_secret=" + g_client_secret + "&"); // 這裡請將xxxx替換成自己的client_serect
				writer.write("redirect_uri=" + g_redirect_uri + "&"); // 這裡請將xxxx替換成自己的redirect_uri
				writer.write("grant_type=authorization_code");
				writer.close();

				// 如果認證成功
				if (connectionObtainToken.getResponseCode() == HttpURLConnection.HTTP_OK) {
					StringBuilder sbLines = new StringBuilder("");

					// 取得Google回傳的資料(JSON格式)
					BufferedReader reader = new BufferedReader(
							new InputStreamReader(connectionObtainToken.getInputStream(), "utf-8"));
					String strLine = "";
					while ((strLine = reader.readLine()) != null) {
						System.out.println(strLine);
						sbLines.append(strLine);
					}
					//System.out.println("第一次:"+req.getPathInfo());
					try {
						// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
						JSONObject jo = new JSONObject(sbLines.toString());
						idTokenString = jo.getString("id_token");
						
						accessTokenString = jo.getString("access_token");
						
						// 印出Google回傳的access token
						//resp.getWriter().println(jo.getString("id_token"));
						//System.out.println(idTokenString);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
	
		resp.setHeader("content-type", "text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");

		
		/***取得id_Token然後再去 google端解碼***/	
		try {
			  	
			  URL url = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token="+accessTokenString);
			  //URL url = new URL("https://www.googleapis.com/oauth2/v1/tokeninfo?id_token="+idTokenString);
			  //https://www.googleapis.com/oauth2/v3/tokeninfo? idToken or accessToken
			  //https://www.googleapis.com/oauth2/v1/userinfo?access_token  使用者資訊
			  URLConnection conn = url.openConnection();
			  BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));  //接收google回傳的資料
			  sb = new StringBuilder();     //準備stringBuilder容器接收
			  
			  //bufferReader一行一行讀取資料到stringBuilder容器中
			  while ((inputLine = in.readLine()) != null){   
				  System.out.println(inputLine);
				  sb.append(inputLine);
			  }
			  in.close();
			}catch(MalformedURLException me){
				me.printStackTrace();
			}
			//System.out.println(sb.toString());
		/***google回傳JSON格式,取資料***/			
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			
			//PrintWriter out = resp.getWriter();
			JSONObject jsonOb =  new JSONObject(sb.toString());
		    
			LoginCheckService loginCheckflag = new LoginCheckService();
			String acc = jsonOb.getString("email");
			memberInfoVO = loginCheckflag.findByAcc(acc);
			if(memberInfoVO!=null){ //check Email 是否有在資料庫內	
//				memberInfoVO.setAcc(jsonOb.getString("email"));   //使用者帳號
//				memberInfoVO.setName(jsonOb.getString("name"));   //使用者姓名
//				memberInfoVO.setRegisterTime(ts);	              //照片的url		
				session.setAttribute("LoginOK", memberInfoVO);		
				
				session.setAttribute("pictureUri", jsonOb.getString("picture"));
//				RequestDispatcher rd = req.getRequestDispatcher("/page.jsp");
//				rd.forward(req, resp);
				resp.sendRedirect("page.jsp");
				return;
			}else{
				resp.sendRedirect("page.jsp");
				return;
//				RequestDispatcher rd = req.getRequestDispatcher("/page.jsp");
//				rd.forward(req, resp);
			}
	
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		
	}

}