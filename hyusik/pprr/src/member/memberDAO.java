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
			}
			System.out.println(member);
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
	public List<Member> select(Connection conn)
			throws SQLException {
		ResultSet rs = null;
		try {
			String sql = "select * from member ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			List<Member> member =new ArrayList<>();;
			while(rs.next()) {
				member.add(new Member(rs.getString("email"),
						rs.getString("name"),
						rs.getString("birth"),
						rs.getString("gender"),
						rs.getString("password"),
						Integer.parseInt(rs.getString("admin"))));
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
				"	  SET	  name=?, password = ?, " + 
				"	  WHERE   memberemail = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getemail());
		pstmt.executeUpdate();
	}

	public void deleteMember(String email, String password)
			throws SQLException {
		System.out.println("MemberDAO-deleteMember()호출");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select password from member where memberid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email); // email로 정보 조회
			rs = pstmt.executeQuery();
			
			if (rs.next()) { //조회하는 정보가 존재하는 경우
				if(rs.getString("password").equals("password")) {
					//DB상 password = 사용자 입력 password => 계정 삭제 실행.
					pstmt.close();
					pstmt = null;
					sql = "delete member where memberid = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, email);
					pstmt.executeUpdate();
					System.out.println("계정 삭제에 성공했습니다. 그동안 이용해주셔서 감사합니다.");
				} else {
					System.out.println("계정 삭제에 실패했습니다. 다시 시도해주시기 바랍니다.");
				}
			}
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(conn);	
			JdbcUtil.close(pstmt);	
		}


	}
	   
       
       
       
	

	
}

