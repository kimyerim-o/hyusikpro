package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import review.dto.ReviewDto;

public class ReviewDao {
	
	private static ReviewDao reviewDao = new ReviewDao();
	public static ReviewDao getInstance() {
		return reviewDao;
	}
	private ReviewDao() {}
	
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
				review.add(new ReviewDto(rs.getInt("restno"),rs.getString("restname"),rs.getDouble("restis")));
			}return review;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public int insert(Connection conn, ReviewDto review) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into review " + 
					"(name,repw,restno,restname,redate,restis,recontent) values (?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, review.getName());
			pstmt.setString(2, review.getRepw());
			pstmt.setInt(3, review.getReno());
			pstmt.setString(4, review.getRestname());
			pstmt.setString(5, toString(review.getRedate()));
			pstmt.setDouble(6, review.getRestis());
			pstmt.setString(7, review.getRecontent());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	//Date를 String으료
	//java date fommater"yyyymmdd"
	 private String toString(Date redate){ 
		 Date date = new Date();
		 String datestr = new SimpleDateFormat("yyyyMMdd").format(date);
		 return datestr;
	 }		 
	 

	public ReviewDto select(Connection conn, int reno) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from review where reno = ?");
			pstmt.setInt(1, reno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private ReviewDto makeMessageFromResultSet(ResultSet rs) throws SQLException {
		ReviewDto review = new ReviewDto();
		review.setReno(rs.getInt("reno"));
		review.setRestno(rs.getInt("restno"));
		review.setRestname(rs.getString("restname"));
		review.setName(rs.getString("name"));
		review.setRepw(rs.getString("repw"));
		review.setRedate(rs.getDate("redate"));
		review.setRecontent(rs.getString("recontent"));
		review.setRestis(rs.getDouble("restis"));
		return review;
	}
	

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from review");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<ReviewDto> selectList(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from review " + 
					"order by reno desc limit ?, ?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<ReviewDto> messageList = new ArrayList<ReviewDto>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int reno) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from review where reno = ?");
			pstmt.setInt(1, reno);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

}
