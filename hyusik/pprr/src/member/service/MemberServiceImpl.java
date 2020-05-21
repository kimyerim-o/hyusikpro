package member.service;

import member.Member;
import member.memberDAO;

public class MemberServiceImpl implements MemberService {

	@Override
	public Member getMember(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member getMemberByKey(String memberEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeMember(memberDAO member) {
		member = new memberDAO();
		  return member.deleteMember(member);
		return 0;
	}

}
