package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import notice.DAO.NoticeDAO;
import notice.dto.Notice;

//p658
//게시글 상세조회 요청 컨트롤러에서 호출하는 서비스클래스
public class ReadArticleService {
	
	
	//Article테이블연동
	private NoticeDAO noticeDao = new NoticeDAO();
	
	//조회수증가 : 조회수증가시 true전달
	//조회수 증가 및 특정글번호 내용 조회
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) {
		
		try {
			Connection conn  =
				ConnectionProvider.getConnection();

			//특정글번호 article조회
			Notice notice = noticeDao.selectByID(conn, articleNum);
			
			if( notice==null ) {//특정글번호 article조회실패 p659 20 
				throw new ArticleNotFoundException();
			}
			
			//조회수증가
			if (increaseReadCount==true ) {
				noticeDao.incrementReadCount(conn, articleNum);
			}
			return new ArticleData(notice);
			
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	
		
	}
}
