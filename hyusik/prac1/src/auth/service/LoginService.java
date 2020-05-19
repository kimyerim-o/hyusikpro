package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import member.memberDAO;
import member.member;

//p605
//이 문서는  LoginHandler에서 호출되는 클래스로서 db연동
public class LoginService {
	//변수
	private memberDAO  memberDao = new memberDAO();

	//로그인처리(p605-14)
	//회원으로 존재하면 회원정보가 User객체로 리턴
	public User login(String email, String password){
		Connection conn = null;
		System.out.println("email받음"+email);
		try {
			conn = ConnectionProvider.getConnection();
			//유저가 입력한 id를 가진 회원이 존재하는 확인하는 함수호출
			//회원으로 존재하면 회원정보가 Member객체로 리턴
			//회원으로 존재x  회원정보가 Member객체가 null리턴
			System.out.println("LoginService의 conn="+conn);
			member member = memberDao.selectById(conn, email);
			System.out.println("member안에 email받음"+member);
			/*"SELECT  memberemail, name, password, regdate " + 
			 "	FROM 	member " + 
			 "	WHERE	memberid=?";*/
			if(member==null) { //회원으로 존재x=>비회원 
				throw new LoginFailException();
			}
			
			//p606 20
			//비밀번호 불일치
			if( !member.matchPassword(password) ) {
				throw new LoginFailException();
			}
			
			//memberemail, name, password, regdate 
			return new User(member.getEmail(), member.getName());
			
		}catch(SQLException e) {
			throw new RuntimeException();
		}
	}//end of login()
}


