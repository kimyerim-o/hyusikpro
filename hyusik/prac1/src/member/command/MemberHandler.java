package member.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.connection.ConnectionProvider;
import member.member;
import member.memberDAO;
import mvc.command.CommandHandler;


public class MemberHandler 
implements CommandHandler {
	private ListMemberService listService = new ListMemberService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//1.파라미터 받기.
		memberDAO memberDao = new memberDAO();
		String memberchkmail = request.getParameter("memailchk");
		String memberchkname = request.getParameter("mbnamechk");
		member member = new member(memberchkmail,memberchkname);
		
		System.out.println("파라미터 받았습니다!"+memberchkmail+memberchkname);
		Connection conn = ConnectionProvider.getConnection();
		//2.비즈니스로직(<->Service<->DAO<->DB) p652 22
		String membermatch =  member.toString();
		
//		if(member!=null) {//웹페이지에서 검색하면 맞는 내용이 있으면 출력한다.
//			if(memberchkmail == dbmail() || memberchkname == dbname()) {
//			}
//		}
		MemberPage MemberPage = listService.getMemberPage("");
		 System.out.println("널떨어진 녀석!");
		return "/login/ManagementMember.jsp";
	}

}
