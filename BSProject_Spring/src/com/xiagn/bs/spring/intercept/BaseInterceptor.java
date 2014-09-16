package com.xiagn.bs.spring.intercept;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BaseInterceptor implements HandlerInterceptor{
	
	private final static String TOKEN_NAME = "token";
	
	private final static String EXCLUDE_HANDLE = "org.springframework.web.servlet.resource.ResourceHttpRequestHandler";

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	/**
	 * 指定方法実行前
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if (session == null) {
			return false;
		}
		//TODO user検証処理
		
		if (StringUtils.equalsIgnoreCase(EXCLUDE_HANDLE, handler.getClass().getName())) {
			return true;
		}
		
		return !isDuplicateSubmit(request, response, session);
	}

	private boolean isDuplicateSubmit(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		// 二重押下防止処理
		// リクエストGETの場合、TOKEN設定
		if (request.getMethod().equalsIgnoreCase("GET")) {
			String uid = UUID.randomUUID().toString();
			session.setAttribute(TOKEN_NAME, uid);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			// リクエストPOSTの場合、TOKEN検証
			String rToken = request.getParameter(TOKEN_NAME);
			Object sToken = session.getAttribute(TOKEN_NAME);
			if (StringUtils.isNotEmpty(rToken) && !rToken.equals(sToken)) {
				response.sendRedirect("jsp/duplicateSubmitWarning.jsp");
				return true;
			} else {
				session.setAttribute(TOKEN_NAME, null);
			}
		}
		return false;
	}

}
