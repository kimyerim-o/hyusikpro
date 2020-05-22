package member;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.connection.ConnectionProvider;



public class MemberService {
	
	private memberDAO  memberDao = new memberDAO();
	
	
	public List<Member> getmember() {
		try (Connection conn=ConnectionProvider.getConnection()){
			System.out.println("MemberService의 getmember()호출성공");
			List<Member> select = memberDao.select(conn);
			System.out.println("MemberService() select="+select);
			return select;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	

	public int delete(String email, String pw) {
		try (Connection conn=ConnectionProvider.getConnection()){
			conn.setAutoCommit(false);
			
			System.out.println("MemberService의 getmember()호출성공");
			int delete = memberDao.delete(conn,email,pw);
			if(delete==1) {
				conn.commit();
			}
			System.out.println(delete);
			return delete;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}

}
