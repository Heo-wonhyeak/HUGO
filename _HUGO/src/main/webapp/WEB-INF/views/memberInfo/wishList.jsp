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
	<title>찜리스트</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		#wishList{
			width: 800px;
			margin: 50px 450px;
		}
		#wishList table{
			width: 1000px;
			color: #A4A4A4;
			border: 1px solid #A4A4A4;
			border-collapse: collapse;
		}
		
		#wishList table td{
			height: 100px;
			border: 1px solid #A4A4A4;
		}
		#wishList table .resImg{
			width : 15%;
			text-align: center;
		}
		
		#wishList table .resImg img{
			width : 80%;
			height : 100%;
		}
		#wishList table  table.resInfo{
			width : 70%;
			height: 30px;
			border: none;
		}
		#wishList table .resInfo input{
			border: none;
		}
		#wishList table .resInfo .resValue{
			width: 50px;
		}
		#wishList table .resInfo img{
			margin-top: 10px;
		}
		#wishList table .btn_resInfo{
			width: 15%;
			text-align: center;
		}
		#wishList table .btn_resInfo input{
			margin : 5px;
			width: 90px;
			background-color: #9bb7d6;
			border-radius: 0.25em;
			text-align: center;
		}
		
	
	</style>
</head>
<body>
	<form action="#" method="post" id="wishList">
		<table>
			<tr>
				<td class="resImg">
					<img src="${contextPath }/resources/img/memberInfo/res1.PNG" />
				</td>
				<td>
					<div class="resInfo">
							<input type="text" class="resName" value="맛있는 족발"/> <br />			
							<img alt="별점" src="${contextPath }/resources/img/memberInfo/starAvg.PNG" >
							<input type="text" value="4.9" class="resValue" />
							<img alt="좋아요" src="${contextPath }/resources/img/memberInfo/like.PNG">
							<input type="text"  value="584" class="resValue" />
					</div>
				</td>
				<td class="btn_resInfo">
					<input type="button" value="리뷰 작성하기" onclick="../" /> <br />
					<input type="button" value="삭제하기" onclick="fn_delete_Jjim()" />
				</td>
			</tr>
			
			<tr>
				<td  class="resImg">
					<img src="${contextPath }/resources/img/memberInfo/res2.PNG" />
				</td>
				<td>
					<div class="resInfo">
							<input type="text" class="resName" value="돼통령 xx점"/> <br />			
							<img alt="별점" src="${contextPath }/resources/img/memberInfo/starAvg.PNG">
							<input type="text" value="4.5" class="resValue" />
							<img alt="좋아요" src="${contextPath }/resources/img/memberInfo/like.PNG">
							<input type="text"  value="200" class="resValue" />
					</div>
				</td>
				<td class="btn_resInfo">
					<input type="button" value="리뷰 작성하기" onclick="../" /> <br />
					<input type="button" value="삭제하기" onclick="fn_delete_Jjim()" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>