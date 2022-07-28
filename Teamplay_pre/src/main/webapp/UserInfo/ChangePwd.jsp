<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비밀번호수정</title>
	<link rel ="stylesheet" href="InfoStyle.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<div id="chagnePwd">
		<table id="infoTable">
			<tr class="trPwd">
				<td><input class="inputPwd" type="text" onfocus="this.type='password', this.value='';"  value="비밀번호 확인"/></td>
			</tr>	
			<tr>
				<td><p class="GuidePwd">현재 비밀번호를 입력해 주세요</p></td>
			</tr>	
			<tr class="trPwd">
				<td><input class="inputPwd" type="text" onfocus="this.type='password', this.value='';"  value="신규 비밀번호"/></td>
			</tr>	
			<tr>
				<td><p class="GuidePwd">비밀번호 조건들</p></td>
			</tr>
			<tr class="trPwd">
				<td><input class="inputPwd" type="text" onfocus="this.type='password', this.value='';"  value="신규 비밀번호"/></td>
			</tr>	
			<tr>
				<td><p class="GuidePwd">변경하실 비밀번호를 다시 입력해 주세요</p></td>
			</tr>
		</table>
		<div id="buttons">
			<input  id="btn_ChangeInfo" type="button" value="수정완료" onclick="location.href=''" />
			<input  id="btn_ChangeInfo" type="button" value="화원정보" onclick="location.href=''" />
		</div>
	</div> 
	
	
	<%@ include file="../main/Footer.jsp" %>

</body>
</html>