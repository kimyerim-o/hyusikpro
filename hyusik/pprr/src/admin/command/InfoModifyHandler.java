package admin.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.InfoModifyService;
import info.dto.BrandDto;
import info.dto.FoodDto;
import info.dto.OilDto;
import info.dto.OilconDto;
import info.dto.RestconDto;
import info.dto.RestinfoDto;
import info.service.InfoData;
import info.service.InfoService;
import info.service.NotFoundException;
import mvc.command.CommandHandler;

public class InfoModifyHandler implements CommandHandler {
	private InfoModifyService modifyService=new InfoModifyService();
	private InfoService infoService=new InfoService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("process"+request.getMethod());
		if(request.getMethod().equals("GET")) {
			return processForm(request,response);
		}else if(request.getMethod().equals("POST")) {
			return processSubmit(request,response);
		}else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String reststr=request.getParameter("site");
			int restno = 0;
			if(reststr!=null) {
				restno=Integer.parseInt(reststr);
			}
			try {
				InfoData infoData=infoService.getInfo(restno);
				request.setAttribute("infoData", infoData);
				request.setAttribute("site", restno);
			return "/admin/info_update.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}


	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reststr=request.getParameter("site");
		int restno = 0;
		if(reststr!=null) {
			restno=Integer.parseInt(reststr);
		}
		
		String[] brandname=request.getParameterValues("brandname");
		String brandnames="";
		for(int i=0;i<brandname.length;i++){
			brandnames += brandname[i]+",";
		}
		
		String[] brandde=request.getParameterValues("brandde");
		String branddes="";
		for(int i=0;i<brandde.length;i++){
			branddes += brandde[i]+",";
		}
		
		String[] foodname=request.getParameterValues("foodname");
		String foodnames="";
		for(int i=0;i<foodname.length;i++){
			foodnames += foodname[i]+",";
		}
		String[] foodcost=request.getParameterValues("foodcost");
		String foodcosts="";
		for(int i=0;i<foodcost.length;i++){
			foodcosts += foodcost[i]+",";
		}
		String[] season=request.getParameterValues("season");
		String seasons="";
		for(int i=0;i<season.length;i++){
			seasons += season[i]+",";
		}
		String[] foodma=request.getParameterValues("foodma");
		String foodmas="";
		for(int i=0;i<foodma.length;i++){
			foodmas += foodma[i]+",";
		}
		String[] foodde=request.getParameterValues("foodde");
		String fooddes="";
		for(int i=0;i<foodde.length;i++){
			fooddes += foodde[i]+",";
		}
		
		String[] oilconname=request.getParameterValues("oilconname");
		String oilconnames="";
		for(int i=0;i<oilconname.length;i++){
			oilconnames += oilconname[i]+",";
		}
		String[] oilconde=request.getParameterValues("oilconde");
		String oilcondes="";
		for(int i=0;i<oilconde.length;i++){
			oilcondes += oilconde[i]+",";
		}
		String[] conname=request.getParameterValues("conname");
		String connames="";
		for(int i=0;i<conname.length;i++){
			connames += conname[i]+",";
		}
		String[] conde=request.getParameterValues("conde");
		String condes="";
		for(int i=0;i<conde.length;i++){
			condes += conde[i]+",";
		}
		
		RestinfoDto restinfoDto=new RestinfoDto(request.getParameter("restname"), request.getParameter("theme"), request.getParameter("themede"), request.getParameter("resttel"), request.getParameter("restadd"), request.getParameter("firstfood"), request.getParameter("truck"), request.getParameter("maintenance"), request.getParameter("wifi"), Integer.parseInt(request.getParameter("m_toilet")), Integer.parseInt(request.getParameter("w_toilet")), Integer.parseInt(request.getParameter("topark")), Integer.parseInt(request.getParameter("spark")), Integer.parseInt(request.getParameter("bpark")), request.getParameter("jpark"), request.getParameter("block"), request.getParameter("pregnant"));
		RestconDto restconDto=new RestconDto(connames, condes);
		BrandDto brandDto=new BrandDto(brandnames, branddes);
		FoodDto foodDto=new FoodDto(foodnames, foodcosts ,seasons, foodmas, fooddes);
		OilDto oilDto=new OilDto(request.getParameter("oilname"), request.getParameter("oiltel"), Integer.parseInt(request.getParameter("gasoline")), Integer.parseInt(request.getParameter("disel")), Integer.parseInt(request.getParameter("lpg")),request.getParameter("company"),Integer.parseInt(request.getParameter("air")), Integer.parseInt(request.getParameter("cleaner")), Integer.parseInt(request.getParameter("mat")));
		OilconDto oilconDto=new OilconDto(oilconnames, oilcondes);
		
		Map<String,Boolean> errors=new HashMap<>();
		request.setAttribute("errors", errors);
		if(!errors.isEmpty()) {
			return "/admin/info_update.jsp";
		}
		try{
			modifyService.modify(restno,restinfoDto,restconDto,brandDto,foodDto,oilDto,oilconDto);
			return "/admin/info_update_success.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
