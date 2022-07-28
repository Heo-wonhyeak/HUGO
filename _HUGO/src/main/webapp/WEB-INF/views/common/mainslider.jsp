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
		<style type="text/css">
	
	@
	-webkit-keyframes fade {
		from {opacity: .4
	}
	
	to {
		opacity: 1
	}
	
	}
	@
	keyframes fade {
		from {opacity: .4
	}
	
	to {
		opacity: 1
	}
	}
	
	.bclick {
		margin-top: -40px;
		margin-left: 1100px;
		position: absolute;
	}
	</style>
	
	<script type="text/javascript">
		var slideIndex = 0; //slide index
	
		window.onload=function(){
		  showSlides(slideIndex);
	
		  var sec = 5000;
		  setInterval(function(){
		    slideIndex++;
		    showSlides(slideIndex);
	
		  }, sec);
		}
	
		function moveSlides(n) {
		  slideIndex = slideIndex + n
		  showSlides(slideIndex);
		}
	
		
		function currentSlide(n) {
		  slideIndex = n;
		  showSlides(slideIndex);
		}
	
		function showSlides(n) {
	
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  var size = slides.length;
	
		  if ((n+1) > size) {
		    slideIndex = 0; n = 0;
		  }else if (n < 0) {
		    slideIndex = (size-1);
		    n = (size-1);
		  }
	
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
	
		  slides[n].style.display = "block";
		  dots[n].className += " active";
		}
		</script>
</head>
<body>
	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="numbertext">1 / 6</div>
			<img
				src="https://ifh.cc/g/lXcVTR.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 6</div>
			<img
				src="https://ifh.cc/g/Nmt5vo.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 6</div>
			<img
				src="https://ifh.cc/g/z2n5Ho.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">4 / 6</div>
			<img
				src="https://ifh.cc/g/rzFTaP.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">5 / 6</div>
			<img
				src="https://ifh.cc/g/fj9LWL.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">6 / 6</div>
			<img
				src="https://ifh.cc/g/rZZk2V.png"
				style="width: 100%">
			<div class="text">HUGO</div>
		</div>

		<a class="prev" onclick="moveSlides(-1)">&#10094;</a> <a class="next"
			onclick="moveSlides(1)">&#10095;</a>
	</div>

	<!-- The dots/circles -->
	<div class = "bclick">
		<span class="dot" onclick="currentSlide(0)"></span> <span class="dot"
			onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span> <span class="dot"
			onclick="currentSlide(4)"></span> <span class="dot"
			onclick="currentSlide(5)"></span>
	</div>
</body>
</html>