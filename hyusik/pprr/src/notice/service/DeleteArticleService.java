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
public class DeleteArticleService {

	private NoticeDAO noticeDao = new NoticeDAO();
	private NoticeContentDAO contentDao = new NoticeContentDAO();
	
	//p667 17
	public int deletenotice(int no) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			return noticeDao.delete(conn, no);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public int deletecontent(int no) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			return contentDao.delete(conn, no);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}






