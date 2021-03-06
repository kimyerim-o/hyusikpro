package info.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import info.dao.*;
import info.dto.*;
import jdbc.connection.ConnectionProvider;

public class InfoService {
	private BrandDao brandDao=new BrandDao();
	private FoodDao foodDao=new FoodDao();
	private OilconDao oilconDao=new OilconDao();
	private OilDao oilDao=new OilDao();
	private RestconDao restconDao=new RestconDao();
	private RestinfoDao restinfoDao=new RestinfoDao();
	
	
	public InfoData getInfo(int restno) {
		try(Connection conn=ConnectionProvider.getConnection()) {
			List <BrandDto> brand=brandDao.select(conn, restno);
			List <FoodDto> food=foodDao.select(conn, restno);
			List <OilconDto> oilcon=oilconDao.select(conn, restno);
			OilDto oil=oilDao.select(conn, restno);
			List <RestconDto> restcon=restconDao.select(conn, restno);
			RestinfoDto restinfo=restinfoDao.select(conn, restno);
			if(brand==null) 
				throw new NotFoundException();
			if(food==null)
				throw new NotFoundException();
			if(oilcon==null)
				throw new NotFoundException();
			if(oil==null)
				throw new NotFoundException();
			if(restcon==null)
				throw new NotFoundException();
			if(restinfo==null)
				throw new NotFoundException();
			
			return new InfoData(brand,food,oilcon,oil,restcon,restinfo);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
