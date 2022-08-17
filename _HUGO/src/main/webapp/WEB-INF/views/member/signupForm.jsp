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
	<style type="text/css">
		.text-field {
			font-size: 14px;
			padding: 10px;
			border: none;
			width: 400px;
			margin-bottom: 10px;
			background-color: #EEEFF1;
		}
		#input {
			text-align: center;
		}
		
		#check_btn{
			font-size: 14px;
			border: none;
			padding: 10px;
			background-color: #9bb7d6;
			color: white;
			text-align: center;
			width: 130px;
			height:36px;
			margin-bottom: 10px;
			position: absolute
		}
		
		.info {
			margin-bottom: 20px;
		}
		
		#next_btn,#reset_btn{
		  font-size: 14px;
		  border: none;
		  padding: 10px;
		  width: 130px;
		  background-color:#9bb7d6;
		  margin-bottom: 30px;
		  color: white;
		  text-align: center;
		  border-radius: 5px;
		}
		.text{
		position:absolute;
		left:25%;
		
		}
	</style>
	<script type="text/javascript">
		function fn_duplicatecheck() {
			let _id = $('#_id').val();
			if(_id == '') {
				alert('id를 입력하세요');
				return;
			}
			
			/* ajax 진입 안됨.. 해결 요망 */
			$.ajax({
				type: "post"
				,url: "${contextPath }/member/duplicateCheck.do"
				,data: { id : _id}
				,success: function (data,textStatus) {
					alert("성공진입"); 
					if(data == 'false') {
						alert('사용가능한 아이디 입니다');
						$('#check_btn').prop('disabled',true);
						$('#_id').prop('disabled',true);
						$('#id').val(_id);
					} else {
						alert('사용할수 없는 아이디 입니다');
						$('#_id').onfocus();
					}
				}
				,error: function(data,textStatus) {
					alert('에러가 발생했습니다');
				}
			})
		}
		$(document).ready(function() {
			$('#signupForm').submit(function() {
				if($('#pwd').val() == "") {
					alert("비밀번호 입력해주세요");
					$('#pwd').focus();
					return false;
				}
				if($('#pw_check').val() == "") {
					alert("비밀번호 확인을 입력해주세요");
					$('#pw_check').focus();
					return false;
				}
				if($('#pwd').val() != $('#pw_check').val()) {
					alert("비밀번호가 다릅니다.");
					$('#pwd').focus();
					return false;
				}
				if($('#name').val() == "") {
					alert("이름을 입력해주세요");
					$('#name').focus();
					return false;
				}
				if($('#nickname').val() == "") {
					alert("별명 입력해주세요");
					$('#nickname').focus();
					return false;
				}
				if($('#callnum').val() == "") {
					alert("번호를 입력해주세요");
					$('#callnum').focus();
					return false;
				}
				if($('#email').val() == "") {
					alert("메일을 입력해주세요");
					$('#email').focus();
					return false;
				}
			})
		})
	</script>
</head>
<body>
		<h2 style="text-align: center;">2.회원가입</h2>
		<h3 style="color: #808080; text-align: center;" >회원정보를 입력해주세요</h3>	
		<hr style="border: thin 2px #808080;">
		<br />

	<form id="signupForm" action="${contextPath }/member/addMember.do" method="post" enctype="multipart/form-data">		
		<div id="input">
			<div class="info">
				<input type="text" class="text-field" name="_id" id="_id" placeholder="아이디">&nbsp;&nbsp;
				<input type="text" class="text-field" name="id" id="id" hidden>
				<input type="button" id="check_btn" onclick="fn_duplicatecheck()" value="중복확인" />
			</div>

			<div class="info">
				<input type="password" class="text-field" name="pwd" id="pwd" placeholder="비밀번호">
			</div>

			<div class="info">
				<input type="password" class="text-field" id="pw_check"
					placeholder="비밀번호 확인">
			</div>

			<div class="info">
				<input type="text" class="text-field" name="name" id="name" placeholder="이름">
			</div>

			<div class="info">
				<input type="text" class="text-field" name="nickname" id="nickname"
					placeholder="닉네임">
			</div>

			<div class="info">
				<input type="date" class="text-field" name="birthday" id="birthday" placeholder="생년월일">
			</div>

			<div class="info">
				<select class="text-field" id="gender" name="gender">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			</div>

			<div class="info">
				<input type="tel" class="text-field" name="callnum" id="callnum" placeholder="전화번호">
			</div>

			<div class="info">
				<input type="email" class="text-field" name="email" id="email"
					placeholder="이메일">
			</div>

		</div>
		<br/>
		<div align="center">
			<input type="submit" id="next_btn" value="가입완료" />
			<input type="reset" id="reset_btn" value="다시입력" />
		</div>
		<br/>
	</form>
</body>
</html>