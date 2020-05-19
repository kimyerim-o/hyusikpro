package member;

public class member {
	private String email;
	private String name;
	private String password;
	private String birthday;
	private String Gender;
	
	
	public member (String email, String name, String password, String birthday, String Gender) {
		this.email=email;
		this.name=name;
		this.password=password;
		this.birthday= birthday;
		this.Gender=Gender;
	}





	public member(String email, String name) {
		this.email=email;
		this.name=name;
	}





	public String getEmail() {
		return email;
	}


	public String getName() {
		return name;
	}


	public String getPassword() {
		return password;
	}


	public String getBirthday() {
		return birthday;
	}


	public String getGender() {
		return Gender;
	}
	public boolean matchPassword(String pwd) {
		return password.equals(password);
	}
	
	
}
