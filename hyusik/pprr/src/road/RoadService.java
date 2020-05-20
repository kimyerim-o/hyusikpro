package road;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import info.service.NotFoundException;
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

}
