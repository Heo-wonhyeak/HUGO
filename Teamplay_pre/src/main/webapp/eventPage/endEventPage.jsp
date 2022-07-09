<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>종료된 이벤트</title>
	<link rel ="stylesheet" href="event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<table align="center" width="95%">
		<tr align="center">
			<td width="30%" class="eventTd" onclick="location.href='runningEventPage.jsp'">
				진행중 이벤트
			</td>
			<td width="30%" id="selectTd" class="eventTd" onclick="location.href='endEventPage.jsp'">
				종료된 이벤트
			</td>
			<td width="30%" class="eventTd" onclick="location.href='coupon.jsp'">
				쿠폰
			</td>
		</tr>
	</table>
	<br/>
	<table align="center" width="90%">
		<tr>
			<th class="DTLHeader" width="10%" align="left">NO.</th>
			<th class="DTLHeader" width="45%" align="left">제목</th>
			<th class="DTLHeader" width="10%">조회수</th>
			<th class="DTLHeader" width="35%">이벤트 기간</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
		<tr>
			<th class="endEventLine" width="10%" align="left">no.001</th>
			<th class="endEventLine" width="45%" align="left">5월 출석체크 이벤트</th>
			<th class="endEventLine" width="10%">784</th>
			<th class="endEventLine" width="35%">2022-05-01 ~ 2022-05-30</th>
		</tr>
	</table>
	
	<%@ include file="../main/Footer.jsp" %>
</body>
</html>