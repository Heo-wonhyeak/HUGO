<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="restaurant" value="${restMap.restaurant }" />
<c:set var="menuListarr" value="${restMap.menuListarr }" />
<c:set var="jjimCount" value="${restMap.jjimCount }" />
<c:set var="imgList" value="${restMap.imgList }" />
<c:set var="reviewList" value="${reviewsMap.reviewList }" />
<c:set var="imgList2" value="${reviewsMap.imgList}" />
<c:set var="steamedList" value="${reviewsMap.steamedList}" />


<%
	request.setCharacterEncoding("UTF-8");
%>
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
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tzhnxmtsbm&submodules=geocoder"></script>
</head>
<link rel="stylesheet"
	href="${contextPath }/resources/css/restaurants.css" type="text/css" />
<title></title>
</head>
<body id="restaurantView_body">
	<div class="swiper-container" id="restaurants-swiperImage">
		<div class="swiper-wrapper">
		<c:forEach items="${imgList}" var="imgList" varStatus="status">
			<div class="swiper-slide">
					<img class="slideMainImage" onClick="popUp('${imgList.articleIdx }')" target="_parent" alt="" src="${contextPath}/download.do?imageFileName=${imgList.imageFileName}&imageFileNO=${imgList.imageFileNO}&restaurantIdx=${imgList.restaurantIdx}" />
			</div>
		</c:forEach>
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
				<div class="restaurants-name">${restaurant.restName }</div>
				<!-- 별점 ajax로 구현 -->
				<div class="restaurants-steamed">
					<c:choose>
						<c:when test="${jjimCount eq 1}">
							<input type="button" id="restaurants-star1" value="★" onclick="jjimCancel()">
						</c:when>
						<c:otherwise>
							<input type="button" id="restaurants-star2" value="☆" onclick="jjimAdd('${isLogOn}')">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="restaurants-info-head">
				<div class="restaurants-count">
					<span class="restaurants-count-info">⭐
						${restaurant.restStarAvg }</span> <span class="restaurants-count-info">❤️
						${restaurant.restJjim }</span> <span
						class="restaurants-count-info">😀
						${restaurant.restVisitCount }</span>
				</div>
				<div class="restaurants-fixInfo">
					<a href="#">✏️ 정보 수정 요청</a>
				</div>
			</div>
			<div class="restaurants-info-body">
				<table colspan="2" class="restaurants-detail">
					<tr>
						<th>📞</th>
						<td>${restaurant.restPhone }</td>
					</tr>
					<tr>
						<th>🏠</th>
						<td style="font-size: 0.8em;">${restaurant.restAddress }<br />
							지번<span class="restaurants-infoAddress-text"
							style="font-size: 0.7em; color: gray;">
								&nbsp;${restaurant.restJibunAddress }</span>
						</td>
					</tr>
					<tr>
						<th>🍱</th>
						<td>${restaurant.restMenu }</td>
					</tr>
					<tr>
						<th>⏰</th>
						<td><span class="restaurants-infoTime-text">${restaurant.restOpen }</span>
						</td>
					</tr>
					<tr>
						<th>🚗</th>
						<td>${restaurant.restPark }</td>
					</tr>
					<tr>
						<th>🔖</th>
						<td style="font-size: 0.9em">
							<c:forEach var="menu" items="${menuListarr}" varStatus="status">
								<p> <c:out value="${menu }" /> </p>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
			<div class="restaurants-info-update">${restaurant.restUpdateDate }
				업데이트</div>
		</div>
		<div class="restaurants-map">
			<div id="map"></div>
		</div>
	</section>
	<!-- review section -->
	<section class="restaurants-review-section">
		<div class="restaurants-review-header">Review</div>
		<div class="restaurants-review-sort">
			<span id="restaurants-review-sort-new"><a href="${contextPath }/restaurants/restaurantView.do?restIdx=${restaurant.restIdx }&array=11">최신순</a></span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-star"><a href="${contextPath }/restaurants/restaurantView.do?restIdx=${restaurant.restIdx }&array=12">별점순</a></span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-visit"><a href="${contextPath }/restaurants/restaurantView.do?restIdx=${restaurant.restIdx }&array=13">방문순</a></span>&nbsp;&nbsp;&nbsp;/&nbsp;
			<span id="restaurants-review-sort-myReview"><a href="${contextPath }/restaurants/restaurantView.do?restIdx=${restaurant.restIdx }&array=14">내가 쓴리뷰</a></span>
		</div>

		<div class="restaurants-review-writeInfo">
			<a onClick="popUpWrite('${isLogOn}','${restaurant.restIdx }')" target="_parent">✏️ 리뷰 쓰기 </a>
		</div>
			<c:choose>
				<c:when test="${!empty reviewList}">
					<c:forEach items="${reviewList}" var="reviewList" varStatus="status">
						<div class="restaurants-review-list">
							<div class="restaurants-review-head">
								<img class="restaurants-review-head-image" alt="default" src="${contextPath }/resources/img/restaurant/user_default.jpg"/>
								<div class="restaurants-review-head-name">${reviewList.nickName }</div>
								<div class="restaurants-review-head-star5">⭐&nbsp;${reviewList.starCount } 점</div>
								<c:if test="${member.nickname == reviewList.nickName }">
									<div class="restaurants-review-head-revise">
										<a onClick="popUpFix('${reviewList.articleIdx }')" target="_parent">✏️ 수정/삭제</a>
									</div>
								</c:if>
							</div>
			
						<div class="restaurants-review-contents">
							<div class="restaurants-review-contents-txt">${reviewList.contents }
									<p><a onClick="popUp('${reviewList.articleIdx }')" target="_parent">...더보기</a></p>
							</div>
					
							<div class="restaurants-review-contents-image">											
										<img class="restaurants-review-contents-imageInfo" alt="" src="${contextPath}/download.do?imageFileName=${imgList2[status.index].imageFileName}&imageFileNO=${imgList2[status.index].imageFileNO}&restaurantIdx=${imgList2[status.index].restaurantIdx}" />						
								<div class="restaurants-review-contents-imageInfo-plus">
									<a onClick="popUp('${reviewList.articleIdx }')" target="_parent">more</a>
								</div>
							</div>
						</div>
							<c:set var="doneLoop" value="false"/>
							<c:if test="${not doneLoop}">
							<c:choose>								
									<c:when test="${!empty steamedList }">
										<c:forEach items="${steamedList}" var="steamedList" varStatus="status2">				
											<c:if test="${steamedList.articleIdx == reviewList.articleIdx}">
												<div class="restaurants-review-steamed" onClick="overlapGoodCheck()">추천해요😀&nbsp;(${reviewList.reviewStamp })</div>
												<c:set var="doneLoop" value="true"/>
											</c:if>	
										</c:forEach>		
									</c:when>
									<c:otherwise>
										<div class="restaurants-review-steamed" onClick="goodCheck('${isLogOn}','${reviewList.articleIdx }','${reviewList.restaurantIdx}')">추천해요😀&nbsp;(${reviewList.reviewStamp })</div>		
										<c:set var="doneLoop" value="true"/>
									</c:otherwise>						
							</c:choose>		
							</c:if>								
							<c:set var="doneLoop" value="false"/>
						</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="RestaurantReviewList__Empty">
	             	<span class="RestaurantReviewList__EmptyTitle">아직 작성된 리뷰가 없네요.</span>
	              	<span class="RestaurantReviewList__EmptyDescription">앱에서 해당 식당의 첫 리뷰를 작성해주시겠어요?</span>
	            </div>
			</c:otherwise>
		</c:choose>
	</section>
	<script>
		document.addEventListener("DOMContentLoaded", function() {

			//initialize swiper when document ready
			// 상단 이미지 슬라이드
			const mySwiper = new Swiper('#restaurants-swiperImage', {
				slidesPerView : 3, // 슬라이드 한번에 3개를 보여줌
				slidesPerGroup : 3, // 그룹으로 묶을 수
				observer : true,
				observeParents : true,
				spaceBetween : 0, // 슬라이드간 간격
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
		function popUp(reviewIdx){
			
			const id = document.querySelector(".restaurants-review-contents-txt a");
			const a = document.querySelector(".restaurants-review-contents-txt a");
			const url ="${contextPath }/restaurants/restaurantsReviewInfo.do?articleNO="+reviewIdx
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
			a.focus();

		}

		// 매장 상세보기 쓰기 팝업창 이동
		// 로그인 검증 필요 없을시 alert창
		function popUpWrite(isLogOn,restIdx){
			if (isLogOn != '' && isLogOn != false) {
				const url ="${contextPath }/restaurants/restaurantsReviewWrite.do?restIdx="+restIdx;
					const name = "a";
					const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
					window.open(url,name,option);
					a.focus();
			} else {
				alert("로그인 후 글쓰기가 가능합니다.");
				return;
			}
			
		}
		
		// 매장 상세보기 수정/삭제 팝업창 이동
		// 만약 작성자가 아닐시 보이지 않게 하기
		function popUpFix(reviewIdx){
				const url ="${contextPath }/restaurants/restaurantsReviewMod.do?reviewIdx="+reviewIdx+"&restIdx="+"${restaurant.restIdx}";
				const name = "a";
				const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
				window.open(url,name,option);
		}
		
		// 사진 상세보기 팝업창 이동
		function popUpPhoto(){
			const url ="${contextPath}/restaurants/restaurantsPhoto.do?restIdx="+"${restaurant.restIdx}"
			const name = "a";
			const option = "width ="+popWidth+", height ="+popHeight+", top="+nTop+", left="+nLeft+",location=no,toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no";
			window.open(url,name,option);
		}
		
		// 네이버 지도 api 
		const restAddress = "${restaurant.restAddress }";
		$(function() {
			naver.maps.Service.geocode({
				query : restAddress
		}, function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					return alert('Something wrong!');
				} 
				const result = response.v2, // 검색 결과의 컨테이너
		        items = result.addresses;
				const x = parseFloat(items[0].x); // 경도
				const y = parseFloat(items[0].y); // 위도
					
				var map = new naver.maps.Map('map', {
					center : new naver.maps.LatLng(y, x),
					zoom : 19
				});
				var marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(y, x),
					map : map
				});
			});
		});
		
		// 추천해요 기능 추가
		function goodCheck(isLogOn,articleIdx,restaurantIdx){
			if (isLogOn != '' && isLogOn != false) {
			 	$.ajax({
			 		url : "${contextPath}/board/goodCheck.do?restIdx="+restaurantIdx+"&articleIdx="+articleIdx,
			 		type : "get",
			 		async: false,
			 		data: "",
			 		success:function(data){
			 			alert("추천하였습니다.");
			 			location.reload();
		 			}
			 	});
			}
			else{
				alert("로그인후 이용가능합니다.");
				return false;
			}
		}
		// 추천해요 중복 체크인 경우
		function overlapGoodCheck(){
			alert("이미 추천하셨습니다.");
			return false;
			}
		
		// 찜하기 구현 
		
		function jjimCancel(){
			if(confirm("찜 목록에서 삭제하시겠습니까?")==true){
				$.ajax({
					url : "${contextPath}/jjim/jjimCancel.do?restIdx="+restIdx,
					type : "get",
					async: false,
					data : "",
					success:function(data){
							alert("삭제되었습니다.");
							location.reload();
					}
				});
			}
			else{
				return false;
			}
		}
		function jjimAdd(isLogOn){
			if (isLogOn != '' && isLogOn != false) {
				if(confirm("찜 목록에 추가하시겠습니까?")==true){
					$.ajax({
						url : "${contextPath}/jjim/jjimAdd.do?restIdx="+restIdx,
						type : "get",
						async: false,
						data : "",
						success:function(data){
								alert("추가되었습니다.");
								location.reload();
						}
					});
				}
				else{
					return false;
				}
			}
			else{
				alert("로그인후 이용가능합니다.");
				return false;
			}
		}		
	</script>
</body>
</html>