<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="MainStyle.css" type="text/css" />
    </head>

    <body>
        <section>
            <div id="place_cate">
                <div class="place_circle" onclick="location.href='../place/restaurants/list.jsp?'">맛집</div>
                <div class="place_circle" onclick="location.href='../place/festival/list.jsp?'">명소</div>
                <div class="place_circle" onclick="location.href ='../place/sights/list.jsp?'">축제</div>
            </div>
            <div id="menubox">
                <ul id="menulist">
                    <li><input type="button" class="top10list" onclick="listfocus()" id="star-view" value="별점" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="visit" value="방문횟수" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="steamed" value="가장 많은 찜" />
                    </li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="distance" value="거리순" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="popularity" value="인기순" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="festival" value="축제" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" id="sights" value="명소" /></li>
                    <li><input type="button" class="top10list" onclick="listfocus()" value="(TOP 10)" disabled /></li>
                </ul>
            </div>
            <div class="swiper-container" id="star-first">
                <h3 class="top10head" id="star-view-focus">별점 TOP 10</h3>
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="slide-image" id="star1">
                            <div class="list-image"></div>
                            <div class="list-info">
                                <span class="list-info-name">이젠</span><span class="list-info-value">⭐️</span>
                            </div>

                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="star9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="slide-image" id="star10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>

                <!-- 양옆 좌우버튼 -->
                <div class="swiper-button-next Nbtn1"></div>
                <div class="swiper-button-prev Pbtn1"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>
            </div>

            <div class="swiper-container" id="visit-second">
                <h3 class="top10head" id="visit-focus">방문횟수 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="visit10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>

                <div class="swiper-button-next Nbtn2"></div>
                <div class="swiper-button-prev Pbtn2"></div>

                <p class="view-more"><a href="#">더보기</a></p>
            </div>

            <div class="swiper-container" id="steamed-third">
                <h3 class="top10head" id="steamed-focus">가장 많은 찜 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="steamed10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next Nbtn3"></div>
                <div class="swiper-button-prev Pbtn3"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>


            <div class="swiper-container" id="distance-fourth">
                <h3 class="top10head" id="distance-focus">거리순 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="distance10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next Nbtn4"></div>
                <div class="swiper-button-prev Pbtn4"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>


            <div class="swiper-container" id="popularity-fifth">
                <h3 class="top10head" id="popularity-focus">인기순 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image" id="popularity10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next Nbtn5"></div>
                <div class="swiper-button-prev Pbtn5"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>

            <div class="swiper-container" id="festival-sixth">
                <h3 class="top10head" id="festival-focus">축제 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image2" id="festival10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next Nbtn6"></div>
                <div class="swiper-button-prev Pbtn6"></div>
                <p class="view-more"><a href="#">더보기</a></p>
            </div>

            <div class="swiper-container" id="sights-seventh">
                <h3 class="top10head" id="sights-focus">명소 TOP 10</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights1">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights2">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights3">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights4">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights5">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights6">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights7">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights8">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights9">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-image3" id="sights10">
                            <div class="list-image"></div>
                            <div class="list-info"></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next Nbtn7"></div>
                <div class="swiper-button-prev Pbtn7"></div>
                <p class="view-more"><a href="#">더보기</a></p>
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

                /* 클릭시 상세보기 페이지로 바로이동 */
                $('.slide-image').click(function () {
                    const id = document.getElementById;
                    location.href = "../place/restaurants/view.jsp?restaurant_idx=" + id.resturants_idx;
                });
                $('.slide-image2').click(function () {
                    const id = document.getElementById;
                    location.href = "../place/festival/view.jsp?festival_idx=" + id.festival_idx;
                });
                $('.slide-image3').click(function () {
                    const id = document.getElementById;
                    location.href = "../place/sights/view.jsp?sights_idx=" + id.sights_idx;
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