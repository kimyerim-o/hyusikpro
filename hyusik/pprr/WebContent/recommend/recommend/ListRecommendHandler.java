package recommend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class ListRecommendHandler implements CommandHandler {

	private ListRecommendService listService = new ListRecommendService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		RecommendPage recommendPage = listService.getRecommendPage(pageNo);
		req.setAttribute("recommendPage", recommendPage);
		return "/recommend/re.jsp"; 
	}


}
