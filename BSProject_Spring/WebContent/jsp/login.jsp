<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<div id="loginDiv">
	<form:form id="loginForm" action="${pageContext.servletContext.contextPath}/login" method="POST" commandName="user">
		
		<p><label>username:</label><form:input path="username" /><span><form:errors path="username"/></span></p>
		<p><label>password:</label><form:input path="password" /><span><form:errors path="password"/></span></p>
		<p><input type="submit" value="submit"/></p>
	</form:form>
</div>
</body>
</html>