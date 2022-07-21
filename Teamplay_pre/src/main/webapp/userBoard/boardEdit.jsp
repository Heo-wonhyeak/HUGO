<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width-device-width, initial-scale=1.0">
	<title>게시글 작성하기</title>
	<link href="boardWrite.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../userBoard_se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
			
			<div id="writeBox">
				<div id="title" style="margin: 0 auto;">
					
					<div id="titleLeft">
						<select id="cate">
							<option>맛집</option>
							<option>명소</option>
							<option>축제</option>
						</select>
						
						제목: <input type="text">
					</div>
					
					<div id="titleRight">
						작성자: 홍길동
					</div>
				</div>
				
				<div style="width: 99%; margin: 10px auto;" >
					<textarea rows="10" cols="30" id="ir1" name="ir1" style="width: 100%"></textarea>
				</div>
			</div>
			
			<div class="btnBox">
				<input class="btn" type="button" id="toList" value="목록으로" onclick="location.href='boardList.jsp'">
				<input class="btn" type="submit" value="작성 완료">
			</div>
		</div>
		
		
	
		<div class="side"></div>
	</div>
	
	
	
	<br/>
	<%@ include file="Footer.jsp" %>
	
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "ir1",
		 sSkinURI: "../userBoard_se2/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	</script>
</body>
</html>