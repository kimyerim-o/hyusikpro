package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.NotFoundException;
import member.MemberService;
import mvc.command.CommandHandler;

public class MemberDeleteHandler implements CommandHandler {
	private MemberService memberService=new MemberService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			if(request.getMethod().equals("GET")) {
				return processForm(request,response);
			}else if(request.getMethod().equals("POST")) {
				return processSubmit(request,response);
			}else {
				response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				return null;
			}
		}

		private String processForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
			try {			
				return "/deleteID/deleteID.jsp";
			}catch(NotFoundException e) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
		}


		private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("processSubmit");
			String email=request.getParameter("email");
			String pw=request.getParameter("pw");
			System.out.println(email+"/"+pw);
			try{
				int d=memberService.delete(email,pw);
				if(d<1) {
					System.out.println(d+"dddd");
					request.setAttribute("no", d);
					return "/deleteID/delForm.jsp";
				}
				return "/deleteID/deleteID.jsp";
			}catch(NotFoundException e) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
		}

}
