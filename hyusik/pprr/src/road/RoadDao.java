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
			road.add(new RoadDto(rs.getString("sitname"),rs.getString("direction"),rs.getString("msg"),rs.getString("type"),rs.getString("startday"),Integer.parseInt(rs.getString("blocktype"))));
		}return road;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

}
