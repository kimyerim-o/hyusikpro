package main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.NotFoundException;
import mvc.command.CommandHandler;
import review.service.ReviewData;
import review.service.ReviewService;

public class MainHandler implements CommandHandler {
	
	private ReviewService reviewService=new ReviewService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainHandler");
		try {
			ReviewData nameis =reviewService.getStis();
			request.getSession().setAttribute("nameis",nameis);
			return "/index.jsp";
		}catch(NotFoundException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		return null;
	}

}
