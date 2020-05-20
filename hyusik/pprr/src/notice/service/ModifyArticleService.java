package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import notice.DAO.NoticeContentDAO;
import notice.DAO.NoticeDAO;
import notice.dto.Notice;

//p667
//수정처리요청 컨트롤러에서 호출하는 서비스클래스
public class ModifyArticleService {

	private NoticeDAO noticeDao = new NoticeDAO();
	private NoticeContentDAO contentDao = new NoticeContentDAO();
	
	//p667 17
	public void modify(ModifyRequest modiReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//p667 23
			//articleDao.selectByID()는 p655 1
			Notice article = noticeDao.selectByID(conn,modiReq.getArticleNumber());

			if(article==null) { //게시글이 없으면
				throw new ArticleNotFoundException();
			}
			//668 31
			//article테이블에 해당 게시글의 제목수정
			noticeDao.update(conn, modiReq.getTitle(), modiReq.getArticleNumber());
			//article_content테이블에 해당게시글의 내용수정
			contentDao.update(conn, modiReq.getContent(), modiReq.getArticleNumber());
			
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		}catch(PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}finally {
			JdbcUtil.close(conn);
		}
		
	}

}






