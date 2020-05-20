package review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import info.service.InfoData;
import info.service.InfoService;
import mvc.command.CommandHandler;
import review.service.ReviewListView;
import review.service.GetMessageListService;

//전체목록보기 요청 담당 컨트롤러
//P652
public class ListReviewHandler implements CommandHandler {
	
	//View
		private static final String FORM_VIEW = 
				"review_list.jsp";

	//Service
	private GetMessageListService listService = GetMessageListService.getInstance();
	private InfoService infoService = new InfoService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) { 
			return processSubmit(request,response);
		}else {
			//405에러
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED); 
			return   null;
		}
	}
	
		//GET방식으로  요청이 들어오면  폼(/view/article/newArticleForm.jsp)을 보여주기
		private String processForm(HttpServletRequest request, HttpServletResponse response) {
			return FORM_VIEW;
		}

		//POST방식으로 요청이 들어오면
		private String processSubmit(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
			
			//1.파라미터 받기
			String reststr = request.getParameter("site");
			int restno = 0;
			if (reststr != null) {
				restno = Integer.parseInt(reststr);
			}
			
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
				
			//2.비즈니스로직(<->Service<->DAO<->DB)
			InfoData infoData= infoService.getInfo(restno);
			GetMessageListService messageListService = GetMessageListService.getInstance();
			ReviewListView viewData = messageListService.getMessageList(pageNumber);
			 
			//3.Model
			request.setAttribute("infoData", infoData);
			request.setAttribute("viewData", viewData);
					
			//4.View
			return FORM_VIEW; 
		}	
}








