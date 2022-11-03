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
	<link rel ="stylesheet" href="${contextPath }/resources/css/main.css?after20220823" type="text/css"/>
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
		function search(){
			const searchValue = document.getElementById("searchbox");
			if(searchValue.value == null || searchValue.value == ""){
				alert("검색어를 입력해 주세요.");
				return false;
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
			<form action="${contextPath }/main/search.do" method="get" id="searchFrm">
			<input type="text" class="searchbox" id="searchbox" name="searchbox"/>
			<input type="hidden" id="array" name="array" value= "1"/>
			<button type="submit" class="searchBtn" onclick="search()"><i class="fa-solid fa-magnifying-glass"></i></button>
			</form>
		</div>
		<div class="headerMenu">
			<a href="${contextPath }/event/runningEventPage.do?boarder=runningEvent">이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>HUGO</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<c:choose>
				<c:when test="${isLogOn == true &&  member != null}">
					<a onclick="return showMenu()"><i class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
				</c:when>
				<c:otherwise>
					<a href="${contextPath }/member/loginForm.do">로그인</a><!-- &nbsp;&nbsp;|&nbsp;&nbsp; -->
				</c:otherwise>
			</c:choose>
			
			<div class="myMenu">
				<ul>	
					<li>${member.nickname}&nbsp;님</li>
					<li>&nbsp;</li>
					<li><a href="${contextPath }/memberInfo/viewMemberInfo.do">회원정보</a></li>
					<li><a href="${contextPath }/memberInfo/couponList.do">쿠폰함</a></li>
					<li><a href="${contextPath }/memberInfo/wishList.do">찜리스트</a></li>
					<li><a href="${contextPath}/member/logout.do">로그 아웃</a></li> 
				</ul>
			</div>
		</div>
	</div>
</body>
</html>