package member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.NotFoundException;
import member.Member;
import member.MemberService;
import mvc.command.CommandHandler;

public class ListMemberHandler implements CommandHandler{
	
	private MemberService memberservice=new MemberService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			List<Member> memberpage = memberservice.getmember();
			request.setAttribute("memberpage", memberpage );
			System.out.println(memberpage);
			
			return "/admin/ManagementMember.jsp";

		}catch(NotFoundException e){
			
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		return null;
	}
}
