<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>진행중 이벤트페이지</title>
	<link rel ="stylesheet" href="event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<table align="center" width="95%" >
		<tr align="center">
			<td width="30%" id="selectTd" class="eventTd" onclick="location.href='runningEventPage.jsp'">
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
				<img src="../img/cuteCat.jpeg" alt="고양이 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
			<td>
				<img src="../img/cuteCat.jpeg" alt="고양이 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
			<td>
				<img src="../img/cuteCat.jpeg" alt="고양이 사진" class="picture"/>
				<div class="enterTitle" onclick="location.href='eventDTL.jsp'">
					<span class="eventTitle">아기고양이 </span> <span class="eventCount"> [160]</span><br/>
					<span class="eventPeriod"> 2022.06.16~ 2022.07.16</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">페이징</td>
			<td><button onclick="location.href='eventWriter.jsp'" id="eventWriteBtn">글쓰기</button></td>
		</tr>
	</table>
	
	<%@ include file="../main/Footer.jsp" %>
</body>
</html>