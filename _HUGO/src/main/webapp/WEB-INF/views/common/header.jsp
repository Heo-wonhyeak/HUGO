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
	<script>
		function showMenu(){
			if($(".myMenu").css("display")=="none"){
				$(".myMenu").css("display","block")
			}else{
				$(".myMenu").css("display","none")
			}
		}
	</script>
</head>
<body>
	<div class="HeaderContainer">
		<div class="HeaderLogo">
			<a href="${contextPath }/main/main.do">
				<img src="${contextPath }/resources/img/hugo_white_repair.jpeg" style="width:100%; height:100%;">
			</a>
		</div>
		<div class="search">
			<input type="text" class="searchbox"/>
			<button class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<div class="headerMenu">
			<a href="${contextPath }/event/runningEventPage.do">이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${contextPath }/board/listArticles.do">게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<c:choose>
				<c:when test="${isLogOn == true &&  member != null}">
					${member.name }
					<a href="${contextPath}/member/logout.do">로그 아웃</a> 
				</c:when>
				<c:otherwise>
					<a href="${contextPath }/member/loginForm.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
			
			<a onclick="return showMenu()"><i class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
			<div class="myMenu">
				<ul>	
					<li>ezen님</li>
					<li>&nbsp;</li>
					<li><a href="${contextPath }/memberInfo/viewMemberInfo.do">회원정보</a></li>
					<li><a href="${contextPath }/memberInfo/couponList.do">쿠폰함</a></li>
					<li><a href="${contextPath }/memberInfo/wishList.do">찜리스트</a></li>
				</ul>
			</div>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>
</body>
</html>