package notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import notice.service.ArticleNotFoundException;
import notice.service.DeleteArticleService;

public class DeleteArticleHandlerAdmin implements CommandHandler {

	//View
	private static final String FORM_VIEW ="deleteSuccess.jsp";
	
	//Service
	//수정처리용 서비스
	private DeleteArticleService deleteService = new DeleteArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String noVal = request.getParameter("no");
		int no = 0;
		if(noVal != null) {
			no = Integer.parseInt(noVal);
		}else {
			throw new ArticleNotFoundException();
		}
		int success1 = deleteService.deletenotice(no);
		int success2 = deleteService.deletecontent(no);
		
		if(success1==1 && success2==1) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		return FORM_VIEW;
	}

}







