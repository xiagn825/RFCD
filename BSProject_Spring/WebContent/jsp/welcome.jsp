<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vGLcnChxwazROtrul4X3xZuh"></script>
</head>
<div id="loginDiv">
Hello ${user.username }!
<div id="allmap" style="width:100%;height:500px;"></div>
</div>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");            // 创建Map实例
	var allmap = document.getElementById("allmap");
	(function() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError);
		} else {
			x.innerHTML = "Geolocation is not supported by this browser.";
		}
	}());

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			document.getElementById("allmap").innerHTML = "User denied the request for Geolocation."
			break;
		case error.POSITION_UNAVAILABLE:
			console.debug("Location information is unavailable.");
			break;
		case error.TIMEOUT:
			document.getElementById("allmap").innerHTML = "The request to get user location timed out."
			break;
		case error.UNKNOWN_ERROR:
			document.getElementById("allmap").innerHTML = "An unknown error occurred."
			break;
		}
		loadMap(121.542403, 38.894782);
	}
	function showPosition(position) {
		loadMap(position.coords.longitude,position.coords.latitudel);
	}
	
	function loadMap(longitude, latitudel) {
		var mPoint = new BMap.Point(longitude, latitudel);
		map.enableScrollWheelZoom();
		map.centerAndZoom(mPoint, 15);

		var circle = new BMap.Circle(mPoint, 1000, {
			fillColor : "blue",
			strokeWeight : 1,
			fillOpacity : 0.3,
			strokeOpacity : 0.3
		});
		map.addOverlay(circle);
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map,
				autoViewport : false
			}
		});
		var bounds = getSquareBounds(circle.getCenter(), circle.getRadius());
		local.searchInBounds("餐馆", bounds);
	}

	/**
	 * 得到圆的内接正方形bounds
	 * @param {Point} centerPoi 圆形范围的圆心
	 * @param {Number} r 圆形范围的半径
	 * @return 无返回值   
	 */
	function getSquareBounds(centerPoi, r) {
		var a = Math.sqrt(2) * r; //正方形边长

		mPoi = getMecator(centerPoi);
		var x0 = mPoi.x, y0 = mPoi.y;

		var x1 = x0 + a / 2, y1 = y0 + a / 2;//东北点
		var x2 = x0 - a / 2, y2 = y0 - a / 2;//西南点

		var ne = getPoi(new BMap.Pixel(x1, y1)), sw = getPoi(new BMap.Pixel(x2,
				y2));
		return new BMap.Bounds(sw, ne);

	}
	//根据球面坐标获得平面坐标。
	function getMecator(poi) {
		return map.getMapType().getProjection().lngLatToPoint(poi);
	}
	//根据平面坐标获得球面坐标。
	function getPoi(mecator) {
		return map.getMapType().getProjection().pointToLngLat(mecator);
	}
</script>
</body>
</html>