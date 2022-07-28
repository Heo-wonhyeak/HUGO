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
	<title>회원정보수정</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		#changeInfo{
			width:40%;
			margin:auto;
			margin-top: 20px;
		}
		#changeInfo #infoTable{
			width:100%;
			border: 1px solid #A4A4A4;
			border-right: none;
			border-collapse: collapse;
			font-size: 20px;
			border-spacing: 1px;
		}
		
		#changeInfo #infoTable .infoName{
			width:25%;
			height: 35px;
			border: 1px solid #A4A4A4;
			border-collapse:collapse;
			padding-left:15px;
		}
		#changeInfo #infoTable .infoDetail{
			width:75%;
			border : 1px solid #A4A4A4;
			border-right: none;
			}
		
		
		#changeInfo #infoTable .infoDetail input{
			height:100%;
			margin-left: 15px;
			background-color: white;
			border: none;
			font-size: 20px;
		}
		
		#changeInfo #infoTable .infoDetail .infoBefore{
			width:150px;
		}
		#changeInfo #infoTable .changePwd{
			display:none;
		}
		#changeInfo #infoTable .changeNickName{
			display:none;
		}
		#changeInfo #infoTable .changeEmail{
			display:none;
		}
		#changeInfo #infoTable .changePh{
			display:none;
		}
		
		
		#changeInfo #infoTable .infoDetail .Btn_change{
			width:40px;
			font-size:15px;
			background-color:  #9bb7d6;
			border :2px solid black;
			border-radius: 0.3em;
			text-align: center;
		}
		#changeInfo #infoTable .infoBefore{
			margin-left:15px;
			background-color: white;
			border: none;
			font-size:15px;
		}
		
		#changeInfo #infoTable .infoNew{
			margin-left:15px;
			background-color: white;
			border: 1px solid #A4A4A4;
			font-size:15px;
			color: #A4A4A4;
		}
		#changeInfo #infoTable .infoConditon{
			margin-left:15px;
			font-size: 8px;
		}
		
		#changeInfo #infoTable #infoConditionTd{
		}
		
		#changeInfo #buttons{
			margin: 30px auto;
			box-sizing:border-box;
			width:50%;
			height:60px;
		}
		
		#changeInfo #buttons #btn_ChangeInfo{
			margin: auto;
			width:40%;
			height:100%;
			font-size: 23px;
			background-color: #9bb7d6;
			border-radius: 0.4em;
		}
	
	</style>
	<script type="text/javascript">
		function fn_changePwd(){
				if($(".Btn_pwd").val()=="변경"){
					$(".tdPwd").prop("rowspan","2")
					$(".changePwd").css("display","block")
					$(".Btn_pwd").val("취소")
				}
				else{
					$(".tdPwd").prop("rowspan","1")
					$(".changePwd").css("display","none")
					$(".Btn_pwd").val("변경")
				}
			}
		function fn_changeNickName(){
			if($(".Btn_NickName").val()=="변경"){
				$(".tdNickName").prop("rowspan","2")
				$(".changeNickName").css("display","block")
				$(".Btn_NickName").val("취소")
			}
			else{
				$(".tdNickName").prop("rowspan","1")
				$(".changeNickName").css("display","none")
				$(".Btn_NickName").val("변경")
			}
		}
		
		function fn_changeEmail(){
			if($(".Btn_Email").val()=="변경"){
				$(".tdEmail").prop("rowspan","2")
				$(".changeEmail").css("display","block")
				$(".Btn_Email").val("취소")
			}
			else{
				$(".tdEmail").prop("rowspan","1")
				$(".changeEmail").css("display","none")
				$(".Btn_Email").val("변경")
			}
		}
		
		function fn_changePh(){
			if($(".Btn_Ph").val()=="변경"){
				$(".tdPh").prop("rowspan","2")
				$(".changePh").css("display","block")
				$(".Btn_Ph").val("취소")
			}
			else{
				$(".tdPh").prop("rowspan","1")
				$(".changePh").css("display","none")
				$(".Btn_Ph").val("변경")
			}
		}
		
		function fn_changeMemberInfo(){
			alert("수정이 완료되었습니다.")
			location.href='${contextPath}/memberInfo/viewMemberInfo.do'
		}
		
	</script>
	
