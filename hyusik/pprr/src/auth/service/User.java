package auth.service;

public class User {
	private String email;
	private String name;
	private int admin;
	
	public User(String email, String name, int admin) {
		this.email=email;
		this.name=name;
		this.admin=admin;
	}

	public String getemail() {
		return email;
	}

	public String getName() {
		return name;
	}

	/**
	 * @return the admin
	 */
	public int getAdmin() {
		return admin;
	}

	/**
	 * @param admin the admin to set
	 */
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
}
