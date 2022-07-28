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
	<script type="text/javascript">
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 560) {
			 scrollTop = 560;
			}
			$("#sidebarContainer").stop();
			$("#sidebarContainer").animate( { "top" : scrollTop });
			});
	</script>
</head>
<body>
	<div id="sidebarContainer">
		<div class="sidebarEvent">
			<a href="../eventPage/eventDTL.jsp">
				<img class="sidebarImg" alt="고양이사진" src="${contextPath }/resources/img/cuteCat.jpeg" />
			</a>
		</div>
		<div class="sidebarEvent">
			<a href="../eventPage/couponDTL.jsp">
				<img class="sidebarImg" alt="강아지사진" src="${contextPath }/resources/img/cuteDog.jpeg" />
			</a>
		</div>
		<div class="sidebarEvent">
			<a href="../eventPage/eventDTL.jsp">
				<img class="sidebarImg" alt="고양이사진" src="${contextPath }/resources/img/cuteCat.jpeg" />
			</a>
		</div>
	</div>
</body>
</html>