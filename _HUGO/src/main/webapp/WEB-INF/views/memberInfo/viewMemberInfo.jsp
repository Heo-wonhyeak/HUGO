<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보확인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		#chkInfo{
	width:40%;
	margin:auto;
	margin-top: 20px;
		}
		#chkInfo #infoTable{
			width:100%;
			border: 1px solid #A4A4A4;
			border-right: none;
			border-collapse: collapse;
			font-size: 20px;
		}
		#chkInfo #infoTable .infoName{
			width:25%;
			height: 35px;
			border : 1px solid #A4A4A4;
			padding-left:15px;
		}
		#chkInfo #infoTable .infoDetail{
			width:75%;
			border : 1px solid #A4A4A4;
			border-right: none;
			}
		#chkInfo #infoTable .infoDetail input{
			height:100%;
			margin-left: 15px;
			background-color: white;
			border: none;
			font-size: 20px;
		}
		#chkInfo #infoTable .infoDetail .pwd{
			width: 80px;
		}
		#chkInfo #infoTable .infoDetail .Btn_change{
			width:40px;
			font-size:15px;
			background-color:  #9bb7d6;
			border :2px solid black;
			border-radius: 0.3em;
			text-align: center;
		}
		#chkInfo #buttons{
			margin: 30px auto;
			box-sizing:border-box;
			width:180px;
			height:60px;
		}
		#chkInfo #buttons #btn_ChangeInfo{
			margin: auto;
			width:100%;
			height:100%;
			font-size: 23px;
			background-color: #9bb7d6;
			border-radius: 0.4em;
		}
	</style>
</head>
<title>회원정보조회</title>
</head>
<body>
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
			<input  id="btn_ChangeInfo" type="button" value="회원정보수정" onclick="location.href='${contextPath}/memberInfo/checkPwd.do'" />
		</div>
	</div> 

</body>
</html>