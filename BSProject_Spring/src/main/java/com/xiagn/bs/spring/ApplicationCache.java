package com.xiagn.bs.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.xiagn.bs.spring.model.User;

public class ApplicationCache {
	private Map<String, String> userDataMap = new HashMap<String, String>(); 
	private final static Map<String, String> adminDataMap = new HashMap<String, String>();
	private final static int USER_AUTH_NOUSER = 0;
	private final static int USER_AUTH_ADMIN = 1;
	private final static int USER_AUTH_USER = 2;
	
	static {
		adminDataMap.put("xiagn", "123456");
	}
	
	private ApplicationCache(){
		
	}
	
	private static ApplicationCache cache;
	
	public static ApplicationCache getInstance() {
		if (cache == null) {
			cache = new ApplicationCache();
		}
		return cache;
	}
	
	public int getUserAuth(String username, String password) {
		if (StringUtils.equals(adminDataMap.get(username),password)) {
			return USER_AUTH_ADMIN;
		}
		if (StringUtils.equals(userDataMap.get(username),password)) {
			return USER_AUTH_USER;
		}
		return USER_AUTH_NOUSER;
	}
	
	public boolean isAdmin(User user) {
		return getUserAuth(user.getUsername(), user.getPassword()) == USER_AUTH_ADMIN;
	}
	
	public boolean isUser(User user) {
		return getUserAuth(user.getUsername(), user.getPassword()) == USER_AUTH_USER;
	}
	
	public boolean addUser(User user) {
		if (userDataMap.containsKey(user.getUsername())) {
			return false;
		} else {
			userDataMap.put(user.getUsername(), user.getPassword());
			return true;
		}
	}
	
	public boolean removeUser(String username) {
		userDataMap.remove(username);
		return true;
	}
	
	public boolean updateUser(User user) {
		userDataMap.put(user.getUsername(), user.getPassword());
		return true;
	}
	
	public List<User> showAllUserInfo() {
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		List<User> userList = new ArrayList<User>();
		Set<Entry<String, String>> userSet = userDataMap.entrySet();
		for (Entry<String, String> userEntry : userSet) {
			userList.add(new User(userEntry.getKey(),userEntry.getValue()));
		}
		return userList;
	}
	
}
