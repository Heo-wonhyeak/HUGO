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
		 
		$(document).ready(function () {
			// 좋아요 갯수
			let like_count = document.getElementById('like_count').value;
			// 좋아요 여부
			let like_yn = document.getElementById('like_yn').value;
			// 로그인된 id
			const id = '${member.id }';
			// 게시글 번호
			const event_idx = '${event.event_idx}';
			// 좋아요 span 내부
			let like = document.getElementById('like');
			
			// 좋아요 체크되어있다면 채워진 하트
			if(like_yn == 0) {
				like.innerHTML = "<i class='fa-regular fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;${event.like_count}";
			} else {
				like.innerHTML = "<i class='fa-solid fa-heart' style='color:red;'></i> &nbsp;좋아요&nbsp;${event.like_count}";
			}
			
			$('#like').on("click",function() {
				$.ajax({
					url : "${contextPath}/event/like.do"
					,type : 'post'
					,data : {
						'event_idx' : event_idx
						, 'id' : id
						, 'like_yn' : like_yn
					}
					,success : function(data) {
						// 페이지 새로고침(좋아요 적용)
						document.location.href = document.location.href;
					} , error : function() {
						alert("에러가 발생했습니다.");
					}
				});
			});
			
		});
		
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
	<style type="text/css">
		a{
			color : #9bb7d6;
		}
	</style>
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
		<img alt="사진" src="${contextPath }/resources/img/event/${event.event_idx }/${event.ofile}" width="90%"/>
		<div style="width:90%; text-align:left;">${event.content }</div>
	</div>
	
	<div width="90%" id="replyBox">
		<div class="likeReply" width="90%">
			<c:if test="${member.id eq null || member.id == '' }">
				<span id="like" style="cursor:pointer;">
					<i class="fa-regular fa-heart" style="color:red;"></i>
					&nbsp;좋아요&nbsp;${event.like_count }
				</span>
				<input type="hidden" id="like_count" value="${event.like_count }"/>
			</c:if>
			<%-- 여기부터 추가해줘야함 --%>
			<c:if test="${member.id ne null and member.id != '' }">
				<span id="like" style="cursor:pointer;">
					<i class="fa-regular fa-heart" style="color:red;"></i>
					&nbsp;좋아요&nbsp;${event.like_count }
				</span>
				<input type="hidden" id="like_yn" value="${eventMap.like_yn }"/>
				<input type="hidden" id="like_count" value="${event.like_count }"/>
			</c:if>
			<span id="reply" >
				<i class="fa-regular fa-comment-dots"></i>
				&nbsp;댓글수&nbsp;${eventMap.replyCount }
			</span>
			<span id="list"><a href="${contextPath }/event/runningEventPage.do"><i class="fa-solid fa-list-ul"></i>목록</a></span>
		</div>
		<div width="90%">
			<div class="repleHead"><b>댓글</b></div>
			<div class="repleHead">
				<c:if test="${param.action eq 'registration' }">
					<span id="registration">
						<b><a href="${contextPath }/event/eventDTL.do?event_idx=${event.event_idx}&action=registration">등록순</a></b>
					</span>
					<span>&nbsp;| &nbsp;</span>
					<span id="lastest">
						<a href="${contextPath }/event/eventDTL.do?event_idx=${event.event_idx}&action=lastest">최신순</a>
					</span>
				</c:if>
				
				<c:if test="${param.action eq 'lastest' }">
					<span id="registration">
						<a href="${contextPath }/event/eventDTL.do?event_idx=${event.event_idx}&action=registration">등록순</a>
					</span>
					<span>&nbsp;| &nbsp;</span>
					<span id="lastest">
						<b><a href="${contextPath }/event/eventDTL.do?event_idx=${event.event_idx}&action=lastest">최신순</a></b>
					</span>
				</c:if>
			</div>
		</div>
		
		<c:forEach var="reply" items="${reples }">
			<div>
				<div>
					<span>
						<b>${reply.nickname }</b>
					</span>
					<span id="date">
						${reply.writedate }
					</span>
					<span id="declaration" class="declaration" onclick="declaration()">
						|&nbsp;신고
					</span>
				</div>
				<div class="replyContainer">
					<div id="replyContent">
						${reply.content }
					</div>
					<div id="reReply">
						<i class="fa-solid fa-check"></i>
					</div>
					
				</div>
			</div>
		</c:forEach>
		
		
		<form action="${contextPath }/event/eventReply.do?event_idx=${event.event_idx}" method="post" enctype="multipart/form-data">
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
					<c:if test="${member.id ne null and member.id != '' }">
						<input type="submit" value="등록" id="replyBtn">
					</c:if>
				</div>
			</div>
		</form>

	<c:if test="${member.id == event.id }">
		<div class="modAndDel">
			<input type="button" value="수정" class="modBtn" onclick="location.href='${contextPath}/event/modEventWriter.do?event_idx=${event.event_idx }'"/>
			<input type="button" value="삭제" class="delBtn" onclick="fn_delEvent('${contextPath}/event/removeEvent.do',${event.event_idx })"/>
		</div>
	</c:if>

</body>
</html>