package join;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import join.DuplicateIdException;
import join.JoinRequest;
import join.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {

	private JoinService joinService = new JoinService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return "/yejoin/register.jsp";
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		JoinRequest joinReq = new JoinRequest();
		joinReq.setEmail(req.getParameter("userid1")+"@"+req.getParameter("userid2"));
		joinReq.setPass(req.getParameter("pass"));
		joinReq.setPasscon(req.getParameter("passcon"));
		joinReq.setName(req.getParameter("name"));
		joinReq.setGender(req.getParameter("gender"));
		joinReq.setBirth(req.getParameter("birth_yy")+req.getParameter("birth_mm")+req.getParameter("birth_dd"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return "/yejoin/join.jsp";
		}
		
		try {
			joinService.join(joinReq);
			return "/login/login.jsp";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return "/yejoin/join.jsp";
		}
	}

}
