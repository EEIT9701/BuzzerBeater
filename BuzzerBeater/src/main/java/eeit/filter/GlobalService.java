package eeit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eeit.memberinfo.model.MemberInfoVO;

@WebFilter("/*")
public class GlobalService implements Filter {
	public GlobalService() {
		super();
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// String action = request.getParameter("action");
		// if (action != null)
		// System.out.println("[Project Info] " + request.getRequestURI() + "?
		// action= " + action);

		HttpSession session = request.getSession();
        //session要不為空值才能執行 權限 分流
		if (session.getAttribute("LoginOK") != null) {
			MemberInfoVO mVO = (MemberInfoVO) session.getAttribute("LoginOK");
			String auth = mVO.getAuth();
			if(auth == null){
				session.removeAttribute("LoginOK");
				chain.doFilter(request, response);
			}
			//授權分流
			if (auth.compareTo("admin") == 0 ) {
//			    System.out.println("歡迎:" + mVO.getName());	
			    chain.doFilter(request, response);
//			    request.getRequestDispatcher("/")
			} else if (auth.compareTo("parttime") == 0) {			
//				System.out.println("歡迎:" + mVO.getName());	
				chain.doFilter(request, response);
			} else if (auth.compareTo("teams") == 0) {
//				System.out.println("歡迎:" + mVO.getName());	
				chain.doFilter(request, response);
			
			}else{ 
				session.removeAttribute("LoginOK"); 
				chain.doFilter(request, response);
			}
		}else {
		
//			System.out.println("NO Auth");
			chain.doFilter(request, response);
		 
		}
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}