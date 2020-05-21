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

	public int update(Connection conn, int restno, String restname, String theme, String themede, String resttel,
			String restadd, String firstfood, String truck, String maintenance, String wifi, int m_toilet, int w_toilet,
			int topark, int spark, int bpark, String jpark, String block, String pregnant) throws SQLException {
		PreparedStatement pstmt=null;
	  try {	
		String sql="update restinfo set restname=?, theme=?, themede=?, resttel=?," + 
				" restadd=?, firstfood=?, truck=?, maintenance=?, wifi=?, m_toilet=?, w_toilet=?," + 
				" topark=?, spark=?, bpark=?, jpark=?, block=?, pregnant=? where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, restname);
		pstmt.setString(2, theme);
		pstmt.setString(3, themede);
		pstmt.setString(4, resttel);
		pstmt.setString(5, restadd);
		pstmt.setString(6, firstfood);
		pstmt.setString(7, truck);
		pstmt.setString(8, maintenance);
		pstmt.setString(9, wifi);
		pstmt.setInt(10, m_toilet);
		pstmt.setInt(11, w_toilet);
		pstmt.setInt(12, topark);
		pstmt.setInt(13, spark);
		pstmt.setInt(14, bpark);
		pstmt.setString(15, jpark);
		pstmt.setString(16, block);
		pstmt.setString(17, pregnant);
		pstmt.setInt(18, restno);
		return pstmt.executeUpdate();
	  }finally {
			JdbcUtil.close(pstmt);
	}
		
	}

	public int insert(Connection conn, int restno, String restname, String theme, String themede, String resttel, String restadd,
			String firstfood, String truck, String maintenance, String wifi, int m_toilet, int w_toilet, int topark,
			int spark, int bpark, String jpark, String block, String pregnant) throws Exception {
		PreparedStatement pstmt=null;
		  try {	
			String sql="insert into restinfo (restname, theme, themede, resttel, restadd, firstfood, truck, maintenance, wifi, m_toilet, w_toilet, topark, spark, bpark, jpark, block, pregnant,restno) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, restname);
			pstmt.setString(2, theme);
			pstmt.setString(3, themede);
			pstmt.setString(4, resttel);
			pstmt.setString(5, restadd);
			pstmt.setString(6, firstfood);
			pstmt.setString(7, truck);
			pstmt.setString(8, maintenance);
			pstmt.setString(9, wifi);
			pstmt.setInt(10, m_toilet);
			pstmt.setInt(11, w_toilet);
			pstmt.setInt(12, topark);
			pstmt.setInt(13, spark);
			pstmt.setInt(14, bpark);
			pstmt.setString(15,jpark);
			pstmt.setString(16, block);
			pstmt.setString(17, pregnant);
			pstmt.setInt(18, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int delete(Connection conn, int restno) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from restinfo where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}

}
