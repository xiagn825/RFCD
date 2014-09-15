<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<div id="loginDiv">
	<form action="<c:url value="/adminLogin.do"/>" method="post">
	<c:if test="${isValid != null && !isValid}">
		<p>username or password is not available</p>
	</c:if>
	<p><label>username:</label><input type="text" name="username"/></p>
	<p><label>password:</label><input type="text" name="password"/></p>
	<p><input type="submit" value="submit"/></p>
	</form>
</div>
</body>
</html>