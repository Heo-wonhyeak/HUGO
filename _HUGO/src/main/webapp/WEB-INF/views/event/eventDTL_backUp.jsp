<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="event" value="${eventMap.event }"/>
<c:set var="images" value="${eventMap.images }"/>
<c:set var="reples" value="${eventMap.reples }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<link rel ="stylesheet" href="${contextPath }/resources/css/event.css?after20220820" type="text/css"/>	
	<script type="text/javascript">
		function declaration() {
  			window.open("${contextPath}/event/declaration.do","a","width=400, height=500px, left=100, top=50")
  		}
		
		function fn_like() {
			let like = document.getElementById("like");
			let unlike = document.getElementById("unlike");
			if(unlike.value == "unlike") {
				like.innerHTML = "<i class='fa-solid fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;0<input type='hidden' id='unlike' value='like'/>";
			}
			
			if(unlike.value == "like") {
				like.innerHTML = "<i class='fa-regular fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;0<input type='hidden' id='unlike' value='unlike'/>";
			}
			
		}
		
		$(document).ready(function(){
			
			$("#reReply").click(function(){
				let reReply = $(this).next("div");
				
				if(reReply.css('display','none')) {
					reReply.css('display','block');
				} 
				
				/* if(reReply.css('display','block')) {
					reReply.css('display','none');
				} */
			})
		})
		
		function fn_delEvent(url,event_idx) {
			//변수 선언 후 삭제 확인창 띄우기
			let del;
			del = confirm("삭제하시겠습니까?");
			
			//확인 클릭시!
			if(del == true) {
				//js 이용해 동적으로 form tag를 만드는 역할!
				let form = document.createElement("form");
				// method 방식 Post 할당
				form.setAttribute("method", "post");
				// 액션값으로 넘겨받은 ${contextPath}/board/removeArticles.do 할당
				form.setAttribute("action",url);
				
				//js 이용해 동적으로 input 태그를 만드는 역할!
				let articleNoInput = document.createElement("input");
				articleNoInput.setAttribute("type", "hidden");
				articleNoInput.setAttribute("name", "event_idx");	// articleNO 가 네이밍이 밑에 있는데 괜찮을까?
				articleNoInput.setAttribute("value", event_idx);
				
				//form 태그 아래에 input 태그를 넣음(부모자식)
				form.appendChild(articleNoInput);
				//body 아래에 form 태그를 넣음 (부모자식)
				document.body.appendChild(form);
				
				//서버로 요청 전송!
				form.submit();
			} else {
				//취소 클릭시 alert 창띄우고 다시 게시글 상세보기 화면 출력
				alert("취소되었습니다.");
				location.href="${contextPath}/board/viewArticle.do?articleNO="+articleNO;
			}	
		}
		
	</script>
</head>
<body>
	<table id="boardTitle" width="95%">
		<tr align="center">
			<th class="DTLHeader" width="10%">게시물번호</th>
			<th class="DTLHeader" width="45%" align="left">제목</th>
			<th class="DTLHeader" width="35%">이벤트 기간</th>
			<th class="DTLHeader" width="10%">게시물작성자</th>
		</tr>
		<tr align="center">
			<th class="DTLLine" width="10%">No.${event.event_idx }</th>
			<th class="DTLLine" width="45%" align="left">${event.title }</th>
			<th class="DTLLine" width="35%">${event.event_period }</th>
			<th class="DTLLine" width="10%">${event.id }</th>
		</tr>
	</table>
	<div width="100%" align="center">
		<img alt="고양이사진" src="${contextPath }/resources/img/event/${event.event_idx }/${event.ofile}" width="90%"/>
		<div style="width:90%; text-align:left;">${event.content }</div>
	</div>
	
	<div width="90%" id="replyBox">
		<div class="likeReply" width="90%">
			<span id="like" style="cursor:pointer;" onclick="fn_like()">
				<i class="fa-regular fa-heart" style="color:red;"></i>
				&nbsp;좋아요&nbsp;0 
				<input type="hidden" id="unlike" value="unlike"/>
			</span>
			<span id="reply" >
				<i class="fa-regular fa-comment-dots"></i>
				&nbsp;댓글수&nbsp;1
			</span>
			<span id="list"><a href="${contextPath }/event/runningEventPage.do"><i class="fa-solid fa-list-ul"></i>목록</a></span>
		</div>
		<div width="90%">
			<div class="repleHead"><b>댓글</b></div>
			<div class="repleHead">
				<span>등록순</span>
				<span>&nbsp;|&nbsp;</span>
				<span>최신순</span>
			</div>
		</div>
		
		<div>
			<div>
				<span>
					[heo june]
				</span>
				<span id="date">
					2022/06/20 21:53:23
				</span>
				<span id="declaration" class="declaration" onclick="declaration()">
					|&nbsp;신고
				</span>
			</div>
			<div class="replyContainer">
				<div id="replyContent">
					아아아아아아
					<br/>
					아아아아아
					<br/>
					아아아아
				</div>
				<div id="reReply">
					<i class="fa-solid fa-check"></i>댓글의 댓글 달기
				</div>
				<div id="reReplyContainer"class="enterReplyContainer" width="90%">
					<div>
						<b>heo june</b>
					</div>
					<div class="enterReply">
						<textarea style="width:100%; height:90%; border-radius : 0.5em;"></textarea>
					</div>
					<div class="replyEnterBtn">
						<input type="button" value="등록" id="replyBtn"/>
					</div>
				</div>
				
			</div>
			
		</div>
		
		<form action="${contextPath }/event/eventReply.do?event_idx=${event_idx}" method="post">
			<div class="enterReplyContainer" >
				<div>
					<c:if test="${member.id eq null || member.id == '' }">
						<b>로그인 하셔야 댓글을 사용하실 수 있습니다.</b>
					</c:if>
					<b>${member.nickname }</b>
					<input type="hidden" name="nickname" value="${member.nickname }"/>
				</div>
				<div class="enterReply">
					<textarea name="content" style="width:100%; height:90%; border-radius : 0.5em;"></textarea>
				</div>
				<div class="replyEnterBtn">
					<input type="button" value="등록" id="replyBtn"/>
				</div>
			</div>
		</form>
	</div>
	
	<c:if test="${member.id == event.id }">
		<div class="modAndDel">
			<input type="button" value="수정" class="modBtn" onclick="location.href='${contextPath}/event/modEventWriter.do?event_idx=${event.event_idx }'"/>
			<input type="button" value="삭제" class="delBtn" onclick="fn_delEvent('${contextPath}/event/removeEvent.do',${event.event_idx })"/>
		</div>
	</c:if>

</body>
</html>