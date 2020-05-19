package member.command;

import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import member.memberDAO;
import member.service.MemberPage;

public class ListMemberService {
	
	public ActionForword execute(HttpServletRequest req, HttpServletResponse res)
	throws Exception{
	memberDAO memberDao = new memberDAO();
	
	ActionForword forword =new ActionForword();
	ArrayList<Member> memberList = memberDao.getMemberList();
	
	req.setAttribute("memberList", memberList);
	return forword;
	}

	public MemberPage getMemberPage(String string) {
		// TODO Auto-generated method stub
		return null;
	}


}