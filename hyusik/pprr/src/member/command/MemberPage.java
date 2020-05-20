package member.command;

import java.sql.Connection;
import java.sql.SQLException;

import auth.service.User;
import jdbc.connection.ConnectionProvider;
import member.Member;
import member.memberDAO;

//이 클래스는 회원들의 정보를 받아오는 클래스이다.
public class MemberPage {
	//로그인처리(p605-14)
	//회원으로 존재하면 회원정보가 User객체로 리턴
	public User sarch(String email, String Name){
		Connection conn = null;
		System.out.println("email받음"+email);
		System.out.println("Name받음"+Name);
		try {
			conn = ConnectionProvider.getConnection();
			
			//유저가 입력한 id를 가진 회원이 존재하는 확인하는 함수호출
			//유저가 입력한 Name을 가진 회원이 존재하는지 확인하는 함수호출
			
			//회원으로 존재하면 회원정보가 Member객체로 리턴
			//회원으로 존재x  회원정보가 Member객체가 null리턴
			
			System.out.println("LoginService의 conn="+conn);
			memberDAO memberDao = new memberDAO();
			Member member = memberDao.select(conn, email);
			System.out.println("member안에 email받음"+member);
			/* "SELECT  * from member" */
			if(member==null) { //회원으로 존재x=>비회원 
				throw new emailNotEqualException();
			}
			
			//p606 20
			//비밀번호 불일치
			
			//memberemail, name, password, regdate 
			return new User(member.getemail(), member.getName());
			
		}catch(SQLException e) {
			throw new RuntimeException();
		}
	}//end of login()

}
