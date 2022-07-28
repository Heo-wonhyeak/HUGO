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
			
			<div class="sort">
				<form>
					<input type="radio" name="sort" value="추천">추천
					<input type="radio" name="sort" value="최신">최신
				</form>
			</div>
			
			<div class="boardList">
				<table>
					<colgroup>
						<col style="width: 8%">
						<col style="width: 52%">
						<col style="width: 16%">
						<col style="width: 8%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articlesList }" varStatus="status">
							<tr>
								<td class="cen">${status.count }</td>
								<td>${article.title }</td>
								<td class="cen">${article.nickname }</td>
								<td class="cen">${article.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br/>
			
			<div class="postArea">
				<input type="button" value="글쓰기" onclick="location.href='${contextPath}/board/articleForm.do'" />
			</div>
			
			<div class="boardBottom">
				<ul id="paging">
					<li>이전</li>
					<li>&lt;</li>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>&gt;</li>
					<li>다음</li>
				</ul>
			</div>
			
		</div>
	
		<div class="side"></div>
	</div>
	<br/>
</body>
</html>