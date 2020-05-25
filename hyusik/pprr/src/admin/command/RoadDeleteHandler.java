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
import info.service.NotFoundException;
import mvc.command.CommandHandler;
import road.RoadDto;
import road.RoadService;

public class RoadDeleteHandler implements CommandHandler {
	private RoadService roadService=new RoadService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			try {			
				return "/admin/admin_roadgong.jsp";
			}catch(NotFoundException e) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
		}


		private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("processSubmit");
			String rono=request.getParameter("rono");
			Map<String,Boolean> errors=new HashMap<>();
			request.setAttribute("errors", errors);
			if(!errors.isEmpty()) {
				return "/admin/admin_info.jsp";
			}
			try{
				roadService.delete(rono);
				return "/admin/road_delete_success.jsp";
			}catch(NotFoundException e) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return null;
			}
		}

}
