<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Swiper -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="restaurants.css?after" type="text/css" >
<!DOCTYPE html>
<html>
<head>
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
<body>
   <section class="restaurants-photo-wrap">
          <!-- Swiper -->
	<div class="swiper-container gallery-top">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><div class="swiper-slide-container">Slide 1</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 2</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 3</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 4</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 5</div></div>
			</div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
	</div>
	<div class="swiper-container gallery-thumbs">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><div class="swiper-slide-container">Slide 1</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 2</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 3</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 4</div></div>
                <div class="swiper-slide"><div class="swiper-slide-container">Slide 5</div></div>
			</div>
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
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      centeredSlides: true,
      slidesPerView: 'auto',
      touchRatio: 0.2,
      slideToClickedSlide: true,
			loop: true,
			loopedSlides: 4
    });
    galleryTop.controller.control = galleryThumbs;
    galleryThumbs.controller.control = galleryTop;

    // 모든 사진 넣기
    // swiper wrapper 계속 늘리기
</script>
</body>
</html>