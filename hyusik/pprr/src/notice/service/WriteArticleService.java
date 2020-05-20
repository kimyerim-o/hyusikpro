package notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import notice.DAO.NoticeContentDAO;
import notice.DAO.NoticeDAO;
import notice.dto.Notice;
import notice.dto.NoticeContent;

//p638
//글등록과 관련한 DAO와 연동
public class WriteArticleService {

	//article테이블과 연동하는  DAO
	private NoticeDAO noticeDao = new NoticeDAO();
	//article_content테이블과 연동하는 DAO
	private NoticeContentDAO contentDao = new NoticeContentDAO();
	
	//P639 19
	public Integer write(WriteRequest req) {
		Connection conn = null;
		try { 
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false); //트랜잭션시작
		
			//dao호출 p639 25
			Notice notice = toArticle(req);
			Notice savedArticle = noticeDao.insert(conn,notice);
			
			if(savedArticle==null) {//insert실패하면 null리턴
			 throw new RuntimeException("fail to insert notice");
			}
			
			//P639 30
			NoticeContent content = 
				new NoticeContent(savedArticle.getNumber(),req.getContent());
			
			//article_content에 insert
			NoticeContent savedContent = contentDao.insert(conn,content);
			if(savedContent==null) { //article_content테이블의 insert실패시
				throw new RuntimeException("fail to insert notice_content");
			}
			
			conn.commit(); //트랜잭션반영
			
			return savedArticle.getNumber();//p639 40
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}catch(RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}
	}

	//p639 52
	//WriteRequest를 통해 받은
	//writer_id 컬럼용,writer_name 컬럼용,title컬럼용,content컬럼용+
	//나머지 
	//regdate,moddate,read_cnt컬럼용 데이터를
	//채우는 함수
	private Notice toArticle(WriteRequest req) {
		Date now = new Date();
		return	new Notice(null,req.getTitle(),now,now,0);
		
	}//end of write
	
	

}







