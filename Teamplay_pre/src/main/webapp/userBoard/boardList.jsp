<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale=1.0">
	<title>유저 게시판</title>
	<link href="boardList.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="Header.jsp" %>
	<div id="wholeContainer">
		<div class="side"></div>
	
		<div class="container">
			<div>
				<h2 style="color: #9bb7d6;" >유저 게시판</h2>
			</div>
			
			<div class="topContent">
				<div class="leftRight">
			 		<h2>오늘의 화제</h2>
			 		<ul>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 		</ul>
			 	</div>
			 	
			 	<div class="leftRight">
			 		<h2>답변이 필요해요</h2>
			 		<ul>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 			<li>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</li>
			 		</ul>
			 	</div>
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
						<col style="width: 8%">
						<col style="width: 8%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cen">ㅇ</td>
							<td>ㅇ</td>
							<td class="cen">ㅇ</td>
							<td class="cen">ㅇ</td>
							<td class="cen">ㅇ</td>
							<td class="cen">ㅇ</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<br/>
			
			<div class="postArea">
				<input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp'" />
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
	<%@ include file="Footer.jsp" %>
</body>
</html>