<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	<link href="${contextPath }/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			
			<tiles:insertAttribute name="mainslider"/>
			
			<aside>
				<tiles:insertAttribute name="side" />
			</aside>
			
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			
			<footer>
				<tiles:insertAttribute name="footer"/>
			</footer>
		</div>
	</div>
</body>
</html>