<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO(application);

	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");		
	String searchWord = request.getParameter("searchWord");
	
	if (searchWord != null) {		
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);		
	List<BoardDTO> boardLists = dao.selectList(param);	
	
	dao.close();			
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 목록보기</title>
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
* {
	margin: 0;
	padding: 0;
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

/* 목록 css */
#fini {
	float: right;
	background-color: #9bb7d6; 
	width : 100px;
	height : 50px;
	border-radius : 0.5em;
	font-weight: 900;
	margin-right: 78px;
	margin-top: 20px;
}

table {
    border-top: 2px solid;
    border-bottom: 2px solid;
    border-collapse: collapse;
    border-bottom-color: #9bb7d6;
    border-top-color: #9bb7d6;
  }
  
  th, td {
    padding: 10px;
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
		<a href="write.jsp" class="hreftag">1:1문의</a> <a
			href="list.jsp" class="hreftag" id = underline>문의내역</a> <a 
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	
	<%-- <jsp:include page="../common/link.jsp" />
	<br/><br/>
	 --%>
	<form action ="#" method="get">
		<!-- table border = "1" width = "90%" style="margin-left: auto; margin-right: auto;"> 
		
			<tr>
				<td align = "center">
					<select name = "searchField">
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type="text" name = "searchWord"/>
					<input type="submit" value="검색하기"/>
				</td>
			</tr>			
		</table> -->
		
		<table  width = "90%" style="margin-left: auto; margin-right: auto;
				border-collapse : collapse;">
			<!-- 컬럼 이름 -->
			<tr>
				<th width = "10%">번호</th>
				<th width = "40%" >제목</th>
				<th width = "15%" >작성자</th>
				<th width = "15%" >작성일</th>
				<th width = "10%" >답변여부</th>
			</tr>
			
			<%
				if (boardLists.isEmpty()) {
			%>
			
				<tr>
					<td colspan="5" align = "center">등록된 게시물이 없습니다.</td>
				</tr>
				
			<%
				}
				else {		
					int virtalNum = 0;					
					for(BoardDTO dto : boardLists) {
						virtalNum = totalCount--;		
			%>
			
				
				<tr align="center">
					<td><%=virtalNum %></td>	
					<td align="left">			
						<a href="view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
					</td>
					<td align="center"><%=dto.getId() %></td> 
					<td align="center"><%=dto.getPostdate() %></td> 
				</tr>
			
			<%
					}
				}
			%>
		</table>
		
			<button type = "button" onclick="location.href = 'write.jsp';" id = fini>글쓰기</button>
	</form>
</body>
</html>