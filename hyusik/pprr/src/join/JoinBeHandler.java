package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class JoinBeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("JoinBeHandler");
		if(request.getParameter("c1") == null) {
			response.sendRedirect("/yejoin/register.jsp");
		}
		if(request.getParameter("c2") == null) {
			response.sendRedirect("/yejoin/register.jsp");
		}
				
		return "/yejoin/join.jsp";
	}

}
