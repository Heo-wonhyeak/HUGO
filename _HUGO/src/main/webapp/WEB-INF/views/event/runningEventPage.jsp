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
	<title>진행중 이벤트 페이지</title>
	<link rel ="stylesheet" href="${contextPath }/resources/css/event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
</head>
<body>
	<table align="center" width="95%" >
		<tr align="center">
			<td width="30%" id="selectTd" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do'">
				진행중 이벤트
			</td>
			<td width="30%" class="eventTd" onclick="location.href='endEventPage.jsp'">
				종료된 이벤트
			</td>
			<td width="30%" class="eventTd" onclick="location.href='coupon.jsp'">
				쿠폰
			</td>
		</tr>
		<tr>
			<td colspan="3"><div style="margin : 3px 0;"></div></td>
		</tr>
		<tr align="center" style="width:90%;">
			<td>
				<img src="${contextPath }/resources/img/cuteCat.jpeg" alt="고양이 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
			<td>
				<img src="${contextPath }/resources/img/cuteCat.jpeg" alt="강아지 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
			<td>
				<img src="${contextPath }/resources/img/cuteCat.jpeg" alt="고양이 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">페이징</td>
			<td><button onclick="location.href='${contextPath}/event/eventWriter.do'" id="eventWriteBtn">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>