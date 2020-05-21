package notice.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import notice.dto.Notice;

//p634, 646, 647
//article테이블과 연동하는  DAO
public class NoticeDAO {
	
	//글 삭제
	public int delete(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from notice where nono = ?");
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//665 1
	//글 수정
	public int update(Connection conn, String title, String content, int no) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			String sql="update notice " + 
					"set    notitle= ?, nomoddate=NOW(), nocontent=?" + 
					"where  nono= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);
			int cnt = pstmt.executeUpdate();
			//update성공적으로 실행되면 update된 레코드수가 리턴된다
			//여기에서는 특정 번호만 update되므로 성공시에는 1이 리턴
			return cnt;
		}finally {
			JdbcUtil.close(pstmt);
		}
	}

	//P646 1
	//전체게시물수 구하기(P646 1) pro1/guestbook.dao/MessageDAO.JAVA
	public int selectCount(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select count(*) from notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {//등록된 게시글이 존재하면
				return rs.getInt(1); //전체 게시물수가 리턴
			}
			return 0; //등록된 게시글이 존재x하면  0을 리턴
			
	  }finally {
		JdbcUtil.close(rs);  
		JdbcUtil.close(pstmt);
	  }
	  
	}//end of selectCount
	
	
	//보고싶은 페이지에 해당하는 일부게시물 목록 조회 p647 15
	//p645 참고
	//전체게시글은 1페이지당10개의 게시글 번호,제목,작성자,조회수
	//전체게시글수가 55개라면 
	//요청한 페이지가 n이면, 가장 최근 게시글이 제일 첫페이지지에 출력 순서
	/* 1페이지	의 글번호는	55~46  limit 0, 10 
	 * 2페이지			45~36  limit 10,10 
	 * 3페이지			35~26  limit 20,10
	 * 4페이지			25~16  limit 0시작행번호?, 10
	 */
	
	//모델의 형태가 여러개의 행과 2개이상의 컬럼(컬럼타입)으로 구성되어 있다면
	/*List<클래스> 참조변수 = new ArrayList<>();
			while( rs.next() ) {
				참조변수.add(클래스객체);
				//참조변수.add(new 클래스명());  5,'id1','홍길동','제목1',오늘,오늘,0
				//                         4,'id2','김길','제목2',오늘,오늘,0
				//                         3,'id33','삼삼이','제목3이요',어제,어제,0  
			}
	*/
	public List<Notice> select(Connection conn,int startRow,int size)  
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs   = null;
		try {
			String sql = 
			" select * from  notice " +
			" order by nono desc "+
			" limit ?, ?";
		//limit  0부터시작행번호, 읽어올레코드수
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startRow); //시작행번호
			pstmt.setInt(2,size); //읽어올레코드수
			rs = pstmt.executeQuery();
			List<Notice> result = new ArrayList<>();
			while( rs.next() ) {
				result.add(convertArticle(rs));
			}
			return result;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}	
	}
	
	//select쿼리문 결과를 받아서  Atricle클래스타입으로 묶어주는 함수 p647 36
	private Notice convertArticle(ResultSet rs) 
	    throws SQLException{
		return new Notice(
				rs.getInt("nono"),
				rs.getString("notitle"),
				toDate(rs.getTimestamp("noregdate")),
				toDate(rs.getTimestamp("nomoddate")),
				rs.getString("nocontent"),
				rs.getInt("noview"));
	}

	//Timestamp타입을 Date타입으로 변환 p648 47
	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}


	public Notice insert(Connection conn,Notice notice) throws SQLException {
		PreparedStatement pstmt = null;
		//article테이블에서 입력된 마지막 article_id값을 가져오는
		//쿼리를 실행하기위해 필요한  stmt와
		//그 실행결과를 담기위한 rs변수 선언
		Statement stmt = null;
		ResultSet rs   = null;	
		try {
			String sql = 
			"insert into notice(notitle,noregdate,nomoddate,nocontent,noview) " + 
			" values(?,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,notice.getTitle());
			pstmt.setTimestamp(2, toTimestamp(notice.getRegDate()));
			pstmt.setTimestamp(3, toTimestamp(notice.getModifiedDate()));
			pstmt.setString(4, notice.getContent());
			int insertedCount = pstmt.executeUpdate();
			
			//p635 31
			if(insertedCount>0) { //insert성공시
				//insert시 들어갔던 article_no컬럼을 값을 가져오자
				//그래야지 article_content컬럼에
				//insert할 때 사용할 수 있다
				stmt = conn.createStatement();
				rs   = stmt.executeQuery("select last_insert_id()  "
						+ " from notice");
				if(rs.next()) {
					Integer newNum = rs.getInt(1);
					return new Notice(newNum,notice.getTitle(),
							notice.getRegDate(),notice.getModifiedDate(),notice.getContent(),
							0);
				}
			}
			return null; //insert 실패시
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	
	//Date타입을 Timestamp타입으로 변환
	private  Timestamp toTimestamp(Date date) {
		return new  Timestamp(date.getTime());
	}



	//article테이블의 특정글번호 조회수 증가	 p656 20
	public void incrementReadCount(Connection conn, 
			int no) throws SQLException{
		try {
			String sql = 
				"update notice " + 
				" set   noview=noview+1 " + 
				" where nono=?";
			PreparedStatement pstmt =
				conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}finally {
			
		}
		
	}
	
	//P655 1
	//article테이블의 특정글번호 조회
	public Notice selectByID(Connection conn, int no) 
		throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = 
			"select	* from  notice " +
			" where nono=?";
			pstmt =	conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();//p655 8
			
			Notice article = null;
			if(rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

}











