package review.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.dao.ReviewDao;
import review.dto.ReviewDto;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}

	public void write(ReviewDto review,String rest) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ReviewDao reviewDao = ReviewDao.getInstance();
			
			String restname=null;
			String restno = null;
			String[] rests=rest.split(",");
			for(int i=0;i<rests.length;i++) {
				restname=rests[0];
				restno=rests[1];
			}
			reviewDao.insert(conn,review,restname,restno);
			
			
			
		} catch (SQLException e) {
			throw new ServiceException(
					"메시지 등록 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}