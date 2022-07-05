<!--  
	파 일명 칭   : view.jsp
	작 성 자    : 정 원 영
	업데이트 날짜 : 2022. 07. 06 수
	수 정 날 짜  : 
	기  능      : 매장 상세보기 페이지 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="restaurants.css" type="text/css" />
<style>
.swiper-container {
	margin-top: 20px;
	width: 95%;
	height: 350px;
}

.swiper-wrapper {
	display: flex;
	height: 345px;
}

.swiper-slide {
	width: 20%;
	height: 345px;
	flex-direction: row;
	opacity: 0.4;
	transition: opacity 0.3s;
}

.slideMainImage {
	width: 100%;
	height: 395px;
	border: 1px solid blue;
}

.swiper-slide-active, .swiper-slide-active+.swiper-slide,
	.swiper-slide-active+.swiper-slide+.swiper-slide, .swiper-slide-active+.swiper-slide+.swiper-slide+.swiper-slide
	{
	opacity: 1
}

#image-more {
	margin-top:10px;
	width: 100%;
	text-align: right;
	border:1px solid red;
}

#image-more a {
	padding-right: 150px;
	color: gray;
	font-size: 25px;
	text-decoration: none;
}

#restaurants-view{
	display:flex;
	width:80%;
	height: 600px;
	margin: auto;
	margin-top:10px;
}
#restaurants-info{
	decoration:row;
	width: 50%;
	border:1px solid red;
	height: 600px;
}
#restaurants-map{
	decoration:row;
	width: 50%;
	border:1px solid red;
	height: 600px;
}
</style>
<title>dto.name</title>
</head>
<body>
	<header>
		<!--  헤더  -->
		<div class="h_wrap">헤더</div>
	</header>
	<div class="swiper-container" id="restaurants-swiperImage">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage"></div>
			</div>
		</div>
		<!-- 양옆 좌우버튼 -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<div id="image-more">
		<a href="#">📷 more</a>
	</div>
	<section id="restaurants-view">
		<div id="restaurants-info"></div>
		<div id="restaurants-map"></div>
	</section>
	<script>
		document.addEventListener("DOMContentLoaded", function() {

			//initialize swiper when document ready
			// 상단 이미지 슬라이드
			const mySwiper = new Swiper('#restaurants-swiperImage', {
				slidesPerView : 4, // 슬라이드 한번에 3개를 보여줌
				slidesPerGroup : 4, // 그룹으로 묶을 수
				observer : true,
				observeParents : true,
				spaceBetween : 10, // 슬라이드간 간격
				// 그룹수가 맞지 않을 경우 빈칸으로 메우기
				loopFillGroupWithBlank : false,
				loop : false, // true 할경우 무한반복
				// Navigation arrows 
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
				// 반응형
				breakpoints : {
					1280 : {
						slidesPerView : 4,
						slidesPerGroup : 4,
					},
					720 : {
						slidesPerView : 2,
						slidesPerGroup : 2,
					}
				}
			});
		});
	</script>
</body>
</html>