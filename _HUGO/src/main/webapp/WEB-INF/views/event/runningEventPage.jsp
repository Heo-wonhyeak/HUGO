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
	<title>진행중 이벤트 페이지</title>
	<link rel ="stylesheet" href="${contextPath }/resources/css/event.css?after" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		let end = 9;
		$(function(){
			
			$("#more").click(function(e){ // Load More를 위한 클릭 이벤트e
				e.preventDefault();
				$(".eventArticle:hidden").slice(0, end).show(); // 숨김 설정된 다음 9개를 선택하여 표시
					end += 9;
				if($(".eventArticle:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
					alert("마지막 페이지 입니다."); // 더 이상 로드할 항목이 없는 경우 경고
				}
			});
		});
	</script>
</head>
<body>
	<table align="center" width="95%" >
		<c:choose>
			<c:when test="${param.boarder eq 'runningEvent' }">
				<tr align="center">
					<td width="30%" id="selectTd" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=runningEvent'">
						진행중 이벤트
					</td>
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=endEvent'">
						종료된 이벤트
					</td>
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=coupone'">
						쿠폰
					</td>
				</tr>
			</c:when>
			<c:when test="${param.boarder eq 'endEvent' }">
				<tr align="center">
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=runningEvent'">
						진행중 이벤트
					</td>
					<td width="30%" id="selectTd" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=endEvent'">
						종료된 이벤트
					</td>
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=coupone'">
						쿠폰
					</td>
				</tr>
			</c:when>
			<c:when test="${param.boarder eq 'coupone' }">
				<tr align="center">
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=runningEvent'">
						진행중 이벤트
					</td>
					<td width="30%" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=endEvent'">
						종료된 이벤트
					</td>
					<td width="30%" id="selectTd" class="eventTd" onclick="location.href='${contextPath}/event/runningEventPage.do?boarder=coupone'">
						쿠폰
					</td>
				</tr>
			</c:when>
		</c:choose>

		<tr>
			<td colspan="3"><div style="margin : 3px 0;"></div></td>
		</tr>
			
		<c:choose>
			<c:when test="${eventList == null}">
				<tr align="center">
					<td colspan="3">
						<b><span style="font-size: 50px;">등록된 이벤트가 없습니다.</span></b>
					</td>
				</tr>
			</c:when>
			<c:when test="${eventList != null }">
				<tr  align="center" style="width:90%;">
					<c:forEach var="event" items="${eventList }" varStatus="eventNum">
							<c:if test="${eventNum.index%3 == 0 }">
								</tr><tr align="center" style="width:90%;">
							</c:if>
							<c:if test="${eventNum.index < 9 }" >
								<td class="eventArticle">
									<img src="${contextPath }/resources/img/event/${event.event_idx }/${event.ofile}" alt=" 사진" class="picture"/>
									<div class="enterTitle" onclick="location.href='${contextPath}/event/eventDTL.do?event_idx=${event.event_idx }&action=registration'">
										<span class="eventTitle">
											<c:if test="${event.writeHeader ne null }">
												<c:choose>
													<c:when test="${event.writeHeader eq 'attendance'}">
														[출첵 Event]
													</c:when>
													<c:when test="${event.writeHeader eq 'monthly'}">
														[이달의 Event]
													</c:when>
													<c:when test="${event.writeHeader eq 'birth'}">
														[생일 Event]
													</c:when>
													<c:when test="${event.writeHeader eq 'new'}">
														[신규 Event]
													</c:when>
												</c:choose>
											</c:if>
											${event.title }
										</span> 
										<span class="eventCount"> 
											[${event.visit_count }]
										</span><br/>
										<span class="eventPeriod"> ${event.event_period }</span>
									</div>
								</td>
							</c:if>
							<c:if test="${eventNum.index >= 9 }" >
								<td class="eventArticle" style="display:none;">
									<img src="${contextPath }/resources/img/event/${event.event_idx }/${event.ofile}" alt="사진" class="picture"/>
									<div class="enterTitle" onclick="location.href='${contextPath}/event/eventDTL.do?event_idx=${event.event_idx }&action=registration'">
										<span class="eventTitle">${event.title }</span> <span class="eventCount"> [${event.visit_count }]</span><br/>
										<span class="eventPeriod"> ${event.event_period }</span>
									</div>
								</td>
							</c:if>
					</c:forEach>
				</tr>
			</c:when>
		</c:choose>
		
		<tr>
			<td colspan="2"><div id="more">+ 더보기</div></td>
			<c:if test="${isLogOn}">
				<c:if test="${member.id eq 'admin' }">
					<td><button onclick="location.href='${contextPath}/event/eventWriter.do'" id="eventWriteBtn">글쓰기</button></td>
				</c:if>
			</c:if>
		</tr>
	</table>
</body>
</html>