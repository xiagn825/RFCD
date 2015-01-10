package main.java.spring.service;

import java.util.List;

import main.java.spring.User;

public interface IUserService {
	public boolean isAdmin(User user);
	
	public boolean isUser(User user);
	
	public boolean addUser(User user);
	
	public boolean updateUser(User user);
	
	public boolean removeUser(String username);
	
	public List<User> showAllUser();
}
