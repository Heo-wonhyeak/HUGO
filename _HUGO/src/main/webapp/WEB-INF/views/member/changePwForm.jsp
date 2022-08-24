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
			margin-top: 20px;
			margin-bottom: 30px;
		}
		
		.inputLine{
			width: 200px;
		}
		
	</style>
	<script type="text/javascript">
		function fn_Submit(){
			if($("#pwd1").val() != $("#pwd2").val()){
				alert("비밀번호를 확인해 주세요")
				return false
			}
			else{
				$("#searchPwForm").submit();
			}
		}
	</script>
</head>
<body>
	<div class="search-form">
		<h2>비밀번호 변경</h2>
		<form id="searchPwForm" method="post" action="${contextPath }/member/updatePw.do">
			<table>
				<tr>
					<td class="infoname">신규 비밀번호&nbsp;:</td>
					<td><input type="text" id="pwd1" name="pwd" ></td>
				</tr>
				<tr>
					<td>비밀번호 확인&nbsp;:</td>
					<td><input type="text" id="pwd2"></td>
				</tr>	
			</table>
			<div class="btnDiv">
				<input type="button" class="btn1" value="확인" onClick="fn_Submit()"><br/>
			</div>			
		</form>
	</div>
</body>
</html>