package member;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import member.member;
public class memberDAO {
	
	public member selectById(Connection conn, String email)throws SQLException{
		System.out.println("DAO메소드 진입"+email);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("Select * from member where email = ?"); 
			pstmt.setString(1, email); // 
			rs = pstmt.executeQuery(); // 
			member member = null;
			if(rs.next()) {
				member=new member(
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("password"),
						rs.getString("birth"),
						rs.getString("gender"),
						rs.getInt("admin")
						);
			}
			return member;
		}finally {//
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}//end of member method

	public void insert(Connection conn,member mem) throws SQLException{
		try {
			PreparedStatement pstmt =conn.prepareStatement("insert into member value(?,?,?,?,?)");
					{
				pstmt.setString(1, mem.getEmail());
				pstmt.setString(2, mem.getName());
				pstmt.setString(3, mem.getPassword());
				pstmt.setString(4, mem.getGender());
				pstmt.setString(5, mem.getBirthday());
				pstmt.executeUpdate();
			}
		}finally {
			
		}
	}
	public void select(Connection conn, String membermatch)
			throws SQLException {
		String sql = "select * from member";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.execute(sql);
	}

	public ArrayList<Member> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Connection conn, member member)throws SQLException {
		
	}


	
}
