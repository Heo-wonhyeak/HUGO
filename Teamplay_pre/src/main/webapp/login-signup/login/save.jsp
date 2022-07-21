<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>회원가입완료</title>
<style>
* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
}

.box{
text-align: center;
}

.save-form {
    width: 400px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    text-align:center;
    padding: 30px 10px 30px 10px;
    border: none;    
}

.btn{
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 130px;
  background-color:#9bb7d6;
  margin-bottom: 30px;
  color: white;
  text-align: center;
  
}

</style>
</head>
<body>
	<h2>회원가입 완료</h2>
	
	<div class="save-form">
	<form>
		<div class=box>
			<img src="./image/confetti.png" width="70" ,height="70";>
			<h3>회원가입완료!</h3>
			<div>회원가입이 완료되었습니다.</div><br>
			<input type="button" class="btn" value="로그인페이지로"  onClick="location.href='login.jsp'">
		</div>
		
	</form>
	</div>
</body>
</html>