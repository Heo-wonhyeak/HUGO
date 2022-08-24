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
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<style>
		.search-form * {
		  box-sizing: border-box;
		  font-family: 'Noto Sans KR', sans-serif;
		  border-radius: 5px;
		}
		.search-form {
			width:40%;
			height: 300px;
			margin:auto;
			margin-top: 20px;
		}
		.search-form form{
			margin: 0 auto;
		}
		form table{
			margin: auto;
 		}
		form table .infoname{
			width:25%;
			height: 35px;
			margin-right: 10px;
			padding-right: 10px;
		}
		form .btnDiv{
			width: 280px;
			height: 200px;
			margin: 0 auto;
		}
		form .btnDiv .btn1{
			width:100px;
			height:33px;
			font-size: 23px;
			background-color: #9bb7d6;
			border-radius: 0.4em;
			margin-left: 100px;
			margin-top: 20px;
			margin-bottom: 30px;
		}
		form .btnDiv .btn2{
			height:20px;
			font-size: 12px;
			background-color: #9bb7d6;
			border-radius: 0.4em;		
			margin-bottom: 30px;
			float: right;
		}
		.inputLine{
			width: 200px;
		}
		
	</style>
</head>
<body>
	<div class="search-form">
		<h2>비밀번호 찾기</h2>
		<form name=searchPwForm method="post" action="${contextPath }/member/searchPw.do">
			<table>
				<tr>
					<td class="infoname">아이디&nbsp;:</td>
					<td><input class="inputLine" type="text" name="id" ></td>
				</tr>
				<tr>
					<td>이메일&nbsp;:</td>
					<td><input type="text" class="inputLine" name="email" ></td>
				</tr>	
			</table>
			<div class="btnDiv">
				<input type="submit" class="btn1" value="확인"><br/>
				
				<label>아이디가 기억나지 않나요?</label><input type="button" class="btn2" value="아이디찾기" onClick="location.href('searchIdForm.do')">
			</div>			
		</form>
		
	</div>
</body>
</html>