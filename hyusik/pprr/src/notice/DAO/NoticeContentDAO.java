package notice.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import notice.dto.NoticeContent;

//P636
//article_content테이블과 연동하는  DAO
public class NoticeContentDAO {
	
	//글 삭제
		public int delete(Connection conn, int no) throws SQLException {
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(
						"delete from notice_content where nono = ?");
				pstmt.setInt(1, no);
				return pstmt.executeUpdate();
			} finally {
				JdbcUtil.close(pstmt);
			}
		}
	
	//665 1
		//글 수정
		public int update(Connection conn, String content, int no) throws SQLException{
			PreparedStatement pstmt = null;
			try {
				String sql="update notice_content " + 
						"set    nocontent=? " + 
						"where  nono=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, no);
				int cnt = pstmt.executeUpdate();
				//update성공적으로 실행되면 update된 레코드수가 리턴된다
				//여기에서는 특정 번호만 update되므로 성공시에는 1이 리턴
				return cnt;
			}finally {
				JdbcUtil.close(pstmt);
			}
		}
		
	//글 입력	
	public NoticeContent insert(Connection conn, NoticeContent content) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql =
				"insert into notice_content(nono,nocontent) " + 
				" values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,content.getNumber());
			pstmt.setString(2,content.getContent() );
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount>0) { //insert쿼리 실행성공시
				return content;
			}else {
				return null;
			}
			
		}finally {
			JdbcUtil.close(pstmt);
		}
	}

	//특정글번호 article_contnet조회 p656 1
	public NoticeContent selectByID(Connection conn, 
			int no)  throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql =
				  "select nono, nocontent "
				+ "from   notice_content "
				+ "where  nono=?";		  
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			
			rs = pstmt.executeQuery(); //p656 8
			NoticeContent content = null;
			if(rs.next()) {
				content = new NoticeContent(
							rs.getInt("nono"),
							rs.getString("nocontent"));
				return content;
			}
			return content;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
}






