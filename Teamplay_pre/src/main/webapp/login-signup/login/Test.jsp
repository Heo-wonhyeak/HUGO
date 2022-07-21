<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>테스트</title>
</head>
<style>
div {
	border: 1px solid;
}

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

#next_btn{
	 font-size: 14px;
  border: none;
  padding: 10px;
  width: 130px;
  background-color:#9bb7d6;
  margin-bottom: 30px;
  color: white;
  text-align: center;
  float:right;
  border-radius: 5px;
}


</style>
<body>

	<div id="signup-form">
		<h2 style="text-align: center;">2.회원가입</h2>

		<div id="input">

			<div class="info">
				<input type="text" class="text-field" id="id" placeholder="아이디">&nbsp;&nbsp;
				<button id="check_btn">중복확인</button>
			</div>

			<div class="info">
				<input type="password" class="text-field" id="pw" placeholder="비밀번호">
			</div>

			<div class="info">
				<input type="password" class="text-field" id="pw_check"
					placeholder="비밀번호 확인">
			</div>

			<div class="info">
				<input type="text" class="text-field" id="name" placeholder="이름">
			</div>

			<div class="info">
				<input type="text" class="text-field" id="nickname"
					placeholder="닉네임">
			</div>

			<div class="info">
				<input type="date" class="text-field" id="birth" placeholder="생년월일">
			</div>

			<div class="info">
				<select class="text-field" id="gender">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			</div>

			<div class="info">
				<input type="tel" class="text-field" id="phonenum" placeholder="전화번호">
			</div>

			<div class="info">
				<input type="email" class="text-field" id="email"
					placeholder="이메일">
			</div>

		</div>
		
		<div>
			<input type="button" id="next_btn" value="다음단계로" onClick="location.href='interest.jsp'"/>
		</div>

	</div>



</body>
</html>