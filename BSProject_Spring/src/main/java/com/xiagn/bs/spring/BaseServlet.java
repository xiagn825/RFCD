package main.java.spring;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class BaseServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6509572641730437233L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
}
