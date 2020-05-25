package road;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import info.service.NotFoundException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class RoadService {
	private RoadDao roadDao=new RoadDao();
	
	public List<RoadDto> getRoad() {
		try(Connection conn=ConnectionProvider.getConnection()) {
			List<RoadDto> road=roadDao.select(conn);
			if(road==null) 
				throw new NotFoundException();
			return road;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void modify(RoadDto roadDto) {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			int r=roadDao.update(conn,roadDto.getRono(),roadDto.getSitname(),roadDto.getMsg(),roadDto.getDirection(),roadDto.getType(),roadDto.getBlocktype(),roadDto.getStartday());
			if(r<1) 
				throw new RuntimeException("fail update Road");
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
