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
	<title>비밀번호확인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		#chkPwd{
			width:40%;
			height: 400px;
			margin:auto;
			margin-top: 20px;
		}
		
		#chkPwd #infoTable{
			margin-top: 20px;
			width:100%;
			border: none;
			font-size: 20px;
		}
		#chkPwd #infoTable tr{
			height:20px;
		}
		#chkPwd #infoTable .memberInfo{
			text-align: center;
			font-size: 30px;
		}
		#chkPwd #infoTable .inputPwTr{
			text-align: center;
		}
		
		#chkPwd #infoTable .inputPw{
			width: 80%;
			height: 50px;
			color:  #A4A4A4;
			border: 2px solid #A4A4A4;
		}
		#chkPwd #infoTable .guide{
			font-size: 8px;
			padding-left:60px;
		}
		
		
		#chkPwd #buttons{
			margin: 30px auto;
			box-sizing:border-box;
			width:180px;
			height:60px;
		}
		#chkPwd #buttons #btn_ChangeInfo{
			margin: auto;
			width:100%;
			height:100%;
			font-size: 23px;
			background-color: #9bb7d6;
			border-radius: 0.4em;
		}
	</style>
	<script type="text/javascript">
		function fn_pwChk(){
				if($("#inputPw").val()==null || $("#inputPw").val()!=${member.pwd}){
					alert("비밀번호를 확인해 주세요")
					return false
				}else{
					location.href='${contextPath}/memberInfo/updateMemberForm.do'
				}
		}
	</script>
</head>
<body>
	<div id="chkPwd">
		<table id="infoTable">
			<tr>
				<td class="memberInfo" rowspan="5">Member Info</td>
			</tr>
			<tr></tr><tr></tr><tr></tr><tr></tr>
			<tr class="inputPwTr">
				<td><input id="inputPw" class="inputPw" type="text" placeholder="비밀번호"/></td>
				<br/>
				<td><a>${member.pwd }</a></td>
			</tr>
			<tr>
				<td ><p class="guide">회원정보를 변경하기 위해 비밀번호를 입력해 주세요</p></td>
			</tr>
		</table>
		
		<div id="buttons">
			<input  id="btn_ChangeInfo" type="button" value="비밀번호확인"  onclick="fn_pwChk()" />
		</div>
	</div> 
</body>
</html>