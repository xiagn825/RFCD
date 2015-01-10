package main.java.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import main.java.spring.ApplicationCache;
import main.java.spring.User;

@Service
public class UserService implements IUserService{
	
	public boolean isAdmin(User user) {
		return ApplicationCache.getInstance().isAdmin(user);
	}
	
	public boolean isUser(User user) {
		return ApplicationCache.getInstance().isUser(user);
	}
	
	public boolean addUser(User user) {
		return ApplicationCache.getInstance().addUser(user);
	}
	
	public boolean updateUser(User user) {
		return ApplicationCache.getInstance().updateUser(user);
	}
	
	public boolean removeUser(String username) {
		return ApplicationCache.getInstance().removeUser(username);
	}
	
	public List<User> showAllUser() {
		return ApplicationCache.getInstance().showAllUserInfo();
	}
}
