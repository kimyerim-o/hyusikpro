package notice.service;

import java.util.Map;

//p666
//게시글 수정시 필요한
//수정할 게시글번호,사용자id,제목,내용 데이터가를 담는 클래스
public class ModifyRequest {

	private int articleNumber;//게시글번호
	private String title;//제목
	private String content;//내용
	
	public ModifyRequest(int no, String title, String content) {
		articleNumber = no;
		this.title = title;
		this.content = content;
	}
	

	public int getArticleNumber() {
		return articleNumber;
	}

	public void setArticleNumber(int articleNumber) {
		this.articleNumber = articleNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	 
	//경량화 클래스 POJO
	
	@Override
	public String toString() {
		return "ModifyRequest [articleNumber=" + articleNumber + ", title=" + title
				+ ", content=" + content + "]";
	}


	//667 35
	public void validate(Map<String, Boolean> errors) {
		if(title==null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
