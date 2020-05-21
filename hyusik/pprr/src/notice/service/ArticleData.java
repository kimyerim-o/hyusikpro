package notice.service;

import notice.dto.Notice;

//p657
//article테이블과 article_content테이블의 결과를 
//하나의 객체로 묶어주는 클래스
public class ArticleData {

	private Notice notice;
	
	public ArticleData(Notice notice) {
		this.notice = notice;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	@Override
	public String toString() {
		return "ArticleData [notice=" + notice + "]";
	}

	
}









