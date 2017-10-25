package eeit.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class loginFilter
 */
@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "memberinfoweb", value = "/memberInfo/*")
		})
public class loginFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
    public loginFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//chain.doFilter(request, response);
		if(request instanceof HttpServletRequest && response instanceof HttpServletResponse){
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp = (HttpServletResponse)response;
			String servletPath = req.getServletPath();
			System.out.println("111--->"+servletPath);
		
			if(mustLogin(servletPath)){
				if(checkLogin(req)){       //request的網頁是在有控管的網頁list內, 且session裡有login的token則 讓他通過
					System.out.println("222--->需要Login,已經Login");
					chain.doFilter(request, response);   //交棒
				}else {                    //request的網頁是在有控管的網頁list內, 且session裡沒有login的token則 去資料庫驗證帳號 
					HttpSession session = req.getSession();
					//session.setAttribute("target", req.getServletPath()); 
					System.out.println("333--->需要Login,尚未Login, ServletPat=" + req.getServletPath());
					RequestDispatcher rd = request.getRequestDispatcher("/testlogin/testLoginFailure.jsp");
					rd.forward(req, resp);
				}
			}else {						//request的網頁不在有控管的網頁list內,則 讓他通過
				System.out.println("444--->不需要Login");
				chain.doFilter(request, response);
				
			}
		}else {
			throw new ServletException("Request/Response Type Error");
		}
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while(e.hasMoreElements()){
			String name = e.nextElement();
			url.add(fConfig.getInitParameter(name));
		}
	}

	//檢查目前session是否有LoginOK的認可
	private boolean checkLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object loginToken = session.getAttribute("LoginOK");
		if(loginToken == null){
			return false;
		}else {
			return true;
		}
	}
	
	//比對是否有filter有控管的jsp或java程式,如果比對有需要控管的  回傳 login = true
		private boolean mustLogin(String servletPath){
			boolean login = false;
			for(String sURL:url){
				if(sURL.endsWith("*")){
					sURL = sURL.substring(0, sURL.length() -1 );
					if(servletPath.startsWith(sURL)){
						login = true;
						break;
					}
					}else {
						if(servletPath.equals(sURL)){
							login = true;
							break;
						}						
					}
				}
				return login;
		}
}
