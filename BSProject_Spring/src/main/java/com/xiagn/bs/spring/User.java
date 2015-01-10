package main.java.spring;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8197623151474814318L;
	@NotEmpty
	private String username;
	@NotEmpty
	private String password;
	
	public User(){};
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
