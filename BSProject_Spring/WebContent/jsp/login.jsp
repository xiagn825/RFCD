<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login.css">

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("form").on("click", "button", function(e){
		var clickBtn = e.target;
		if (clickBtn.type == "submit") {
			// サーバテストの場合、この行コメントアウトする
			$(clickBtn).attr("disabled", true);
			clickBtn.form.submit();
		}
	});
});

</script>
</head>
<body>
	<div class="container">
		<form:form id="loginForm"
			action="${pageContext.servletContext.contextPath}/login"
			method="POST" commandName="user" cssClass="form-signin" role="form">
				<h2 class="form-signin-heading">Please sign in</h2>
				<p>
					<label>username:</label>
					<form:input path="username" cssClass="form-control"
						placeholder="Email address" required="true" autofocus="" />
					<form:errors path="username" />
				</p>
				<p>
					<label>password:</label>
					<form:input path="password" type="password" cssClass="form-control"
						placeholder="Password" required="true" />
					<form:errors path="password" />
				</p>
				<div class="checkbox">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<input type="hidden" value="${token}" name="token"/>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form:form>

	</div>
</body>
</html>