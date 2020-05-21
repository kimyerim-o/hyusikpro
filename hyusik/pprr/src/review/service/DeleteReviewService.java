package review.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.dao.ReviewDao;
import review.dto.ReviewDto;

public class DeleteReviewService {

	private static DeleteReviewService instance = new DeleteReviewService();

	public static DeleteReviewService getInstance() {
		return instance;
	}

	private DeleteReviewService() {}

	public void delete(int reno, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			ReviewDao messageDao = ReviewDao.getInstance();
			ReviewDto message = messageDao.select(conn, reno);
			if (message == null) {
				throw new MessageNotFoundException("no message");
			}
			if (!message.matchPassword(password)) {
				throw new InvalidPasswordException("bad password");
			}
			messageDao.delete(conn, reno);
			
			conn.commit();
		} catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("delete fail:" + ex.getMessage(), ex);
		} catch (InvalidPasswordException | MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} finally {
			JdbcUtil.close(conn);
		}
	}
}