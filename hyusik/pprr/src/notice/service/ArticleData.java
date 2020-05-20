package notice.service;

import notice.dto.Notice;
import notice.dto.NoticeContent;

//p657
//article테이블과 article_content테이블의 결과를 
//하나의 객체로 묶어주는 클래스
public class ArticleData {

	private Notice notice;
	private NoticeContent content;
	
	public ArticleData(Notice notice,
			NoticeContent content) {
		this.notice = notice;
		this.content = content;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice article) {
		this.notice = notice;
	}

	public NoticeContent getContent() {
		return content;
	}

	public void setContent(NoticeContent content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ArticleData [notice=" + notice + ", content=" + content + "]";
	}
	
	
}









