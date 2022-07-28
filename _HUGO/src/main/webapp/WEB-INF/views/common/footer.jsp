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
	<title>Insert title here</title>
	<link rel ="stylesheet" href="${contextPath }/resources/css/main.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
</head>
<body>
	<div class="footer">
   	 
   	 <div class="select" >
   	 	<img src="${contextPath }/resources/img/hugo_white.png" width="70" height="70">&nbsp;&nbsp;
		<a href=''>회사소개</a> |
		<a href=''>개인정보처리방침</a> |
		<a href=''>서비스약관</a>
	 </div>
	 <div class="info">
	 	<p>**회사</p>
	 	<p>서울특별시 서초구 서초대로77길 54 (서초더블유타워 13,14층)</p>
	 	<p>대표자:***</p>
	 	<p>사업자등록번호:1234567890</p>
	 	<p>T. 02 - 1234 - 5678</p>
	 
	 </div>
   </div>
</body>
</html>