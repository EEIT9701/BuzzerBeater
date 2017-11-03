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

//		String action = request.getParameter("action");
//		if (action != null)
//			System.out.println("[Project Info] " + request.getRequestURI() + "? action= " + action);
//
//		chain.doFilter(request, response);
		HttpSession session = request.getSession();
		MemberInfoVO memberInfoVO  = (MemberInfoVO) session.getAttribute("LoginOK");
	    if(memberInfoVO == null){
	    	System.out.println("No auth.");
	    	chain.doFilter(request, response);
	    }
	    else if(memberInfoVO.getAuth() == "parttime"){
	    	System.out.println("Parttime.");
	    	chain.doFilter(request, response);
	    }
	    else if(memberInfoVO.getAuth() == "admin"){
	    	System.out.println("Admin.");
	    	chain.doFilter(request, response);
	    }
	    else if(memberInfoVO.getAuth() == "teams"){
	    	System.out.println("teams.");
	    	chain.doFilter(request, response);
	    }
	    else chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}
