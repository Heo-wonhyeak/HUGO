<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="starList" value="${top10List.starList }" />
<c:set var="steamedList" value="${top10List.steamedList }" />
<c:set var="visitList" value="${top10List.visitList}"/>
<c:set var="distanceList" value="${top10List.distanceList }" />
<c:set var="famousList" value="${top10List.famousList}"/>
<c:set var="starImgList" value="${top10List.starImgList }" />
<c:set var="steamedImgList" value="${top10List.steamedImgList }" />
<c:set var="visitImgList" value="${top10List.visitImgList}"/>
<c:set var="distanceImgList" value="${top10List.distanceImgList }" />
<c:set var="famousImgList" value="${top10List.famousImgList}"/>
    <!DOCTYPE html>
    <html lang="UTF-8">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0" />
        <title>중간 TOP 10</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Swiper -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
        <link rel ="stylesheet" href="${contextPath }/resources/css/main.css" type="text/css"/>
    </head>

    <body>
        <section>    
            <div id="menubox">
                <ul id="menulist">
                    <li><input type="button" class="top10list" onclick="listfocus()" id="star-view" value="별점" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="visit" value="방문횟수" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="steamed" value="가장 많은 찜" />
                    </li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="distance" value="거리순" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="popularity" value="인기순" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" value="(TOP 10)" disabled /></li>
                </ul>
            </div>
            <div class="swiper-container" id="star-first">
                <h3 class="top10head" id="star-view-focus">별점 TOP 10</h3>
                <div class="swiper-wrapper">
					<c:forEach items="${starList}" var="item" varStatus="status" end="10">
						<div class="swiper-slide">
	                        <div class="slide-image" id="star1">
	                            <img class="list-image" alt="" src="${contextPath}/download.do?imageFileName=${starImgList[status.index].imageFileName}&imageFileNO=${starImgList[status.index].imageFileNO}&restaurantIdx=${starImgList[status.index].restaurantIdx}"></img>
	                            <div class="list-info">
	                                <span class="list-info-name">${item.restName }</span><span class="list-info-value">⭐&nbsp;&nbsp;${item.restStarAvg }</span>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>          
				</div>
                <!-- 양옆 좌우버튼 -->
                <div class="swiper-button-next Nbtn1"></div>
                <div class="swiper-button-prev Pbtn1"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>
            

            <div class="swiper-container" id="visit-second">
                <h3 class="top10head" id="visit-focus">방문횟수 TOP 10</h3>
                <div class="swiper-wrapper">
                    <c:forEach items="${visitList}" var="visitList" varStatus="status" end="10">
						<div class="swiper-slide">
	                        <div class="slide-image" id="star1">
	                            <img class="list-image" alt="" src="${contextPath}/download.do?imageFileName=${visitImgList[status.index].imageFileName}&imageFileNO=${visitImgList[status.index].imageFileNO}&restaurantIdx=${visitImgList[status.index].restaurantIdx}"></img>
	                            <div class="list-info">
	                                <span class="list-info-name">${visitList.restName }</span><span class="list-info-value">😀&nbsp;&nbsp;${visitList.restVisitCount }</span>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
                </div>
                <div class="swiper-button-next Nbtn2"></div>
                <div class="swiper-button-prev Pbtn2"></div>

                <p class="view-more"><a href="#">더보기</a></p>
            </div>

            <div class="swiper-container" id="steamed-third">
                <h3 class="top10head" id="steamed-focus">가장 많은 찜 TOP 10</h3>
                <div class="swiper-wrapper">
               		  <c:forEach items="${steamedList}" var="item" varStatus="status" end="10">
							<div class="swiper-slide">
	                     	   <div class="slide-image" id="star1">
	                     	        <img class="list-image" alt="" src="${contextPath}/download.do?imageFileName=${steamedImgList[status.index].imageFileName}&imageFileNO=${steamedImgList[status.index].imageFileNO}&restaurantIdx=${steamedImgList[status.index].restaurantIdx}"></img>
	                         	   <div class="list-info">	
	                              	  <span class="list-info-name">${item.restName }</span><span class="list-info-value">❤️ &nbsp;&nbsp;${item.restVisitCount }</span>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
                </div>
                <div class="swiper-button-next Nbtn3"></div>
                <div class="swiper-button-prev Pbtn3"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>


            <div class="swiper-container" id="distance-fourth">
                <h3 class="top10head" id="distance-focus">거리순 TOP 10</h3>
                	<div class="swiper-wrapper">
	                	<c:forEach items="${distanceList}" var="item" varStatus="status" end="10">
								<div class="swiper-slide">
		                     	   <div class="slide-image" id="star1">
		                     	      <img class="list-image" alt="" src="${contextPath}/download.do?imageFileName=${distanceImgList[status.index].imageFileName}&imageFileNO=${distanceImgList[status.index].imageFileNO}&restaurantIdx=${distanceImgList[status.index].restaurantIdx}"></img>
		                         	   <div class="list-info">	
		                              	  <span class="list-info-name">${item.restName }</span><span class="list-info-value">️ &nbsp;&nbsp;100&nbsp;&nbsp;m</span>
		                            </div>
		                        </div>
		                    </div>
						</c:forEach>
                </div>
                <div class="swiper-button-next Nbtn4"></div>
                <div class="swiper-button-prev Pbtn4"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>


            <div class="swiper-container" id="popularity-fifth">
                <h3 class="top10head" id="popularity-focus">인기순 TOP 10</h3>
                	<div class="swiper-wrapper">
	                	<c:forEach items="${famousList}" var="item" varStatus="status" end="10">
								<div class="swiper-slide">
		                     	   <div class="slide-image" id="star1">
		                     	       <img class="list-image" alt="" src="${contextPath}/download.do?imageFileName=${famousImgList[status.index].imageFileName}&imageFileNO=${famousImgList[status.index].imageFileNO}&restaurantIdx=${famousImgList[status.index].restaurantIdx}"></img>
		                         	   <div class="list-info">	
		                              	  <span class="list-info-name">${item.restName }</span><span class="list-info-value">️👍 &nbsp;&nbsp;${item.restStarAvg }</span>
		                            </div>
		                        </div>
		                    </div>
						</c:forEach>
                </div>
                <div class="swiper-button-next Nbtn5"></div>
                <div class="swiper-button-prev Pbtn5"></div>
                <p class="view-more"><a href="${contextPath}/restaurants/restaurantsList.do">더보기</a></p>
            </div>
        </section>
        <script>

            $(document).ready(function () {

                /* focus */
                $('#star-view').click(function () {
                    const offset = $('#star-view-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#visit').click(function () {
                    const offset = $('#visit-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#steamed').click(function () {
                    const offset = $('#steamed-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#distance').click(function () {
                    const offset = $('#distance-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#popularity').click(function () {
                    const offset = $('#popularity-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#festival').click(function () {
                    const offset = $('#festival-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
                $('#sights').click(function () {
                    const offset = $('#sights-focus').offset();
                    $('html').animate({ scrollTop: offset.top }, 400);
                });
            });
            document.addEventListener("DOMContentLoaded", function () {

                //initialize swiper when document ready
                // 별점 TOP 10
                const mySwiper = new Swiper('#star-first', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격
                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn1',
                        prevEl: '.Pbtn1',
                    },
                    // 반응형
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 2,
                            slidesPerGroup: 2,
                        }
                    }
                });
                // 방문횟수 TOP 10
                const mySwiper2 = new Swiper('#visit-second', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn2',
                        prevEl: '.Pbtn2',
                    },
                    // 반응형
					breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });
                // 가장 많은 찜 TOP10
                const mySwiper3 = new Swiper('#steamed-third', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn3',
                        prevEl: '.Pbtn3',
                    },
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });
                // 거리순 TOP 10
                const mySwiper4 = new Swiper('#distance-fourth', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn4',
                        prevEl: '.Pbtn4',
                    },
                    // 반응형
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });
                // 인기순 TOP 10
                const mySwiper5 = new Swiper('#popularity-fifth', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn5',
                        prevEl: '.Pbtn5',
                    },
                    // 반응형
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });
                // 축제 TOP 10
                const mySwiper6 = new Swiper('#festival-sixth', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn6',
                        prevEl: '.Pbtn6',
                    },
                    // 반응형
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });
                // 명소 TOP 10
                const mySwiper7 = new Swiper('#sights-seventh', {
                    slidesPerView: 3,       // 슬라이드 한번에 3개를 보여줌
                    slidesPerGroup: 3,      // 그룹으로 묶을 수
                    observer: true,
                    observeParents: true,
                    spaceBetween: 10,       // 슬라이드간 간격

                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                    loopFillGroupWithBlank: true,
                    loop: false,    // true 할경우 무한반복
                    // Navigation arrows 
                    navigation: {
                        nextEl: '.Nbtn7',
                        prevEl: '.Pbtn7',
                    },
                    // 반응형
                    breakpoints: {
                        1280: {
                            slidesPerView: 3,
                            slidesPerGroup: 3,
                        },
                        720: {
                            slidesPerView: 1,
                            slidesPerGroup: 1,
                        }
                    }
                });

            });

        </script>
    </body>

    </html>