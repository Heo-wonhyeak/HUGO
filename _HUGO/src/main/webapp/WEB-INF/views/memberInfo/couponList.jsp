<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<style type="text/css">
		#couponList{
			margin: 50px auto;
			width:1000px;
		}
		#couponList table{
			width: 100%;
			border: 1px solid #A4A4A4;
			border-collapse: collapse;
		}
		#couponList table th{
			border: 1px solid #A4A4A4;
		}
		#couponList table td{
			border: 1px solid #A4A4A4;
		}
		#couponList table .th1{
			width: 60%;
		}
		#couponList table .th2{
			width: 10%;
		}
		#couponList table .th3{
			width: 20%;
		}
		#couponList table td input{
			border: none;
			display:inline;
		}
		#couponList table td input.couponStack{
			width: 50px;
		}
		#couponList table td input.couponRate{
			width: 50px;
		}
		
		#couponList table td input.couponExpire{
			width: 150px;
		}
		#couponList table .noCoupon td{
			padding: 20px;
			text-align: center;
			font-size: 30px;
		}
		#buttons{
			margin: 30px auto;
			box-sizing:border-box;
			width:200px;
			height:60px;
		}
	#buttons #btn_CouponPage{
			margin: auto;
			width:100%;
			height:100%;
			font-size: 23px;
			background-color: #9bb7d6;
			border-radius: 0.4em;
		}
	</style>
</head>
<body>
	<div id="couponList">
		<table >
			<tr>
				<th class="th1">쿠폰명</th>
				<th class="th2">수량</th>
				<th class="th2">할인율</th>
				<th class="th3">사용 기한</th>
			</tr>
			<tr class="noCoupon">
				<td  colspan="4">
					보유한 쿠폰이 없습니다.
				</td>
			</tr>
			
			<tr>
				<td>
					<a class="couponName" href="${contextPath}/event/couponDTL.do">아기 강아지</a>
				</td>
				<td>
					<input type="text" class="couponStack" value="1">
				</td>
				<td>
					<input type="text" class="couponRate" value="10%">
				</td>
				<td>
					<input type="text" class="couponExpire" value="2022.06.30">
				</td>
			</tr>
			
			<tr>
				<td>
					<a class="couponName" href='${contextPath}/event/couponDTL.do'>신규 가입 기념 할인 쿠폰</a>
				</td>
				<td>
					<input type="text" class="couponStack" value="1">
				</td>
				<td>
					<input type="text" class="couponRate" value="10%">
				</td>
				<td>
					<input type="text" class="couponExpire" value="2022.08.24">
				</td>
			</tr>
			
			<tr>
				<td>
					<a class="couponName" href='${contextPath}/event/couponDTL.do'>여름휴가 기념 할인 쿠폰</a>
				</td>
				<td>
					<input type="text" class="couponStack" value="2">
				</td>
				<td>
					<input type="text" class="couponRate" value="5%">
				</td>
				<td>
					<input type="text" class="couponExpire" value="2022.08.24">
				</td>
			</tr>
		</table>
	</div>
		
	<div id="buttons">
			<input  id="btn_CouponPage" type="button" value="쿠폰페이지로" onclick="location.href='${contextPath}/event/couponPage.do'" />
	</div>
</body>
</html>