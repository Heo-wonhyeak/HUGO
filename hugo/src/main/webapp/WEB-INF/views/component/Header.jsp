<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel ="stylesheet" href="css/MainStyle.css?1" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<title>헤더</title>
</head>
<body>
	<div class="HeaderContainer">
		<div class="HeaderLogo">
			로고
		</div>
		<div class="search">
			<input type="text" class="searchbox"/>
			<button class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<div class="headerMenu">
			<a>이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			&nbsp;&nbsp;
			<a><i class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>
</body>
</html>