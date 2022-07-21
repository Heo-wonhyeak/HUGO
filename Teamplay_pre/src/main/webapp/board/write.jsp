<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedIn.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판 내용 작성</title>
	<script type="text/javascript">
	
	function validateForm(form) {		
		if (form.title.value == "") {
			alert("제목을 입력하세요.")
			form.title.focus();
			return false;
		}
	
		if (form.content.value == "") {
			alert("내용을 입력하세요.")
			form.content.focus();
			return false;
		}
	}
	
	</script>
		<style type="text/css">
/* 헤더 CSS */
.HeaderContainer {
	width: 90%;
	margin : 0 auto;
	height : 150px;	
}
.HeaderLogo {
	display: inline-block;
	width : 15%;
	height : 80%;
	position : relative;
	left : 2%;
	top : 5%;
}
/* 마이메뉴css */
.myMenu{
	display: none;
	width: 100px;
	height: 150px;
	position: absolute;
	left: 300px;
	border : 1px solid #9bb7d6;
	margin: 0px;
}
.myMenu ul{
	list-style: none;
}
.search {
	display : inline-block;
	width : 70%;
	height : 20%;
	position : relative;
	bottom : 25%;
	left : 3%;
}

.searchbox {
	width : 90%;
	height : 100%;
	border-radius : 0.2em;
}

.searchBtn{
	width : 38px ;
	height : 100%;
	background-color: #9bb7d6; 
	border-radius : 0.5em;
}
.headerMenu{
	display : inline-block;
	position : relative;
	bottom: 75%;
	float : right;
	color : #9bb7d6;
}
.serchDTL{
	display : inline-block;
	position : relative;
	float : left;
	left : 18.5%;
	bottom: 23%;	
}
.searchDTLBTN{
	height : 30px;
	background-color: #9bb7d6; 
	border-radius : 0.5em;
}
/* 헤더 CSS 종료 */

/* 고객센터 헤더 css */
a {
	text-decoration: none;
}

a:link {
	color: black;
}

a:visited {
	color: #0074a5;
}

.ahref {
	text-align: center;
	font-size: x-large;
	/* margin-top: 80px; */
	/* margin-right: 30px; */
	margin-top: 45px;
	font-weight: 900;
	font-size: 23px; 
	font-weight: bold;
	text-shadow: 1px 1px 10px #fff55e;
}

.hreftag {
	margin-right: 170px;
}

#underline {
	text-decoration: underline;
}

p {
	font-size: medium;
}

/* 1:1 문의 css */
* {
	margin: 0;
	padding: 0;
}

#fini {
	float: right;
	background-color: #9bb7d6; 
	width : 100px;
	height : 50px;
	border-radius : 0.5em;
	font-weight: 900;
}

.buttonmo {
	margin-right: 172px;
}

.buttonmo2 {
	margin-right: 10px;
}


#text {
	  width: 500px;
	  height: 32px;
	  font-size: 15px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  padding-left: 10px;
	  background-color: rgb(233, 233, 233);
}

#name {
	font-size: x-large;
	font-size: 23px; 
	font-weight: bold; 
	color: #203762; 
	text-shadow: 1px 1px 1.2px midnightblue;
}


body {margin: 10px;}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media(min-width: 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px; 
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
	border-color: #2e6da4;
}

#fileup {
	margin-top: 30px;
	margin-left: 470px;
}

	</style>

</head>
<body>
	<div class="HeaderContainer">
		<div class="HeaderLogo">
			<img src="https://ifh.cc/g/pqSQJr.jpg" style="width:100%; height:100%;">
		</div>
		<div class="search">
			<input type="text" class="searchbox"/>
			<button class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<div class="headerMenu">
			<a>이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href = "../custormercenter/CustomerCenterMain.jsp">고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a onclick="return showMenu()"><i class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
			<div class="myMenu">
				<ul>	
					<li>ezen님</li>
					<li>&nbsp;</li>
					<li><a>회원정보</a></li>
					<li><a>쿠폰함</a></li>
					<li><a>찜리스트</a></li>
			</ul>
			</div>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>
	
	
	<div class="ahref">
		<a href="write.jsp" class="hreftag" id = underline>1:1문의</a> <a
			href="list.jsp" class="hreftag">문의내역</a> <a 
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	<form action="writeProcess.jsp" name = "writeFrm" method="get"
		  onsubmit="return validateForm(this)">
		  <table  width = "89%" style="margin-left: auto; margin-right: auto; 
		  		 border-collapse : collapse; border-color: #9bb7d6;">
		  	<tr>
		  		<td align = "center" style="border-collapse : collapse;" id = "name">제목</td>
		  		<td>
		  			<input type="text" name = "title" style="width: 70%" id = "text"/>
		  		</td>
		  	</tr>
		  			  
		  </table>
		  
		  <br/><br/>
		  
		  <table width = "90%" style="margin-left: auto; margin-right: auto; 
		  		 border-collapse : collapse; border-color: #9bb7d6;">
		  	<tr>
		  		<td align = "center" id = "name">내용</td>
		  		<td>
		  			<textarea name = "content" style="width: 90%; height: 250px;" id = "text"></textarea>
		  			<!-- <input type="text" name = "content" style="width: 90%; height: 250px;"  id = "text"/> -->
		  		</td>
		  	</tr>
		  </table>
		   	
		   	
		  <div class="filebox bs3-primary preview-image" id = "fileup">
				<input class="upload-name" value="파일선택" disabled="disabled" style="width: 600px;">
				<label for="input_file">업로드</label> 
				<input type="file" id="input_file" class="upload-hidden"> 
		  </div>
		  			
		  			
		  			<br/>
		  			<button type="submit" id = fini class = "buttonmo">작성 완료</button>
		  			<button type="button" onclick="location.href = 'list.jsp';" id = fini class = "buttonmo2">목록 보기</button>
		  		
		  
		  
	
	</form>
</body>
</html>