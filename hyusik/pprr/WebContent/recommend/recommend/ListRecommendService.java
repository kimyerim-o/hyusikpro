package recommend;

import jdbc.connection.ConnectionProvider;

public class ListRecommendService {

	private RecommendDao recommendDao = new RecommendDao();
	private int size = 10;
	
	public RecommendPage getRecommendPage(int pageNum) {
		try {Connection conn = ConnectionProvider.getConnection()) {
			int total = recommendDao.selectCount(conn);
			List content = recommendDao.selectCount(
					conn, (pageNum -1) * size, size);
			return new RecommendPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
