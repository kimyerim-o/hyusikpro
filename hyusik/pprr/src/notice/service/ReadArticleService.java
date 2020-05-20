package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import notice.DAO.NoticeContentDAO;
import notice.DAO.NoticeDAO;
import notice.dto.Notice;
import notice.dto.NoticeContent;

//p658
//게시글 상세조회 요청 컨트롤러에서 호출하는 서비스클래스
public class ReadArticleService {
	
	
	//Article테이블연동
	private NoticeDAO noticeDao = new NoticeDAO();
	//Article_content 테이블연동
	private NoticeContentDAO contentDao = new NoticeContentDAO();
	
	//조회수증가 : 조회수증가시 true전달
	//조회수 증가 및 특정글번호 내용 조회
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) {
		
		try {
			Connection conn  =
				ConnectionProvider.getConnection();

			//특정글번호 article조회
			Notice article = noticeDao.selectByID(conn, articleNum);
			
			if( article==null ) {//특정글번호 article조회실패 p659 20 
				throw new ArticleNotFoundException();
			}
			
			//특정글번호 article_contnet조회 p659 23
			NoticeContent content = contentDao.selectByID(conn, articleNum);
			if( content==null ) {
				throw new ArticleContentNotFoundException();
			}
			//조회수증가
			if (increaseReadCount==true ) {
				noticeDao.incrementReadCount(conn, articleNum);
			}
			return new ArticleData(article,content);
			
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	
		
	}
}
