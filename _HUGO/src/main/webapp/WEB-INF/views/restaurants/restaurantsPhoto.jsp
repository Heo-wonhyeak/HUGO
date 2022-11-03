<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="imgList" value="${restMap.imgList}" />
<!DOCTYPE html>
<html>
<head>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel ="stylesheet" href="${contextPath }/resources/css/restaurants.css" type="text/css"/>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
html,body{
    padding:0;
    margin:0;
    height: 100%;
}

</style>
</head>
<body class="restaurants-photo-body">
   <section class="restaurants-photo-wrap">
          <!-- Swiper -->
	<div class="swiper-container gallery-top">
			<div class="swiper-wrapper">
				<c:forEach items="${imgList}" var="imgList" varStatus="status">
					<div class="swiper-slide">
						<div class="swiper-slide-container">
							<img class="plus-imgList" alt="" src="${contextPath}/download.do?imageFileName=${imgList.imageFileName}&imageFileNO=${imgList.imageFileNO}&restaurantIdx=${imgList.restaurantIdx}"  />
						</div>
					</div>
            	</c:forEach>	
			</div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
	</div>
   </section>
<script>
 var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
	 		loop: true,
			loopedSlides: 4
    });
</script>
</body>
</html>