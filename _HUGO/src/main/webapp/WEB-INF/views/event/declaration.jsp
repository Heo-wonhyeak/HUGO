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
	<link rel ="stylesheet" href="${contextPath }/resources/css/event.css" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
</head>
<body>
	<table>
		<tr align="center">
			<td align="left" width ="30%">신고 사유 : </td>
			<td align="center" width ="70%">
				<select>
					<option>스팸홍보/도배글</option>
					<option>부적절한 언어사용</option>
					<option>청소년 유해내용 포함</option>
					<option>혐오/차별적 표현</option>
					<option>개인정보 노출</option>
					<option>기타</option>
				</select>
			</td>
		</tr>
		<tr align="center">
			<td align="left" width ="30%">내용 : </td>
			<td align="center" width ="70%">
				<textarea rows="15" cols="30"
				placeholder="내용을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요'"></textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<form action="#">
					<input type="submit" value="신고하기"/>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>