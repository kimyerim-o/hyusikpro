package join;

import java.util.Map;

public class JoinRequest {

	private String email;
	private String pass;
	private String passcon;
	private String name;
	private String gender;
	private String birth;




	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPasscon() {
		return passcon;
	}

	public void setPasscon(String passcon) {
		this.passcon = passcon;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public boolean isPasswordEqualToConfirm() {
		return pass != null && pass.equals(passcon);
	}
	
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, email, "email");
		checkEmpty(errors, pass, "pass");
		checkEmpty(errors, passcon, "passcon");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, gender, "gender");
		checkEmpty(errors, birth, "birt");
		if (!errors.containsKey("confirmPassword")) {
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}

	private void checkEmpty(Map<String, Boolean> errors, 
			String value, String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
}
