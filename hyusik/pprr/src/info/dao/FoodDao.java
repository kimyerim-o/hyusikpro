package info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import info.dto.FoodDto;
import jdbc.JdbcUtil;

public class FoodDao {
	public List<FoodDto> select(Connection conn,int restno) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	  try {	
		String sql="select * from food where restno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, restno);
		rs=pstmt.executeQuery();
		List<FoodDto> food =new ArrayList<>();
		while(rs.next()) {
			food.add(new FoodDto(rs.getString("foodname"),
					rs.getString("foodcost"),rs.getString("season"),
					rs.getString("foodma"),rs.getString("foodde")));
			System.out.println("food select");
		}return food;
	  }finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
	}
	}

	public int update(Connection conn, int restno, String foodname, String foodcost, String season, String foodma,
			String foodde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="update food set foodname=?, foodcost=?,season=?,foodma=?,foodde=? where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, foodname);
			pstmt.setString(2, foodcost);
			pstmt.setString(3, season);
			pstmt.setString(4, foodma);
			pstmt.setString(5, foodde);
			pstmt.setInt(6, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
		
	}

	public int insert(Connection conn, int restno, String foodname, String foodcost, String season, String foodma, String foodde) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="insert into food (foodname, foodcost,season,foodma,foodde,restno) values (?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, foodname);
			pstmt.setString(2, foodcost);
			pstmt.setString(3, season);
			pstmt.setString(4, foodma);
			pstmt.setString(5, foodde);
			pstmt.setInt(6, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int restno) throws SQLException {
		PreparedStatement pstmt=null;
		  try {	
			String sql="delete from food where restno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, restno);
			return pstmt.executeUpdate();
		  }finally {
				JdbcUtil.close(pstmt);
		}
	}
}
