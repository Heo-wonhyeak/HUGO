<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 메인 페이지</title>
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

/* 고객센터 메인 페이지 css */
img {
	/* margin-right: 7px; */
	margin-top: -20px;
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
	text-shadow: 1px 1px 1.2px #fff55e;
}

.hreftag {
	
}

#enter {
	margin-right: 500px;
} 

#enter2 {
	margin-right: 420px;
} 

p {
	font-size: 17px; 
	font-weight: bold;
}

/* 고객센터 메인 페이지 css 종료 */

/* Footer CSS */
.footer {
    position:relative;
    left: 0;
    bottom: 0px;
    width: 100%;
	padding: 30px 0 ;
	
	text-align: left;
	size: 15px;
	color: white;
	background: #9bb7d6;
}
.select *{
	font-weight:bold;
	vertical-align: middle;
	text-decoration: none;
}
.select, .info {
	padding-left: 30px;
}
/* Footer CSS 종료 */

</style>

<script type="text/javascript">
function showMenu(){
	if($(".myMenu").css("display")=="none"){
		$(".myMenu").css("display","block")
	}else{
		$(".myMenu").css("display","none")
	}
}
</script>

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
	
	<div style="text-align : center;" id = maincenter>
	
	<table width = "40%" style="margin-left: auto; margin-right: auto; 
		   border-collapse : collapse; border-color: #9bb7d6;" >
		<tr>
			<td><img alt="" src="https://ifh.cc/g/akc1AO.png"
	 			 height="200" width="200">
	 		
	 	<p>02 - 1234 - 5678</p>
	 	<p>상담 가능 시간: 9:00~18:00</p>
	 	<p>점심 시간: 13:00~14:00</p>
	 	<p>공휴일 상담 불가</p>
	 	</td>
	 	</tr>
	 	
	</table>
	</div>
	
		<br>
		<br>
	<div class="ahref">
		<hr width = "80%" color = #C0C0C0 style="border: solid 2px #9bb7d6; ">
		<a href="../board/write.jsp" class="hreftag" id = enter>1:1문의</a> 
		<a href="../board/list.jsp" class="hreftag">문의내역</a><br/>
		<hr width = "80%" style="border-style: dotted ;">
		<a href="../question/question.jsp" class="hreftag" id = enter2>자주 묻는 질문</a> 
		<a href="../notice/notice.jsp" class="hreftag" id = margin>공지사항</a><br>
		<hr width = "80%" color = #C0C0C0 style="border: solid 2px #9bb7d6; ">
		<br>
		<br>
	</div>
	
	
	
	<div class="footer">
   	 
   	 <div class="select" >
   	 	<img src="https://ifh.cc/g/HgyWyY.jpg" width="70" height="70">&nbsp;&nbsp;
		<a href=''>회사소개</a> |
		<a href=''>개인정보처리방침</a> |
		<a href=''>서비스약관</a>
	 </div>
	 <div class="info">
	 	<p>**회사<br/>
	 	서울특별시 서초구 서초대로77길 54 (서초더블유타워 13,14층)<br/>
	 	대표자:***<br/>
	 	사업자등록번호:1234567890<br/>
	 	T. 02 - 1234 - 5678</p>
	 
	 </div>
   </div>
</body>
</html>