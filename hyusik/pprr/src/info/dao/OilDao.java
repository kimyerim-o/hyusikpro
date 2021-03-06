package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import info.dto.OilDto;
import jdbc.JdbcUtil;

public class OilDao {
	public OilDto select(Connection conn,int restno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from oil where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, restno);
		rs=pstmt.executeQuery();
		OilDto oil = null;
		if(rs.next()) {
			oil=new OilDto(rs.getString("oilname"),
					rs.getString("oiltel"),rs.getInt("gasoline"),
					rs.getInt("disel"),rs.getInt("lpg"),
					rs.getString("company"),rs.getInt("air"),rs.getInt("cleaner"),rs.getInt("mat"));
			System.out.println("OilDao select");
		}return oil;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}
	
	public List<OilDto> selectgasol(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
		try {	
			stmt=conn.createStatement();
			String sql="SELECT * FROM oil ORDER BY gasoline LIMIT 5";
			rs=stmt.executeQuery(sql);
			List<OilDto> oil =new ArrayList<>();
			while(rs.next()) {
				oil.add(new OilDto(rs.getString("oilname"),rs.getInt("gasoline"),
						rs.getInt("disel"),rs.getInt("lpg")));
				System.out.println("OilDao selectgasol");
			}return oil;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<OilDto> selectdisel(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
	  try {	
		stmt=conn.createStatement();
		String sql="SELECT * FROM oil ORDER BY disel LIMIT 5";
		rs=stmt.executeQuery(sql);
		List<OilDto> oil =new ArrayList<>();
		while(rs.next()) {
			oil.add(new OilDto(rs.getString("oilname"),rs.getInt("gasoline"),
					rs.getInt("disel"),rs.getInt("lpg")));
			System.out.println("OilDao selectdisel");
		}return oil;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
	}
	}


	public List<OilDto> selectlpg(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs=null;
	  try {	
		stmt=conn.createStatement();
		String sql="SELECT * FROM oil ORDER BY lpg LIMIT 6";
		rs=stmt.executeQuery(sql);
		List<OilDto> oil =new ArrayList<>();
		while(rs.next()) {
			oil.add(new OilDto(rs.getString("oilname"),rs.getInt("gasoline"),
					rs.getInt("disel"),rs.getInt("lpg")));
			System.out.println("OilDao selectlpg");
		}return oil;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
	}
	}

	public int update(Connection conn, int restno, String oilname, String oiltel, int gasoline, int disel, int lpg,
			String company, int air, int cleaner, int mat) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="update oil set oilname=?, oiltel=?, gasoline=?, disel=?," + 
					" lpg=?, company=?, air=?, cleaner=?, mat=? where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oilname);
			pstmt.setString(2, oiltel);
			pstmt.setInt(3, gasoline);
			pstmt.setInt(4, disel);
			pstmt.setInt(5, lpg);
			pstmt.setString(6, company);
			pstmt.setInt(7, air);
			pstmt.setInt(8, cleaner);
			pstmt.setInt(9, mat);
			pstmt.setInt(10, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int insert(Connection conn, int restno, String oilname, String oiltel, int gasoline, int disel, int lpg, String company,
			int air, int cleaner, int mat) throws Exception {
		PreparedStatement pstmt=null;
		  try {	
			String sql="insert into oil(oilname, oiltel, gasoline, disel,lpg, company, air, cleaner, mat,restno) values (?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oilname);
			pstmt.setString(2, oiltel);
			pstmt.setInt(3, gasoline);
			pstmt.setInt(4, disel);
			pstmt.setInt(5, lpg);
			pstmt.setString(6, company);
			pstmt.setInt(7, air);
			pstmt.setInt(8, cleaner);
			pstmt.setInt(9, mat);
			pstmt.setInt(10, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int delete(Connection conn, int restno) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from oil where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}
}
