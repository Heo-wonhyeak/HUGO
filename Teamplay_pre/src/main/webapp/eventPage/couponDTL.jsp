<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>쿠폰 상세페이지</title>
	<link rel ="stylesheet" href="event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<script type="text/javascript">
		function declaration() {
				window.open("declaration.jsp","a","width=400, height=300, left=100, top=50")
			}
		function fn_like() {
			let like = document.getElementById("like");
			let unlike = document.getElementById("unlike");
			if(unlike.value == "unlike") {
				like.innerHTML = "<i class='fa-solid fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;0<input type='hidden' id='unlike' value='like'/>";
			}
			
			if(unlike.value == "like") {
				like.innerHTML = "<i class='fa-regular fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;0<input type='hidden' id='unlike' value='unlike'/>";
			}
			
		}
	</script>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<table width="95%" align="center">
		<tr>
			<th class="DTLHeader" width="10%">게시물번호</th>
			<th class="DTLHeader" width="45%" align="left">제목</th>
			<th class="DTLHeader" width="35%">이벤트 기간</th>
			<th class="DTLHeader" width="10%">게시물작성자</th>
		</tr>
		<tr>
			<th class="DTLLine" width="10%">no.022</th>
			<th class="DTLLine" width="45%" align="left">아기강아지</th>
			<th class="DTLLine" width="35%">2022-06-01 ~ 2022-06-30</th>
			<th class="DTLLine" width="10%">지기</th>
		</tr>
	</table>
	<div width="100%" align="center">
		<img alt="강아지사진" src="../img/cuteDog.jpeg" width="90%"/>
	</div>
	
	<%@ include file="../main/Footer.jsp" %>
	
</body>
</html>