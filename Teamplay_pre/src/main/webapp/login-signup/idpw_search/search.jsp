<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>idpw찾기</title>
<style>

#search_btn{
 		display: flex;
        justify-content: center;
        align-items: center;
       
}
h3{
text-align: center;
}
.btn{
width:300px;
height: 400px;
background-color: #9bb7d6;
color:white;
text-align: center;
margin-left: 40px;
font-size: 20px;
border:none;
border-radius: 5px;
}

</style>
</head>
<body>
	<h2>아이디 비밀번호 찾기</h2>
	
	
	<div id="search-form">
	<h2 style="text-align: center;">ID/PW 찾기</h2>
		<div id="search_btn">
			<div id="search_id_btn">
			<h3>ID찾기</h3>
			<button class="btn" 
			onclick="window.open('http://localhost:8080/HUGO/idpw/search_ID.jsp', '_blank', 'width=450 height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );">
			휴대펀 번호로 <br> 아이디 찾기</button>
			</div>
			
			<div id="search_pw_btn">
			<h3>PassWord찾기</h3>
			<button class="btn" 
			onclick="window.open('http://localhost:8080/HUGO/idpw/search_PW.jsp', '_blank', 'width=450 height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );">
			휴대펀 번호로 <br> 비밀번호 찾기</button>
			</div>
		</div>
	
	</div>
	
	
</body>
</html>