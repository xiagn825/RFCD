package main.java.spring;

import java.util.List;

public class UserService {
	
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
