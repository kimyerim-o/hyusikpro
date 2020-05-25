package road;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import info.dto.BrandDto;
import jdbc.JdbcUtil;

public class RoadDao {

	public List<RoadDto> select(Connection conn) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from road";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		List<RoadDto> road =new ArrayList<>();
		while(rs.next()) {
			System.out.println("road select");
			road.add(new RoadDto(rs.getInt("rono"),rs.getString("sitname"),rs.getString("direction"),rs.getString("msg"),rs.getString("type"),rs.getString("startday"),rs.getInt("blocktype")));
		}return road;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

	public int update(Connection conn, Integer rono, String sitname, String msg, String direction, String type, int blocktype,
			String startday) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="update road set sitname=?, msg=?,direction=?,type=?,blocktype=?,startday=? where rono=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sitname);
			pstmt.setString(2, msg);
			pstmt.setString(3, direction);
			pstmt.setString(4, type);
			pstmt.setInt(5, blocktype);
			pstmt.setString(6, startday);
			pstmt.setInt(7, rono);
			System.out.println(pstmt);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int delete(Connection conn, String rono) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from road where rono=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rono);
			System.out.println(pstmt);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}

}
