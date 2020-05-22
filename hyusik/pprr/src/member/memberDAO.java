package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
public class memberDAO {
	
	public Member selectById(Connection conn, String email)throws SQLException{
		System.out.println("DAO메소드 진입"+email);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {System.out.println("Member의 try문 진입");
			pstmt = conn.prepareStatement("Select * from member where email = ?"); 
			pstmt.setString(1, email); // 
			rs = pstmt.executeQuery(); // 
			System.out.println("완성된 쿼리문"+pstmt);
			Member member=null;
			if(rs.next()) {
				member = new Member(rs.getString("email"), 
						rs.getString("name"), 
						rs.getString("birth"), 
						rs.getString("gender"), 
						rs.getString("password"), 
						rs.getInt("admin"));
			}System.out.println(member);
			return member;
		
		}finally {//
			
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}//end of member method

	public void insert(Connection conn,Member mem) throws SQLException{
		try {
			PreparedStatement pstmt =conn.prepareStatement("insert into member (email,name,password,gender,birth) value(?,?,?,?,?)");
					{
				pstmt.setString(1, mem.getemail());
				pstmt.setString(2, mem.getName());
				pstmt.setString(3, mem.getPassword());
				pstmt.setString(4, mem.getGender());
				pstmt.setString(5, mem.getbirth());
				pstmt.executeUpdate();
			}
		}finally {
			
		}
	}
//	
//	private member convertmember(ResultSet rs)throws SQLException{
//		return new member(rs.getString("member_no"); //p647
//	}
	public Member select(Connection conn, String membermatch)
			throws SQLException {
		ResultSet rs = null;
		String memailchk = null;
		String memberchkname = null;
		try {
			String sql = "select * from member "
					+ " where email=? or name =?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memailchk);
			pstmt.setString(2, memberchkname);
			rs= pstmt.executeQuery();
			Member member =null;
			if(rs.next()) {
				member=new Member(rs.getString("email"),rs.getString("name"),rs.getString("birth"),rs.getString("gender"),rs.getString("password"),Integer.parseInt(rs.getString("admin")));
			}	
			return member;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(conn);
		}//p656
		
	}
	public ArrayList<Member> getMemberList() {
		return null;
	}
	public void update(Connection conn, Member member)
			throws SQLException {
		System.out.println("MemberDAO-update()호출");
		String sql = "UPDATE  member " + 
				"	  SET	  name=?, password = ? " + 
				"	  WHERE   memberid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getemail());
		pstmt.executeUpdate();
	}


	
}
