<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel ="stylesheet" href="event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<script type="text/javascript">
	
	</script>
	<title>HUGO - 이벤트 글쓰기</title>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<div id="eventWriterContainer">
		<div class="eventWriter"><h1>이벤트 글쓰기</h1></div>
		<div id="selectBox">
			<select name="boarder" id="boarderSelect">
			    <option value="">게시판을 선택해 주세요</option>
			    <option value="runningEvent">진행중 이벤트</option>
			    <option value="endEvent">종료된 이벤트</option>
			    <option value="coupone">쿠폰</option>
			</select>
			<select name="writeHeader" id="writeHeaderSelect">
			    <option value="">말머리를 선택해 주세요</option>
			    <option value="attendance">출석체크 Event!</option>
			    <option value="monthly">이달의 이벤트</option>
			    <option value="birth">생일 이벤트</option>
			    <option value="new">신규 이벤트</option>
			</select>
		</div>
		<div id="eventTitle">
			<input type="text" style="width :100%; height:30px; font-size:20px; float:left;"/>
		</div>
		<div id="eventContent">
			<textarea style="width:100%; height:500px;"></textarea>
		</div>
		<div id="eventFile">
			<input type="file" class="fileBox"/>
		</div>
		<div class="eventWriteBtn">
			<input type="button" value="등록" class="eventBtn"/>
			<input type="reset" value="다시입력" class="eventBtn"/>
			<input type="button" value="목록으로" class="eventBtn" onclick="location.href='../eventPage/runningEventPage.jsp'"/>
		</div>
		<div style="height: 90px;"></div>
	</div>
	
	<%@ include file="../main/Footer.jsp" %>
</body>
</html>