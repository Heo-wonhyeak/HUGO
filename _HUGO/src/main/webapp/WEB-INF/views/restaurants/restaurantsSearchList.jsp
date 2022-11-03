<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="lists" value="${resultMap.resSearchList }" />
<c:set var="listImg" value="${resultMap.listImgs }" />
<c:set var="search" value="${resultMap.search }" />
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<section class="top50List">
	<h1 class="restaurant_top50List_head">HUGO LIST </h1>
	<div class="restaurant_top50List_array">
		<ul class="restaurant_top50List_array_ul">
			<li><a class="restaurant_top50List_arrayList" href="${contextPath}/main/search.do?array=1&searchbox=${search}">별점</a></li>
			<li><a class="restaurant_top50List_arrayList" href="${contextPath}/main/search.do?array=2&searchbox=${search}">방문 횟수</a></li>
			<li><a class="restaurant_top50List_arrayList" href="${contextPath}/main/search.do?array=3&searchbox=${search}">가장 많은 찜</a></li>
			<li><a class="restaurant_top50List_arrayList" href="${contextPath}/main/search.do?array=4&searchbox=${search}">거리순</a></li>
			<li><a class="restaurant_top50List_arrayList" href="${contextPath}/main/search.do?array=5&searchbox=${search}">인기순</a></li>
		</ul>
	</div>
	<c:choose>
		<c:when test="${!empty lists}">
			<div class="list">
			<c:forEach items="${lists}" var="list" varStatus="status">
				<div id="restaurantList">
					<img class="restaurantList_image" onclick="location.href='${contextPath}/restaurants/restaurantView.do?restIdx=${list.restIdx}&array=11'" alt="" src="${contextPath}/download.do?imageFileName=${listImg[status.index].imageFileName}&imageFileNO=${listImg[status.index].imageFileNO}&restaurantIdx=${listImg[status.index].restaurantIdx}"/>
					<div class="restaurantList_info">
						<div class="restaurantList_info_head" onclick="location.href='${contextPath}/restaurants/restaurantView.do?restIdx=${list.restIdx}&array=11'">${list.restName }</div>
						<div class="restaurantList-count">
							<span class="restaurantsList-count-info">⭐&nbsp;&nbsp;${list.restStarAvg }</span> 
								<span class="restaurantsList-count-info">❤️&nbsp;&nbsp;${list.restJjim }</span> 
								<span class="restaurantsList-count-info">😀&nbsp;&nbsp;${list.restVisitCount }</span>
								<span class="restaurantsList-count-info">✏️&nbsp;&nbsp;${list.restReviewCount }</span>
						</div>
						<div class="restaurantList_address">
							<div class="restaurantList_imoji">🏠</div>
							<div class="restaurantList_address_address">${list.restAddress }<br/><span class="restaurantList_jibun">지번</span> ${list.restJibunAddress }</div>
						</div>
						<div class="restaurantList_open_info">
							<div class="restaurantList_imoji">⏰</div>
							<div class="restaurantList_openTime">${list.restOpen }</div>
						</div>
						<div class="restaurantList_phone_info">
							<div class="restaurantList_imoji">📞</div>
							<div class="restaurantList_phone">${list.restPhone }</div>
						</div>
					</div>
					<div class="restaurantList_most">
						<div class="restaurantList_more">
							<a href="${contextPath}/restaurants/restaurantView.do?restIdx=${list.restIdx}&array=11">음식점 보러가기</a>
						</div>
					</div>
					</div>
				</c:forEach>
			</div>	
		</c:when>
			<c:otherwise>
				<div class="RestaurantReviewList__Empty">
	             	<span class="RestaurantReviewList__EmptyTitle">${search}에 대한 결과가 없습니다.</span>
	            </div>
			</c:otherwise>
			
		</c:choose>
	</section>
</body>
</html>