<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel ="stylesheet" href="${contextPath }/resources/css/main.css" type="text/css"/>
	<link rel ="stylesheet" href="${contextPath }/resources/css/board.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
</head>
<body>
	<div id="wholeContainer">
   		<div class="side"></div>

		<div class="container">
			<div>
				<h2 style="color: #9bb7d6;" >유저 게시판</h2>
			</div>
			
			<div class="cateArea">
				<div id="cate">
		 			<a>전체</a>
		 			<a>맛집</a>
		 			<a>명소</a>
		 			<a>축제</a>
		 		</div>
		 
		 		<div id="search">
		 			<select>
		 				<option selected>제목</option>
		 				<option value="내용">내용</option>
		 			</select>
		 			<input type="text">
		 			<button type="submit">검색</button>
		 		</div>
			</div>
			
		<form action="${contextPath }/board/addNewArticle.do" method="post" enctype="multipart/form-data">
			<div id="writeBox">
				<div id="title" style="margin: 0 auto;">
					
					<div id="titleLeft">
						<select id="cate" name="cate">
							<option>맛집</option>
							<option>명소</option>
							<option>축제</option>
						</select>
						
						제목: <input type="text" name="title"/>
					</div>
					
					<div id="titleRight">
						작성자: <input type="text" id="nickname"  value="홍길동" disabled />
						<input type="hidden" name="nickname" value="홍길동"/>
					</div>
				</div>
				
				<div style="width: 99%; margin: 10px auto;" >
					<textarea rows="10" cols="30" id="ir1" name="content" style="width: 100%"></textarea>
				</div>
			</div>
			
			<div class="btnBox">
				<input class="btn" type="button" value="목록으로" onclick="location.href='${contextPath }/board/listArticles.do'">
				<input class="btn" type="submit" value="작성 완료">
			</div>
		</form>
			
		</div>
		
		<br/><br/><br/>
	</div>
</body>
</html>