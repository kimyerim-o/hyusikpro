package member.command;

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
import member.Member;
import mvc.command.CommandHandler;

public class MemberModHandler implements CommandHandler {
	private MemberModifyService modifyService=new MemberModifyService();
	
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
			return "/mypage/mypage.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}


	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Member member=new Member(request.getParameter("pwd"),request.getParameter("joinDate"));
		try{
			modifyService.modify(member);
			return "/mypage/mypage.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
