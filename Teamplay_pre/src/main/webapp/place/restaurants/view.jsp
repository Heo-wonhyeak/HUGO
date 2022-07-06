<!--  
	파 일명 칭   : view.jsp
	작 성 자    : 정 원 영
	업데이트 날짜 : 2022. 07. 06 수
	수 정 날 짜  : 2022. 07. 07 목
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
<link rel="stylesheet" href="restaurants.css?after" type="text/css" >
<style>

/* review section */
.restaurants-review-section{
	width: 80%;
	height: 1200px;
	border: 1px solid green;
	margin: auto;
	margin-top: 100px;
}
.restaurants-review-header{
	margin:auto;
	width: 100%;
	height: 50px;
	font-size:35px;
	font-weight:bold;
	padding-left:30px;
}
.restaurants-review-sort{
	width: 100%;
	text-align:right;
	border-bottom:2px solid black;
	font-size:25px;
	height: 50px;
}
.restaurants-review-sort span{
	padding:10px 20px 10px 0;
}
</style>
<title>돼통령 xx점</title>
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
	<div class="image-more">
		<a href="#">📷 more</a>
	</div>
	<!-- info and map -->
	<section class="restaurants-view">
		<div class="restaurants-info">
			<div class="restaurants-info-head">
				<div class="restaurants-name">돼통령 xx점</div>
				<div class="restaurants-steamed">추천</div>
			</div>
			<div class="restaurants-info-head">
				<div class="restaurants-count">
					<span class="restaurants-count-info">⭐ 5.0</span>
					<span class="restaurants-count-info">❤️ 5.0</span>
					<span class="restaurants-count-info">😀 932 </span>
				</div>
				<div class="restaurants-fixInfo"><a href="#">✏️ 정보 수정 요청</a></div>
			</div>
			<div class = "restaurants-info-body">
				<table colspan="2" class="restaurants-detail">
					<tr>
						<th>📞</th>
						<td>02-xxxx-xxxx</td>
					</tr>
					<tr>
						<th>🏠</th>
						<td>서울시 ~~<br/>
							<span class="restaurants-infoAddress-text">지번 &nbsp;진안동 884-8 1층</span>	
						</td>
					</tr>
					<tr>
						<th>⏰</th>
						<td>연중 무휴<br/>
							<span class="restaurants-infoTime-text">10:00 ~ 21:00</span>
						</td>
					</tr>
					<tr>
						<th>🔖</th>
						<td>
							<span class="restaurants-infoMenu-text">삼겹살 : 13,000 </span><br>
							<span class="restaurants-infoMenu-text">삼겹살 : 13,000 </span><br>
							<span class="restaurants-infoMenu-text">삼겹살 : 13,000 </span>
						</td>
					</tr>
				</table>
			</div>
			<div class="restaurants-info-update">2022.06.14 업데이트</div>
		</div>
		<div class="restaurants-map">
		
		</div>
	</section>
	<section class="restaurants-review-section">
		<div class="restaurants-review-header">Review</div>
		<div class="restaurants-review-sort">
			<span id="restaurants-review-sort-new">최신순&nbsp;&nbsp;&nbsp;/&nbsp;</span>
			<span id="restaurants-review-sort-star">별점순&nbsp;&nbsp;&nbsp;/&nbsp;</span>
			<span id="restaurants-review-sort-visit">방문순&nbsp;&nbsp;&nbsp;/&nbsp;</span>
			<span id="restaurants-review-sort-myReview">내가 쓴리뷰</span>
		</div>
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
						slidesPerView : 3,
						slidesPerGroup : 3,
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