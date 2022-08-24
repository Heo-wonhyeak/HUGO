<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>
a:hover{
	color:white;
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath }/resources/css/restaurants.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<section class="top50List">
	<h1 class="restaurant_top50List_head">TOP 50 List </h1>
	<div class="restaurant_top50List_array">
		<ul class="restaurant_top50List_array_ul">
			<li>별점</li>
			<li>방문 횟수</li>
			<li>가장 많은 찜</li>
			<li>거리순</li>
			<li>인기순</li>
		</ul>
	</div>
	
		<div id="restaurantList">
			<div class="restaurantList_image"></div>
			<div class="restaurantList_info">
				<div class="restaurantList_info_head">돼통령 xx점</div>
				<div class="restaurants-count">
					<span class="restaurantsList-count-info">⭐&nbsp;&nbsp;TEST</span> 
						<span class="restaurantsList-count-info">❤️&nbsp;&nbsp;TEST</span> 
						<span class="restaurantsList-count-info">😀&nbsp;&nbsp;TEST</span>
						<span class="restaurantsList-count-info">✏️&nbsp;&nbsp;130</span>
				</div>
				<div class="restaurantList_address">
					<div class="restaurantList_imoji">🏠</div>
					<div class="restaurantList_address_address">경기도 화성시 기산<br/><span class="restaurantList_jibun">지번</span> 경기도 화성시 기산</div>
				</div>
				<div class="restaurantList_open_info">
					<div class="restaurantList_imoji">⏰</div>
					<div class="restaurantList_openTime">00:00 ~ 12:00</div>
				</div>
				<div class="restaurantList_phone_info">
					<div class="restaurantList_imoji">📞</div>
					<div class="restaurantList_phone">010 xxxx xxxx</div>
				</div>
			</div>
			<div class="restaurantList_most">
				<div class="restaurantList_more">
					<a href="#">음식점 보러가기</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>