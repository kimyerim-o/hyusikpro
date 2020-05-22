package member;

//p591
//여기에서는 db의 member테이블과 관련한 데이터를 담는 클래스
//VO(Value Object)
//DTO(Data Transfer Object)
//MemeberVO
//MemberDTO
public class Member {
	//변수
	private String email;		//memberemail컬럼용
	private String name;		//name컬럼용
	private String password;	//password컬럼용
	private String birth; 		//regdate컬럼용
	private String gender;		//gender 컬럼용
	private int admin;		//admin 컬럼용
	
	//생성
	
	public Member(String email, String name, String birth, String gender,String password ,int admin) {
		this.email = email;
		this.name = name;
		this.password = password;
		this.birth = birth;
		this.admin =admin;
		this.gender=gender;
		
	}

	public Member(String email, String name, String password, String birth, String gender) {
		this.email = email;
		this.name = name;
		this.password = password;
		this.birth = birth;
		this.gender=gender;
	}

	public Member(String password, String birth) {

		this.name = name;
		this.password = password;
		this.birth = birth;// TODO Auto-generated constructor stub
	}

	//getter & setter
	public String getemail() {
		return email;
	}
	public void setId(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getbirth() {
		return birth;
	}
	public void setRegDate(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}

	//p592 35~37
	//비밀번호 일치여부 체크
	public boolean matchPassword(String pwd) {
		return  this.password.equals(pwd);
	}

	//p619 20
	public void changePassword(String newPwd) {
		this.password = newPwd;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", name=" + name + ", password=" + password + ", birth=" + birth + ", gender=" + gender + ", admin=" + admin + "]";
	}
}








