<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문 (Q&A)</title>
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


/* 지주 묻는 질문 css */
* {
	margin: 0;
	padding: 0;
}

.accordion {
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translateX(-50%);
	width: 1400px;
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	padding: 30px;
	border-bottom: 0;
	color: black;
	font-weight: 900;
	/* background: #ADD8E6; */
	cursor: pointer;
	position: relative;
	border-top: 2px solid #E0E0E0;
	/* background-color: black; */
}

input[id*="answer"]:checked +label {
	background-color: #9bb7d6;
}

input[id*="answer"]+label em {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 30px;
	height: 30px;
	margin-top: -15px;
	display: inline-block;
	background: url('https://ifh.cc/g/hCtr7Q.png') 0 0 no-repeat;
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #F3FBFD;
	font-size: 11px;
	
}

input[id*="answer"]+label+div p {
	display: inline-block;
	padding: 20px;
}

input[id*="answer"]:checked+label+div {
	max-height: 500px;
}

input[id*="answer"]:checked+label em {
	background-position: 0 -30px;
}

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
		<a href="../board/write.jsp" class="hreftag">1:1문의</a> <a
			href="../board/list.jsp" class="hreftag">문의내역</a> <a 
			href="../question/question.jsp" class="hreftag" id = underline>자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	
	<div class="accordion">
		<br><br><br>
		<input type="checkbox" name="accordion" id="answer01"> <label
			for="answer01">Q. [고객센터] 고객센터 운영시간은 어떻게 되나요?<em></em></label>
			
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 24시간 365일 연중무휴로 운영하고 있지만 전화 상담은 평일 9:00~18:00에만 가능합니다.
    		     더 자세한 내용은 고객센터 홈페이지를 이용해주시길 바랍니다</p>
		</div>
		<input type="checkbox" name="accordion" id="answer02"> <label
			for="answer02">Q. [회원정보] 회원정보 수정은 어떻게 하나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 여기에 추가되는 부분이 자주묻는 질문의 답변내용이 이 영역에 들어갑니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer03"> <label
			for="answer03">Q. [회원정보] 개인정보는 안전하게 보호받고 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 저희 HUGO는 인터넷을 통해 전달되는 고객님의 정보 보안 및 안전한 거래를 위해 보안시스템 SSL(Secure Socket Layer) 암호화를 도입했습니다. <br/><br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;※ SSL(Secure Socket Layer)란? <br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;브라우저와 서버 간의 통신에서 정보를 암호화함으로써 인터넷 도중에 해킹을 통해 정보가 유출되더라도 해당 정보의 내용을 보호할 수 있게 해주는 <br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;보안 시스템입니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer04"> <label
			for="answer04">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer05"> <label
			for="answer05">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer06"> <label
			for="answer06">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer07"> <label
			for="answer07">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer08"> <label
			for="answer08">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer09"> <label
			for="answer09">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer10"> <label
			for="answer10">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer11"> <label
			for="answer11">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer12"> <label
			for="answer12">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer13"> <label
			for="answer13">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer14"> <label
			for="answer14">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer15"> <label
			for="answer15">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer16"> <label
			for="answer16">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer17"> <label
			for="answer17">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer18"> <label
			for="answer18">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer19"> <label
			for="answer19">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer20"> <label
			for="answer20">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>
		<input type="checkbox" name="accordion" id="answer21"> <label
			for="answer21">컨텐츠 제목 부분<em></em></label>
		<div>
			<p>1</p>
		</div>

	</div>
</body>
</html>