package join.service;

//p594
//JoinRequest는 유저가 입력한 폼(joinForm.jsp)의 내용을
//이 클래스의 객체로 담아서
//JoinService전달 
public class JoinRequest {

	//변수
	private String email;			//이메일
	private String jname;			//닉네임	
	private String password;		//비밀번호
	private String confirmPassword;	//비밀번호확인
	public String getEmail() {
		return email;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	//생성자
	
	/*
	 * 
	 * public String getId() { return id; }
	 * 
	 * 
	 * public void setId(String id) { this.id = id; }
	 * 
	 * 
	 * public String getName() { return name; }
	 * 
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * 
	 * public String getPassword() { return password; }
	 * 
	 * 
	 * public void setPassword(String password) { this.password = password; }
	 * 
	 * 
	 * public String getConfirmPassword() { return confirmPassword; }
	 * 
	 * 
	 * public void setConfirmPassword(String confirmPassword) { this.confirmPassword
	 * = confirmPassword; }
	 */
	//함수
	//P594 44~595 끝
	
	
}







