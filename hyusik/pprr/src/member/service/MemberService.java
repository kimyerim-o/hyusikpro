package member.service;

import member.Member;
import member.memberDAO;

public interface MemberService {
	Member getMember(Member member);
	 //로그인(id,pw) 위해
	
	 int addMember(Member member);
	 //회원입력(email,pw,tal,addr) 위해

	Member getMemberByKey(String memberEmail);
	 //email참조해 회원정보DB에서 가져오기(mypage)

	int removeMember(Member member);
	 //Pw확인 후 회원탈퇴}

	int removeMember(memberDAO member);
}
