<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="event" value="${eventMap.event }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HUGO - 이벤트 글수정</title>
	<link rel ="stylesheet" href="${contextPath }/resources/css/event.css?after" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
</head>
<body>
	<form action="${contextPath }/event/modEvent.do?event_idx=${event.event_idx}" method="post" enctype="multipart/form-data">
		<div id="eventWriterContainer">
			<div class="eventWriter"><h1>이벤트 글 수정</h1></div>
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
			<input type="hidden" name="event_idx" value="${event.event_idx }" />
			<input type="hidden" name="oldfile" value="${event.ofile }" />
			<div id="eventPeriod">
				<input type="text" name="event_period" value="${event.event_period }" placeholder="&nbsp;xxxx.xx.xx~xxxx.xx.xx" style="width: 75%; height:30px; font-size:20px;"/>
			</div>
			<div id="eventTitle">
				<input type="text" name="title" value="${event.title }" placeholder="&nbsp;제목을 입력하세요." style="width :100%; height:30px; font-size:20px; float:left;"/>
			</div>
			<div id="eventContent">
				<textarea name="content" placeholder="&nbsp;내용을 입력하세요." style="width:100%; height:500px; font-size:15px;">${event.content }</textarea>
			</div>
			<div id="eventFile">
				<input name="ofile" type="file" class="fileBox"/>
			</div>
			<div class="eventWriteBtn">
				<input type="submit" value="등록" class="eventBtn"/>
				<input type="reset" value="다시입력" class="eventBtn"/>
				<input type="button" value="목록으로" class="eventBtn" onclick="location.href='${contextPath}/event/runningEventPage.do'"/>
			</div>
			<div style="height: 90px;"></div>
		</div>
	</form>
</body>
</html>