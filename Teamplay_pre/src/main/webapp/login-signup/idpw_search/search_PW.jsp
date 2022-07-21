<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>비밀번호 찾기</title>
<style>
.text-field {
      font-size: 14px;
      padding: 10px;
      border: none;
      width: 400px;
      margin-bottom: 10px;
      background-color: #EEEFF1;
}
.btn{
font-size: 12px;
  border: none;
  padding: 10px;
  width: 130px;
  background-color:#9bb7d6;
  color: white;
  text-align: center;
  }
.info{
margin-bottom:20px;
}

.search_id_btn{
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 260px;
  background-color:#9bb7d6;
  color: white;
  
  margin:auto;
  display:block;
 
}



</style>
</head>
<body>

	<div id="search_id">
		<h2 style="text-align: center;">PassWord 찾기</h2>
		<div id="input">
			<div class="info">
				<input type="text" class="text-field" id="name" placeholder="이름">
			</div>
			
			<div class="info">
				<input type="text" class="text-field" id="name" placeholder="아이디">
			</div>
			

			<div class="info">
				<input type="tel" class="text-field" id="phone_num"
					placeholder="전화번호(-은 입력하지 않는다.)">
				<button class="btn">인증번호 발송</button>
			</div>

			<div class="info">
				<input type="text" class="text-field" id="certi_num"
					placeholder="인증번호">
				<button class="btn">확인</button>
			</div>
			
			<input type="button" class="search_id_btn" value="PassWord 찾기" >
		</div>
	</div>
</body>
</html>