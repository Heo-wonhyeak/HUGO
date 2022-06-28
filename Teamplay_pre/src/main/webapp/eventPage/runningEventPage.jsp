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
	<header>
		<div class="h_wrap">
			헤더
		</div>
	</header>
	<table align="center" width="100%">
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
		<tr align="center">
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
	</table>
</body>
</html>