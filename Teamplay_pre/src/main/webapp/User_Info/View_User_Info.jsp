<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보확인</title>
	<link rel ="stylesheet" href="InfoStyle.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function fn_Change_pwd(){
			let ptr = "";
			ptr += "<tr>";
			ptr +=	"<td><input type='ps'/>"
			ptr += "</tr>";
			
		}
	</script>
</head>
<title>회원정보조회</title>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
	<div id="chkInfo">
		<table id="infoTable">
			<tr>
				<td class="infoName">아이디</td>
				<td class="infoDetail"><input type="text" value="EZEN" disabled/></td>
			</tr>
			<tr id="tr_pwd">
				<td class="infoName">비밀번호</td>
				<td class="infoDetail">
					<input class="pwd" type="password" value="0824asdqwe" disabled/>
					<input class="Btn_pwd" type="button" value="변경" onclick="location.href=''" />
				</td>
			</tr>
		
			<tr>
				<td class="infoName">이름</td>
				<td class="infoDetail"><input type="text" value="이젠" disabled/></td>
			</tr>
			<tr>
				<td class="infoName">닉네임</td>
				<td class="infoDetail"><input type="text" value="EZEN강남" disabled/></td>
			</tr>
			<tr>
				<td class="infoName">이메일</td>
				<td class="infoDetail"><input type="text" value="ezen0824@gmail.com" disabled/></td>
			</tr>
			<tr>
				<td class="infoName">생년월일</td>
				<td class="infoDetail"><input type="text" value="2022.08.24" disabled/></td>
			</tr>
			<tr>
				<td class="infoName">전화번호</td>
				<td class="infoDetail"><input type="text" value="010-5555-8888" disabled/></td>
			</tr>			
		</table>
		<div id="buttons">
		<input  id="btn_ChangeInfo" type="button" value="회원정보수정" onclick="location.href=''" />
	</div>
	</div> 
	
	
	<%@ include file="../main/Footer.jsp" %>

</body>
</html>