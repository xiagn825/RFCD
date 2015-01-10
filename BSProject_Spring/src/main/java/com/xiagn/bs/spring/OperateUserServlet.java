package main.java.spring;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class OperateUserServlet  extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 667610146428208654L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String opteration = req.getParameter("operation");
		UserService userService = new UserService();
		boolean isSuccess = true;
		if (StringUtils.equals("add", opteration)) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			User user = new User(username, password);
			isSuccess = userService.addUser(user);
		} else if(StringUtils.equals("update", opteration)) {
			String username = req.getParameter("selectedUserName");
			String password = req.getParameter("selectedPassword");
			User user = new User(username, password);
			isSuccess = userService.updateUser(user);
		} else if(StringUtils.equals("delete", opteration)) {
			String username = req.getParameter("selectedUserName");
			isSuccess = userService.removeUser(username);
		}
		PrintWriter out = resp.getWriter();
		out.print(isSuccess);
		out.flush();
		out.close();
	}
	
}
