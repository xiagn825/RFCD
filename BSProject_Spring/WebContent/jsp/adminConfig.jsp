<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userManager</title>
<script type="text/javascript">
var utils = function(){
	this.addListener = null;
	this.removeListener = null;
	this.xhr = null;
};
(function(){
	if (typeof window.addEventListener === 'function') {
		utils.addListener = function (el, type, fn) {
			el.addEventListener(type, fn, false);
		};
		utils.removeListener = function (el, type, fn) {
			el.removeEventListener(type, fn, false);
		};
	} else if (typeof document.attachEvent === 'function') { // IE
		utils.addListener = function (el, type, fn) {
			el.attachEvent('on' + type, fn);
		};
		utils.removeListener = function (el, type, fn) {
			el.detachEvent('on' + type, fn);
		};
	} else { // older browsers
		utils.addListener = function (el, type, fn) {
			el['on' + type] = fn;
		};
		utils.removeListener = function (el, type, fn) {
			el['on' + type] = null;
		};
	}
	
	function stopBubble(e) {  
	     if (e && e.stopPropagation) {//非IE  
	         e.stopPropagation();  
	     }  
	     else {//IE  
	         window.event.cancelBubble = true;  
	     }  
 	} 
	
	var i, activeXids = [
				'MSXML2.XMLHTTP.3.0',
				'MSXML2.XMLHTTP',
				'Microsoft.XMLHTTP'
				];
	
	if (typeof XMLHttpRequest === "function") {
		utils.xhr = new XMLHttpRequest();
	} else {
		for (i = 0; i < activeXids.length; i += 1) {
			try {
				utils.xhr = new ActiveXObject(activeXids[i]);
				break;
			} catch (e) {}
		}
	}
}());
utils.ajax = function(url, method, data, successFn, failFn){
	var xhr = this.xhr;
	xhr.onreadystatechange = function () {
		if (xhr.readyState !== 4) {
			return false;
		}
		if (xhr.status !== 200) {
			if (typeof failFn !== "function") {
				alert("server connection error");
			}
		}
		if (typeof successFn === "function") {
			successFn.call(null, xhr.responseText);
		}
		
	};
	if (method.toUpperCase() === "POST") {
		xhr.open("POST", url, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(data);
	} else {
		xhr.open("GET", url+data, true);
		xhr.send();
	}
};
var getId = function (id) {
	return document.getElementById(id);
};
utils.addListener(document, "load", function(){
	var target = event ? event.target : window.event.srcElement;
});
utils.addListener(document, "click", function(event){
	var target = event ? event.target : window.event.srcElement;
	var operate = ["add","update","delete"],
		userInfoTable = getId("userInfoTable"),
		targetArray = target.id.split("_"),
		crtOperate = operate.indexOf(targetArray[0]);
		paramArray = [];
		
	if (target.type === "button" && crtOperate > -1) {
		if (targetArray[1]) {
			paramArray.push("selectedUserName="+getId("username_"+targetArray[1]).value);
			paramArray.push("selectedPassword="+getId("password_"+targetArray[1]).value);
			paramArray.push("operation="+targetArray[0]);
		} else {
			paramArray.push("username="+getId("username").value);
			paramArray.push("password="+getId("password").value);
			paramArray.push("operation=add");
		}
		utils.ajax(getId("detailForm").action, "POST", paramArray.join("&"), function(returnData){
			if (!!returnData) {
				switch(crtOperate) {
				case 0:
				    var rowCount = userInfoTable.rows.length;
					userInfoTable.innerHTML += "<tr><td>"+rowCount+"</td>"+
								"<td>"+getId("username").value+"<input id='username_"+rowCount+"' type='hidden' name='username' value='"+getId("username").value+"''/></td>"+
								"<td><input id='password_"+rowCount+"' type='text' name='password' value='"+getId("password").value+"'/></td>"+
								"<td><input id='update_"+rowCount+"' name='button' type='submit' value='update'> "+
								"<input id='delete_"+rowCount+"' name='button' type='submit' value='delete'></td>"+
								"</tr>";
					break;
				case 1:
					break;
				case 2:
					target.parentElement.parentElement.remove();
				}
			} else {
				alert("server error");
			}
		});
	} 
});



</script>
</head>
<body>
<div>
	<form action="<c:url value="/operateUser.do"/>" method="post">
		<p><label>username:</label><input id="username" type="text" name="username"/></p>
		<p><label>password:</label><input id="password" type="text" name="password"/></p>
		<input type="hidden" name="operation" value="add"/>
		<p><input id="add" name="button" type="button" value="add"/></p>
	</form>
	<table id="userInfoTable">
		<tr>
			<th>username</th>
			<th>password</th>
			<th>action</th>
		</tr>
		<c:forEach items="${users}" var="user" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${user.username}<input id="username_${s.index}" type="hidden" name="username" value="${user.username}"/></td>
				<td><input id="password_${s.index}" type="text" name="password" value="${user.password}"/></td>
				<td>
					<input id="update_${s.index}" name="button" type="button" value="update">
					<input id="delete_${s.index}" name="button" type="button" value="delete">
				</td>
			</tr>
		</c:forEach>
	</table>
	<form id="detailForm" action="<c:url value="/operateUser.do"/>" method="post">
		<input id="selectedUserName" type="hidden" name="selectedUserName"/>
		<input id="selectedPassword" type="hidden" name="selectedPassword"/>
		<input id="operation" type="hidden" name="operation"/>
	</form>
</div>
</body>
</html>