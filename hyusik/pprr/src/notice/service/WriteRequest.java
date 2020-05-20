package notice.service;

import java.util.Map;

//p637
//글입력에 필요한 데이터를 제공
public class WriteRequest {
	
	private String title;		//title컬럼용	 
	private String content;		//content컬럼용 
	
	
	//WriteRequest(String writer_id,String writer_name,String title,String content) {
	public WriteRequest(String title,String content) {
		this.title		=title;
		this.content	=content;
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
	
	//p638 31
	//title이 null인지에대한 체크=>유효성검사
	public void validate(Map<String, Boolean> errors) {
		if( title==null || title.trim().isEmpty() ) {
			errors.put("title",Boolean.TRUE);
		}
	}
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        