<head>
<title>회원정보수정</title>
</head>
<body>
	<div id="changeInfo">
		<table id="infoTable">
			<tr>
				<td class="infoName">아이디</td>
				<td class="infoDetail"><input type="text" value="EZEN" disabled/></td>
			</tr>
			
			<tr>
				<td class="infoName tdPwd">비밀번호</td>
				<td class="infoDetail pwdInfo">
					<input class="infoBefore" type="password" value="0824asdqwe" disabled/>
					<input class="Btn_change Btn_pwd" type="button" value="변경" onclick="fn_changePwd()" />
				</td>
			</tr>
			
			<tr class="changePwd">
				<td>
					<input id="pwd_chk" name="pwd_chk" class="infoNew" type="text" onfocus="this.value='';"  value="현재 비밀번호"/>
					<p class="infoConditon">현재 비밀번호를 입력해 주세요</p>
					<input id="pwd_new1" name="pwd_new1" class="infoNew" type="text" onfocus="this.value='';"  value="신규 비밀번호"/>
					<p class="infoConditon">8~20자 이내로 영문 대소문자,숫자를 모두 사용하여야 합니다</p>
					<input id="pwd_new2" name="pwd_new2" class="infoNew" type="text" onfocus="this.value='';"  value="신규 비밀번호 확인"/>
					<p class="infoConditon">신규 비밀번호를 다시 한 번 입력해 주세요</p>
				</td>
			</tr>
						
			<tr>
				<td class="infoName">이름</td>
				<td class="infoDetail"><input type="text" value="이젠아카데미" disabled/></td>
			</tr>
	
			<tr>
				<td class="infoName tdNickName">닉네임</td>
				<td class="infoDetail pwdInfo">
					<input class="infoBefore" type="text" value="EZEN강남" disabled/>
					<input class="Btn_change Btn_NickName" type="button" value="변경" onclick="fn_changeNickName()" />
				</td>
			</tr>
			<tr class="changeNickName">
				<td>
					<input class="infoNew" type="text" onfocus="this.value='';"  value="신규닉네임"/>
					<p class="infoConditon">사용하실 닉네임을 입력해 주세요</p>
				</td>
			</tr>
		

			<tr>
				<td class="infoName tdEmail">이메일</td>
				<td class="infoDetail emailInfo">
					<input  class="infoBefore" type="text" value="ezen0824@gamil.com" disabled/>
					<input class="Btn_change Btn_Email" type="button" value="변경" onclick="fn_changeEmail()" />
				</td>
			</tr>
			<tr class="changeEmail">
				<td>
					<input class="infoNew" type="text" onfocus="this.value='';"  value="신규 이메일"/>
					<p class="infoConditon">사용하실 닉네임을 입력해 주세요</p>
				</td>
			</tr>

			<tr>
				<td class="infoName">생년월일</td>
				<td class="infoDetail"><input type="text" value="2022.08.24" disabled/></td>
			</tr>
			<tr>
				<td class="infoName tdPh">전화번호</td>
				<td class="infoDetail phInfo">
					<input class="infoBefore" type="text" value="010-5555-8888" disabled/>
					<input class="Btn_change Btn_Ph" type="button" value="변경" onclick="fn_changePh()" />
				</td>
			</tr>
			<tr class="changePh">
				<td>
					<input class="infoNew" type="text" onfocus="this.value='';"  value="신규 전화번호"/>
					<p class="infoConditon">사용하실 전화번호를 입력해 주세요</p>
				</td>
			</tr>
		</table>
		
		<div id="buttons">
			<input  id="btn_ChangeInfo" type="button" value="수정완료" onclick="fn_changeMemberInfo()" />
				<input  id="btn_ChangeInfo" type="button" value="회원정보" onclick="location.href='${contextPath}/memberInfo/viewMemberInfo.do'" />
		</div>
	</div> 
</body>
</html>