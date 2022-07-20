<!--  
	파 일명 칭   : view.jsp
	작 성 자    : 정 원 영
	업데이트 날짜 : 2022. 07. 06 수
	수 정 날 짜  : 2022. 07. 14 목
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
<title>돼통령 xx점</title>
</head>
<body>
		<!--  헤더  -->
	<%@ include file="Header.jsp" %>
	<div class="swiper-container" id="restaurants-swiperImage">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
			<div class="swiper-slide">
				<div class="slideMainImage" onClick="popUpImage()" target="_parent"></div>
			</div>
		</div>
		<!-- 양옆 좌우버튼 -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<div class="image-more">
		<a onClick="popUpPhoto()" target="_parent">📷 more</a>
	</div>
	<!-- info and map -->
	<section class="restaurants-view">
		<div class="restaurants-info">
			<div class="restaurants-info-head">
				<div class="restaurants-name">돼통령 xx점</div>			<!-- 별점 ajax로 구현 -->
				<div class="restaurants-steamed"><input type="button" id="restaurants-star1" value="☆">
				</div>
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
			<%@ include file="../Naver_api.jsp" %>
		</div>
	</section>
	<!-- review section -->
	<section class="restaurants-review-section">
		<div class="restaurants-review-header">Review</div>
		<div class="restaurants-review-sort">
			<span id="restaurants-review-sort-new">최신순</span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-star">별점순</span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-visit">방문순</span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-myReview">내가 쓴리뷰</span>
		</div>
		<div class="restaurants-review-writeInfo"><a onClick="popUpWrite()" target="_parent">✏️ 리뷰 쓰기 </a></div>
		<div class="restaurants-review-list">
			<div class="restaurants-review-head">
				<div class="restaurants-review-head-image">이미지</div>
				<div class="restaurants-review-head-name">정원영</div>
				<div class="restaurants-review-head-star5">⭐ ⭐ ⭐ ⭐ ⭐</div>
				<div class="restaurants-review-head-revise"><a onClick="popUpFix()" target="_parent">✏️ 수정/삭제</a></div>
			</div>
			<div class="restaurants-review-contents">
				<div class="restaurants-review-contents-txt">1212<a onClick="popUp()" target="_parent">...더보기</a></div>
				<div class="restaurants-review-contents-image">
					<div class="restaurants-review-contents-imageInfo"></div>
					<div class="restaurants-review-contents-imageInfo"></div>
					<div class="restaurants-review-contents-imageInfo"></div>
					<div class="restaurants-review-contents-imageInfo-plus"><a onClick="popUp()" target="_parent">more</a></div>
				</div>
			</div>
			<div class="restaurants-review-steamed" onClick="goodCheck()">추천해요😀(1)</div>
		</div>
		<!--
		<div class="RestaurantReviewList__Empty">
              <span class="RestaurantReviewList__EmptyTitle">아직 작성된 리뷰가 없네요.</span>
              <span class="RestaurantReviewList__EmptyDescription">앱에서 해당 식당의 첫 리뷰를 작성해주시겠어요?</span>
            </div>
		-->
            <div class="restaurants-review-list-plus" role="button">더보기</div>
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
		

		// 매장 별점 추가하기 버튼 활성화
		// 별점 디비 추가
		const restaurant_steamed = document.querySelector("#restaurants-star1");
		const restaurant_steamed2 = document.querySelector(".restaurants-steamed label");
		
		// 듀얼모니터 기준 팝업창 가운데 정렬
		const popWidth = "1100";
		const popHeight = "600";
		const nLeft = Math.round(window.screenX + (window.outerWidth/2) - (popWidth/2));
		const nTop = Math.round(window.screenY + (window.outerHeight/2) - (popHeight/2));

		// 매장 상세보기 팝업창 이동
		function popUp(){
			
			const id = document.querySelector(".restaurants-review-contents-txt a");
			const a = document.querySelector(".restaurants-review-contents-txt a");
			const url ="restaurants_review_info.jsp?id="+id;
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();

		}
		// 매장 상세보기 쓰기 팝업창 이동
		// 로그인 검증 필요 없을시 alert창
		function popUpWrite(){
			const url ="restaurants_review_write.jsp";
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();
		}
		// 매장 상세보기 수정/삭제 팝업창 이동
		// 만약 작성자가 아닐시 보이지 않게 하기
		function popUpFix(){
			const url ="restaurants_review_write.jsp";
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();
		}
		// 사진 상세보기 팝업창 이동
		function popUpPhoto(){
			const url ="restaurants_photo.jsp";
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();
		}
		// 슬라이드 이미지 클릭시 상세보기 페이지로 이동
		function popUpImage(){
			const id = $('.slideMainImage').val();
			const a = document.querySelector(".slideMainImage");
			const url ="restaurants_review_info.jsp?id="+10;
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();
		}
		// 더보기 기능 구현 
		// $(function(){
		// 	$("div").slice(0, 10).show(); // 최초 10개 선택
		// 	$("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
		// 	e.preventDefault();
		// 	$("div:hidden").slice(0, 10).show(); // 숨김 설정된 다음 10개를 선택하여 표시
		// 	if($("div:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
		// 	alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
		// 	}
		// 	});
		// 	});


		// 정렬 별 ajax 구현


		// 지도 구현 
		// Naver_api ;;

		// 찜하기 구현 
			// ajax 구현

		// id 검증 후 수정/삭제 나타내기  
			// 연결 후 core 태그 사용
		
		// 추천해요 기능 추가
		// function goodCheck(){
		// 	const query = {id : }

		// 	$.ajax({
		// 		url : "${contextPath}/bGood.do",
		// 		type : "get"
		// 		data: query,
		// 		success:function(data){
		// 			location.reload();
		// 		}
		// 	})
		// }
	</script>
</body>
</html>