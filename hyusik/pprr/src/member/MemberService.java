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

}
