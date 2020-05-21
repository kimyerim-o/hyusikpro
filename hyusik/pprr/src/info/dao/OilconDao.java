package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import info.dto.OilconDto;
import jdbc.JdbcUtil;

public class OilconDao {
	public List<OilconDto> select(Connection conn,int restno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from oilcon where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, restno);
		rs=pstmt.executeQuery();
		List<OilconDto> oilcon =new ArrayList<>();
		while(rs.next()) {
			oilcon.add(new OilconDto(rs.getString("oilconname"),rs.getString("oilconde")));
			System.out.println("oilcon select");
		}return oilcon;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

	public int update(Connection conn, int restno, String oilconname, String oilconde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="update oilcon set oilconname=?, oilconde=? where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oilconname);
			pstmt.setString(2, oilconde);
			pstmt.setInt(3, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int insert(Connection conn, int restno, String oilconname, String oilconde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="insert into oilcon (oilconname, oilconde,restno) values (?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oilconname);
			pstmt.setString(2, oilconde);
			pstmt.setInt(3, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int restno) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from oilcon where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}
}
