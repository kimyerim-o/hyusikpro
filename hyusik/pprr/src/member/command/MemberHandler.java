package member.command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.NotFoundException;
import jdbc.connection.ConnectionProvider;
import member.Member;
import member.MemberService;
import member.memberDAO;
import mvc.command.CommandHandler;

public class MemberHandler 
implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		

		//1.파라미터받기

		String memberchkmail = request.getParameter("memailchk");
		String memberchkname = request.getParameter("mbnamechk");
		System.out.println("파라미터 받았습니다!"+memberchkmail+memberchkname);
			
		
		//2.비즈니스로직(server<->dao<->db)
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> mlist = null;
		Member member = null;
		//String email =null;
		//String name = null;
		String sql = "select * from member "
				+ " where email='"+memberchkmail+"' or name ='"+memberchkname+"'";
		System.out.println(sql);
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery(sql);
			while(rs.next() ) {
				mlist = new ArrayList<>();
				member = new Member(rs.getString("email"), 
									rs.getString("name"), 
									rs.getString("birth"), 
									rs.getString("gender"), 
									rs.getString("password"), 
									rs.getInt("admin"));
				mlist.add(member);
				System.out.println("member"+member);
			}
		}catch(SQLException e) {
		}
		
		
		
		//3. 모델 <- 비즈니스 로직 수행의 결과.
		//request.setAttribute("키값",데이터);
		request.setAttribute("memberList",mlist);
		System.out.println("memberList"+mlist);
		
		
		
		
		
		
		//4. 뷰
		return "/admin/ManagementMember.jsp";
	}

}
