<%@page import="java.util.List"%>
<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	dao.updateVisitCount(num);				
	BoardDTO dto = dao.selectView(num);		
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시물 상세 보기</title>
	<script type="text/javascript">
		function deletePost() {
			let confirmed = confirm("정말로 삭제하시겠습니까?")
			
			if(confirmed) {
				let form = document.writeFrm
				form.method = "post"				
				form.action = "deleteProcess.jsp"	
				form.submit()						
				
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

/* 상세보기 css */
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


#any {
	margin-left: 500px;	
}

#who {
	font-size: 20px;
	font-weight: bolder;
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
	margin-right: 88px;
}

.buttonmo2 {
	margin-right: 10px;
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
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>

	<%-- <jsp:include page="../common/link.jsp"></jsp:include> --%>
	<form action="#" name = "writeFrm"> 
		<input type="hidden" name = "num" value="<%= num%>"/>
		
		<table width = "30%" style=" border-collapse : collapse; margin-left: 600px;" id = "any">
			<tr>
				<td id = "name">작성자</td>
				<td id = "who"><%=dto.getId() %> </td>
			</tr>
			
			<tr>
				<td id = "name"> 작성일</td>
				<td id = "who"><%=dto.getPostdate() %></td>
			</tr>
			
			
			 </table>
		  
		  		<br/><br/>
			
			<table  width = "89.3%" style="margin-left: auto; margin-right: auto;
		  		 border-collapse : collapse; border-color: #9bb7d6;">
				<tr>
					<td align = "center" style="border-collapse : collapse;" id = "name">제목</td>
					<td id = "text" style="width: 90%"><%=dto.getTitle() %></td>
				</tr>
			</table>
			<br/>
			
			<table width = "90%" style="margin-left: auto; margin-right: auto;
		  		 border-collapse : collapse; border-color: #9bb7d6;">
			<tr>
				<td align = "center" style="border-collapse : collapse;" id = "name">내용</td>
				<td id = "text" style="width: 90%; height: 250px;" ><%=dto.getContent().replace("\r\n", "<br/>") %></td>
			</tr>
			</table>
			<br/>
			
			<table  style="margin-left: 42px; width: 45%" >
			<tr>
			<td align = "center" style="border-collapse : collapse;" id = "name">첨부파일</td>
				<td id = "text" ><%=dto.getUpfile() %></td>
			</tr>
			</table>
			<br/>
			
			
			<tr>
				<td colspan="4" align="center">
					<%
						if (session.getAttribute("UserId") != null &&
						    session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
						<button type="button" onclick="location.href='edit.jsp?num=<%= dto.getNum()%>';" id = fini class = "buttonmo">수정하기</button>
						<button type="button" onclick="deletePost()" id = fini class = "buttonmo2">삭제하기</button>
					<%		
						}
					%>
					
						<button type="button" onclick="location.href='list.jsp'" id = fini class = "buttonmo2">목록보기</button>
				</td>
			</tr>	
		
		
	</form>
</body>
</html>