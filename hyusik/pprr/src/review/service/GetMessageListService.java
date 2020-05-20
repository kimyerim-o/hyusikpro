package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import info.dao.RestinfoDao;
import info.dto.BrandDto;
import info.dto.FoodDto;
import info.dto.OilDto;
import info.dto.OilconDto;
import info.dto.RestconDto;
import info.dto.RestinfoDto;
import info.service.InfoData;
import info.service.NotFoundException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.dao.ReviewDao;
import review.dto.ReviewDto;

public class GetMessageListService {
	private static GetMessageListService instance = new GetMessageListService();

	public static GetMessageListService getInstance() {
		return instance;
	}

	private GetMessageListService() {}
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	public ReviewListView getMessageList(int pageNumber) {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			ReviewDao messageDao = ReviewDao.getInstance();

			int messageTotalCount = messageDao.selectCount(conn);

			List<ReviewDto> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if (messageTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList =
						messageDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new ReviewListView(messageList,
					messageTotalCount, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}