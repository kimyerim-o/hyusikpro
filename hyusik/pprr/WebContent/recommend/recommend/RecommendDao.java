package recommend;

import java.awt.List;
import java.io.Writer;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jdbc.JdbcUtil;




public class RecommendDao<Recommend> {
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from recommend");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;	
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
		
		public List select(Connetion conn, int startRow, int size) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.PrepareStatement("select * from article " + "order by article_no desc limit ?,?");
				pstmt.setInt(1, startRow);
				pstmt.selInt(2, size);
				rs = pstmt.executeQuery();
				List result = new ArrayList();
				while (rs.next()) {
					result.add(convertArticle(rs));
				}
				return result;
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
	}
		
		
		 private Recommend convertRecommend(ResultSet rs)throws SQLException {
			 return new Recommend(rs.getInt("recommend_no"),
					 new Writer (
							 rs.getString("writer_id")
							 rs.getString("writer_name")),
					 rs.getString("title"),
					 toDate(rs.getTimestamp("regdate"))
					 toDate(rs.getTimestamp("moddate")),
					 rs.getInt("read_cnt"));
			 }
		 
		 private Date toDate(Timestamp timestamp) {
			 return new Date(timestamp,getTime());
		 }

		 public void RecommendPage(int total int currentPage, int size List content) {
			 this.total = total;
			 this.currentPage = currentPage;
			 this.content = content;
			 if (total == 0) {
				 totalPages = 0;
				 startPage = 0;
				 endPage = 0;
			 } else {
				 totalPages = total / size;
				 if (total % size > 0) {
					 totalPages++;
				 }
				 int modVal = currentPage % 5;
				 startPage = currentPage / 5 * 5 + 1;
				 if (modVal == 0) startPage -= 5;
				 
				 endPage = startPage + 4;
				 if(endPage > totalPages)endPage = totalPages;
			 }
		 }
		 
		 
			
		 }
}
		 
		 