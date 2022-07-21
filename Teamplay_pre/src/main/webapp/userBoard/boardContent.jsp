<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale=1.0">
	<title>게시글 상세보기</title>
	<link href="boardContent.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="Header.jsp" %>

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
			
			
			<div id="contentBox">
				<div id="titleBox" style="margin: 0 auto;">
					<div id="title">
						제목
					</div>
					
					<div id="userInfo">
						<div>홍길동 2022. 06. 20 12:00:00</div>
						<div>조회 10 추천 0 댓글 1</div>
					</div>
				</div>
				
				<div id="contents">
					<div id="img">
						<img alt="image" src="../img/image.png">
					</div>
					<div id="content">내용</div>
					
					<br/>
			
					<div class="btnBox">
						<input class="btn" type="button" value="목록으로" onclick="location.href='boardList.jsp'">
					</div>
					
				</div>
				
			</div>


			
			
			<div class="replyBox">
				<div><h2>댓글</h2></div>
				<div class="reply">
					<div class="replyName"><h4>홍길동</h4></div>
					<div class="replyContent">재미있을 것 같아요!</div>
					<div class="replyInfo">
						<span class="replyDate">2022-06-10 16:30:30</span>
						<span class="replybtn">
							<input class="rebtn" type="button" value="댓글 수정" />
							<input class="rebtn" type="button" value="댓글 삭제" />
						</span>
					</div>
				</div>
				
				<div id="writeReply">
					<table style="width: 100%; text-align: center;">
						<tr>
							<td>홍길동</td>
							<td width="80%"><textarea style="width: 90%"></textarea></td>
							<td><button id="leaveReply" type="button">등록</button></td>
						</tr>
					</table>
				</div>
				
			</div>
			
		</div>
	
		<div class="side"></div>
	</div>
	<br/>
	
	<%@ include file="Footer.jsp" %>
</body>
</html>