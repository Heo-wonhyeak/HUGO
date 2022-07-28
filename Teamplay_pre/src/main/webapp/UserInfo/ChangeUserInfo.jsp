<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정</title>
	<link rel ="stylesheet" href="InfoStyle.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		
	</script>
	
<head>
<title>회원정보수정</title>
</head>
<body>
	<%@ include file="../main/Header.jsp" %>
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
			<input  id="btn_ChangeInfo" type="button" value="수정완료" onclick="location.href=''" />
				<input  id="btn_ChangeInfo" type="button" value="회원정보" onclick="location.href=''" />
		</div>
	</div> 

	
	<%@ include file="../main/Footer.jsp" %>

</body>
</html>