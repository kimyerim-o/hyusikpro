package admin.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.NotFoundException;
import member.Member;
import member.service.MemberModifyService;
import mvc.command.CommandHandler;

public class ChangeHandler implements CommandHandler {
	private MemberModifyService modifyService=new MemberModifyService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("syso");
		try{
			Member member=new Member(Integer.parseInt(request.getParameter("admin")),request.getParameter("email"));
			modifyService.change(member);
			System.out.println("change");
			return "/admin/admin.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
