package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import info.dto.RestinfoDto;
import jdbc.JdbcUtil;

public class RestinfoDao {
	public RestinfoDto select(Connection conn,int restno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from restinfo where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, restno);
		rs=pstmt.executeQuery();
		RestinfoDto restinfo = null;
		if(rs.next()) {
			restinfo=new RestinfoDto(rs.getString("restname"),
					rs.getString("theme"),rs.getString("themede"),
					rs.getString("resttel"),rs.getString("restadd"),
					rs.getString("firstfood"),rs.getString("truck"),
					rs.getString("maintenance"),rs.getString("wifi"),
					rs.getInt("m_toilet"),rs.getInt("w_toilet"),
					rs.getInt("topark"),rs.getInt("spark"),
					rs.getInt("bpark"),rs.getString("jpark"),
					rs.getString("block"),rs.getString("pregnant"));
			System.out.println("restinfo select");
		}return restinfo;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

	public List<RestinfoDto> selectName(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
		try {	
			System.out.println("RestinfoDao selectName");
			stmt=conn.createStatement();
			String sql="SELECT restno, restname FROM restinfo";
			rs=stmt.executeQuery(sql);
			List<RestinfoDto> restinfo =new ArrayList<>();
			while(rs.next()) {
				restinfo.add(new RestinfoDto(rs.getInt("restno"),rs.getString("restname")));
			}return restinfo;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
}
