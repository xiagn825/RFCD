package com.xiagn.bs.spring;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6031144481467595140L;
	
	@Override
	public void init() throws ServletException {
		System.out.println("servlet init");
		super.init();
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(arg0, arg1);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("servlet doGet");
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new User(username, password);
		UserService userService = new UserService();
		if (userService.isUser(user)) {
			req.setAttribute("user", user);
			req.getRequestDispatcher("/jsp/welcome.jsp").forward(req, resp);
		} else {
			req.setAttribute("isValid", false);
			req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
		}
	}
	
	@Override
	public void destroy() {
		System.out.println("servlet destory");
		super.destroy();
	}
}
