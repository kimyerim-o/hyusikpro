package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//p613
//로그인 여부를 검사하는 필터
//로그인 하지 않았으면 로그인 화면으로 이동
//로그인 하면 유저의 요청내용이 진행되도록
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession(false);
		
		//로그인 하지 않았으면 로그인 화면으로 이동
		if (session==null || session.getAttribute("AUTHUSER")==null) {
			HttpServletResponse res=(HttpServletResponse)response;
			res.sendRedirect(req.getContextPath()+"/login.go");
		}else {//로그인 하면 유저의 요청내용이 진행되도록
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
