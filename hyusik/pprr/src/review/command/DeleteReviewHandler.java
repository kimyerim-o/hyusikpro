package review.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import info.service.InfoData;
import info.service.InfoService;
import info.service.NotFoundException;
import mvc.command.CommandHandler;
import review.service.DeleteReviewService;

public class DeleteReviewHandler implements CommandHandler {

	//View
	private static final String FORM_VIEW ="review_confrimDeletion.jsp";
	
	//Service
	//삭제처리용 서비스
	private DeleteReviewService deleteService = DeleteReviewService.getInstance();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return FORM_VIEW;
	}

}








