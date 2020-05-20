package review.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import review.dto.ReviewDto;

public class ReviewDao {

	public List<ReviewDto> selectNameis(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
		try {	
			System.out.println("ReviewDao selectNameis");
			stmt=conn.createStatement();
			String sql="SELECT restno,restname,restis FROM review where redate like '2020__' order by restis desc limit 5";
			rs=stmt.executeQuery(sql);
			List<ReviewDto> review =new ArrayList<>();
			while(rs.next()) {
				review.add(new ReviewDto(rs.getString("restno"),rs.getString("restname"),rs.getDouble("restis")));
			}return review;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

}
