package join;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.Member;
import member.memberDAO;

public class JoinService {

	private memberDAO memberDao = new memberDAO();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, joinReq.getEmail());
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			System.out.println("dao로감");
			memberDao.insert(conn, 
					new Member(
							joinReq.getEmail(), 
							joinReq.getName(),
							joinReq.getPass(), 
							joinReq.getBirth(),
							joinReq.getGender()));
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
