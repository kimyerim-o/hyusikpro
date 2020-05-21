package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import info.dto.RestconDto;
import jdbc.JdbcUtil;

public class RestconDao {
	public List<RestconDto> select(Connection conn,int restno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from restcon where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, restno);
		rs=pstmt.executeQuery();
		List<RestconDto> restcon =new ArrayList<>();
		while(rs.next()) {
			restcon.add(new RestconDto(rs.getString("conname"),rs.getString("conde")));
			System.out.println("restcon select");
		}return restcon;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

	public int update(Connection conn, int restno, String conname, String conde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="update restcon set conname=?, conde=? where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, conname);
			pstmt.setString(2, conde);
			pstmt.setInt(3, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int insert(Connection conn, int restno, String conname, String conde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="insert into restcon (conname, conde,restno) values (?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, conname);
			pstmt.setString(2, conde);
			pstmt.setInt(3, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int restno) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from restcon where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}
}
