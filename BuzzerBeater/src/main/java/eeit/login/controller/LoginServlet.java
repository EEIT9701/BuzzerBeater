package eeit.login.controller;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import eeit.memberinfo.model.MemberInfoVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.Collections;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String idTokenString = request.getParameter("idtoken").toString();
		String inputLine;
		JSONObject jsonOb = null;
		StringBuilder sb = null;
		MemberInfoVO memberInfoVO = new MemberInfoVO();
		HttpSession session = request.getSession();
		try {
			  URL url = new URL("https://www.googleapis.com/oauth2/v3/tokeninfo?id_token="+idTokenString);
			  URLConnection conn = url.openConnection();
			  BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));  //接收google回傳的資料
			  sb = new StringBuilder();     //準備stringBuilder容器接收
			  
			  //bufferReader一行一行讀取資料到stringBuilder容器中
			  while ((inputLine = in.readLine()) != null){   
				  //System.out.println(inputLine);
				  sb.append(inputLine);
			  }
			  in.close();
			}catch(MalformedURLException me){
				me.printStackTrace();
			}
			//System.out.println(sb.toString());
					
		try {
			PrintWriter out = response.getWriter();
			jsonOb =  new JSONObject("{'userinfo':" + sb.toString() + "}");
			//String j =jsonOb.getJSONObject("userinfo").get("name").toString();
//			System.out.println(jsonOb.getJSONObject("userinfo").get("name").toString());
//			System.out.println(jsonOb.getJSONObject("userinfo").get("email").toString());
//			System.out.println(jsonOb.getJSONObject("userinfo").get("email_verified").toString());
//			System.out.println(jsonOb.getJSONObject("userinfo").get("picture").toString());
//			memberInfoVO.setAcc(jsonOb.getJSONObject("userinfo").get("email").toString());
//			memberInfoVO.setName(jsonOb.getJSONObject("userinfo").get("name").toString());
//			session.setAttribute("memberInfoVO", memberInfoVO);
			
			session.setAttribute("email", jsonOb.getJSONObject("userinfo").get("email").toString());
			out.print(jsonOb.getJSONObject("userinfo").get("email").toString());

		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

}