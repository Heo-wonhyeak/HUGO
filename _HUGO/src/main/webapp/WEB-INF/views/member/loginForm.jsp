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
		.login-form * {
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
		  margin-bottom: 10px;
		  color: white;
		  text-align: center;
		}
		.nologin{
		 text-align: right;
		}
		
		#id_remember{
		 display:inline;
		}
		.nologin .searchbtn2{
			cursor: pointer;
		}
		
	</style>
</head>
<body>
	<div class="login-form">
		<form name="frmLogin" method="post" action="${contextPath }/member/login.do">
		  <div class="login">
				<input type="text" name="id" class="text-field" placeholder="아이디"><br/>
				<input type="password" name="pwd" class="text-field" placeholder="비밀번호"><br/>
				
				<input type="checkbox" id="id_remember" name="id_remember" >아이디 저장<br/><br/>
				
				<input type="submit"  name="login" class="submit-btn" value="로그인"><br/>
				<!-- 수정해야함 -->
				<input type="button" id="login_easy" name="login_easy" class="submit-btn" value="간편로그인"><br/>
		  </div>
		
		<hr style="border: thin 2px #808080;">
	     <!-- 수정해야함 -->
	      <div class="nologin">
	      		<a>아직 회원이 아니세요?</a>
	      		<input type="button" name="signup" class="submit-btn-small" value="회원가입" onClick="location.href='agree.do'"> <br>
	      		<a class="searchbtn2" onClick="window.open('searchIdForm.do')">아이디&nbsp;&nbsp;·</a>
	      		<a class="searchbtn2" onClick="window.open('searchPwForm.do')">&nbsp;&nbsp;비밀번호 찾기</a>
				<!-- <input type="button" name="findID/PW" class="submit-btn-small" value="ID/PW찾기" > -->
           </div>
		</form>
		
	</div>
</body>
</html>