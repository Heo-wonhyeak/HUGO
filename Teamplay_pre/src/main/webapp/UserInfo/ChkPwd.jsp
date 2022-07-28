<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비밀번호확인</title>
	<link rel ="stylesheet" href="InfoStyle.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<div id="chkPwd">
		<table id="infoTable">
			<tr>
				<td class="memberInfo" rowspan="5">Member Info</td>
			</tr>
			<tr></tr><tr></tr><tr></tr><tr></tr>
			<tr class="inputPwdTr">
				<td><input class="inputPwd" type="text" onfocus="this.type='password', this.value='';"  value="&nbsp;&nbsp;비밀번호"/></td>
			</tr>
			<tr>
				<td ><p class="guide">회원정보를 변경하기 위해 비밀번호를 입력해 주세요</p></td>
			</tr>
		</table>
		
		<div id="buttons">
			<input  id="btn_ChangeInfo" type="button" value="비밀번호확인" onclick="location.href=''" />
		</div>
	</div> 
	
	
	<%@ include file="../main/Footer.jsp" %>

</body>
</html>