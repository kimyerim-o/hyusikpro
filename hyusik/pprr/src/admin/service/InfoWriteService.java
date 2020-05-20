package admin.service;

import java.sql.Connection;
import java.sql.SQLException;

import info.dao.BrandDao;
import info.dao.FoodDao;
import info.dao.OilDao;
import info.dao.OilconDao;
import info.dao.RestconDao;
import info.dao.RestinfoDao;
import info.dto.BrandDto;
import info.dto.FoodDto;
import info.dto.OilDto;
import info.dto.OilconDto;
import info.dto.RestconDto;
import info.dto.RestinfoDto;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class InfoWriteService {
	private BrandDao brandDao=new BrandDao();
	private FoodDao foodDao=new FoodDao();
	private OilconDao oilconDao=new OilconDao();
	private OilDao oilDao=new OilDao();
	private RestconDao restconDao=new RestconDao();
	private RestinfoDao restinfoDao=new RestinfoDao();
	
	public void create(RestinfoDto restinfoDto, RestconDto restconDto, BrandDto brandDto, FoodDto foodDto,
			OilDto oilDto, OilconDto oilconDto) {
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int restno=restinfoDto.getRestno();
			
			int restinfoSave=restinfoDao.insert(conn,restno,restinfoDto.getRestname(),restinfoDto.getTheme(),restinfoDto.getThemede(),restinfoDto.getResttel(),restinfoDto.getRestadd(),restinfoDto.getFirstfood(),restinfoDto.getTruck(),restinfoDto.getMaintenance(),restinfoDto.getWifi(),restinfoDto.getM_toilet(),restinfoDto.getW_toilet(),restinfoDto.getTopark(),restinfoDto.getSpark(),restinfoDto.getBpark(),restinfoDto.getJpark(),restinfoDto.getBlock(),restinfoDto.getPregnant());
			if(restinfoSave<1) {
				throw new RuntimeException("fail insert restinfo");
			}
	
			String Conname=restconDto.getConname();
			String Conde=restconDto.getConde();
			String[] Connames=Conname.split(",");
			String[] Condes=Conde.split(",");
			for(int i=0;i<Connames.length;i++) {
				System.out.println(Connames[i]+"/"+Condes[i]);
				String conname=Connames[i];
				String conde=Condes[i];
				int c=restconDao.insert(conn,restno,conname,conde);
				if(c<1) {
					throw new RuntimeException("fail insert restcon");
				}
			}
			
			String Brandname=brandDto.getBrandname();
			String Brandde=brandDto.getBrandde();
			String[] Brandnames=Brandname.split(",");
			String[] Branddes=Brandde.split(",");
			for(int i=0;i<Brandnames.length;i++) {
				System.out.println(Brandnames[i]+"/"+Branddes[i]);
				String brandname=Brandnames[i];
				String brandde=Branddes[i];
				int b=brandDao.insert(conn,restno, brandname, brandde);
				if(b<1) {
					throw new RuntimeException("fail insert brand");
				}
			}
			
			//(foodnames, foodcosts ,seasons, foodmas, fooddes);
			String Foodname=foodDto.getFoodname();
			String Foodcost=foodDto.getFoodcost();
			String Season=foodDto.getSeason();
			String Foodma=foodDto.getFoodma();
			String Foodde=foodDto.getFoodde();
			String[] Foodnames=Foodname.split(",");
			String[] Foodcosts=Foodcost.split(",");
			String[] Seasons=Season.split(",");
			String[] Foodmas=Foodma.split(",");
			String[] Fooddes=Foodde.split(",");
			for(int i=0;i<Foodnames.length;i++) {
				System.out.println(Foodnames[i]);
				String foodname=Foodnames[i];
				String foodcost=Foodcosts[i];
				String season=Seasons[i];
				String foodma=Foodmas[i];
				String foodde=Fooddes[i];
				int f=foodDao.insert(conn,restno,foodname,foodcost,season,foodma,foodde);
				if(f<1) {
					throw new RuntimeException("fail insert food");
				}
			}
			
			int oilSave=oilDao.insert(conn,restno,oilDto.getOilname(),oilDto.getOiltel(),oilDto.getGasoline(),oilDto.getDisel(),oilDto.getLpg(),oilDto.getCompany(),oilDto.getAir(),oilDto.getCleaner(),oilDto.getMat());
			if(oilSave<1) {
				throw new RuntimeException("fail insert oil");
			}

			String Oilconname=oilconDto.getOilconname();
			String Oilconde=oilconDto.getOilconde();
			String[] Oilconnames=Oilconname.split(",");
			String[] Oilcondes=Oilconde.split(",");
			for(int i=0;i<Oilconnames.length;i++) {
				System.out.println(Oilconnames[i]+"/"+Oilcondes[i]);
				String oilconname=Oilconnames[i];
				String oilconde=Oilcondes[i];
				int o=oilconDao.insert(conn,restno,oilconname,oilconde);
				if(o<1) {
					throw new RuntimeException("fail insert oilcon");
				}
			}

			
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
		
	}

}
