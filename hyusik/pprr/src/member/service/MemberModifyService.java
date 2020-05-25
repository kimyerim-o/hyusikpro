package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.Member;
import member.memberDAO;

public class MemberModifyService {
	private memberDAO memberDAO=new memberDAO();
	
	public void modify(Member member) {
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			
			int c=memberDAO.modify(conn,member.getPassword(),member.getbirth(),member.getemail());
			if(c<1) {
				throw new RuntimeException("fail modify member");
			}
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

	public void change(Member member) {
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			
			int c=memberDAO.change(conn,member.getAdmin(),member.getemail());
			if(c<1) {
				throw new RuntimeException("fail change fail");
				}
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
