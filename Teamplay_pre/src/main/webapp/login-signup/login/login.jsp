<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>로그인 메인</title>
<style>
* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 5px;
 
}
.login-form {
    width: 400px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    text-align:center;
    padding: 30px 10px 30px 10px;
    border: none;    
}

.text-field {
      font-size: 14px;
      padding: 10px;
      border: none;
      width: 260px;
      margin-bottom: 10px;
}
.submit-btn {
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 260px;
  background-color:#9bb7d6;
  margin-bottom: 30px;
  color: white;
}

#login_easy {
	background-color: #FFC939;
	color: white;
}

.submit-btn-small{
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 130px;
  background-color:#9bb7d6;
  margin-bottom: 30px;
  color: white;
  text-align: center;
  
}

.nologin{
 text-align: right;
}

#id_remember{
 display:inherit;
}





</style>
</head>
<body>
<h2>로그인</h2>

	<div class="login-form">
		<h2>로그인</h2>
		<form>
		  <div class="login">
				<input type="text" name="id" class="text-field" placeholder="아이디"><br/>
				<input type="text" name="pw" class="text-field" placeholder="비밀번호"><br/>
				
				<input type="checkbox" id="id_remeber" name="id_remeber" >아이디 저장<br/><br/>
				
				<input type="submit"  name="login" class="submit-btn" value="로그인"><br/>
				<input type="submit" id="login_easy" name="login_easy" class="submit-btn" value="간편로그인"><br/>
		  </div>
		
		<hr style="border: thin 2px #808080;">
	     
	      <div class="nologin">
	      		<a>아직 회원이 아니세요?</a>
	      		<input type="button" name="signup" class="submit-btn-small" value="회원가입" onClick="location.href='agree.jsp'"> <br>
	      		<a>아이디,비밀번호를 잊으셨나요?</a>
				<input type="button" name="findID/PW" class="submit-btn-small" value="ID/PW찾기" onClick="window.open('http://localhost:8080/HUGO/idpw/search.jsp')" >
           </div>
		</form>
		
	</div>
</body>
</html>