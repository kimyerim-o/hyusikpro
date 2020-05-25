package admin.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

public class RoadModifyHandler implements CommandHandler {
	private RoadService roadService=new RoadService();
	
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
		try {			
			List<RoadDto> roadDto=roadService.getRoad();
			request.setAttribute("roadDto", roadDto);
			return "/admin/admin_roadgong.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}


	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RoadDto roadDto=new RoadDto(Integer.parseInt(request.getParameter("rono")),request.getParameter("sitname"),request.getParameter("direction"),request.getParameter("msg"),request.getParameter("type"),request.getParameter("startday"),Integer.parseInt(request.getParameter("blocktype")));
		System.out.println(roadDto);
		Map<String,Boolean> errors=new HashMap<>();
		request.setAttribute("errors", errors);
		if(!errors.isEmpty()) {
			return "/admin/admin_roadgong.jsp";
		}
		try{
			roadService.modify(roadDto);
			return "/admin/road_update_success.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
