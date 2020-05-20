package road;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import info.service.NotFoundException;
import mvc.command.CommandHandler;

public class RoadHandler implements CommandHandler {
	private RoadService roadService=new RoadService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RoadHandler");
		try {
			List<RoadDto> roadDto=roadService.getRoad();
			request.setAttribute("roadDto", roadDto);
			return "/road/roadgong.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
				
		return null;
	}

}
