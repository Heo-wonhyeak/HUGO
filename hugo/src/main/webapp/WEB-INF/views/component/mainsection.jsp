<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mainSection {
	margin: auto;
	width: 50%;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	position: relative;
}

.hotCategory {
	width: 200px;
	height: 200px;
	text-align: center;
	font-size: 30px;
	margin: 10px;
	justify-content: center;
	display: flex;
	align-items: center;
	border-radius: 50%;
	background-color: yellow;
	cursor: pointer;
}

.hotCategoryOrder {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	position: relative;
	width: 50%;
	margin: auto;
}

.orderMenu {
	width: auto;
	height: 100px;
	text-align: center;
	font-size: 30px;
	margin: 10px;
	justify-content: center;
	display: flex;
	align-items: center;
}

.main_list {
	width: 100%;
	margin: auto;
}

.list_start {
	text-align: center;
/* 	display: flex; */
/* 	justify-content: center; */
}

.list_detail {
 	display: inline-block; 
/* 	display: block; */
	width: 400px;
	height: 700px;
	border: 1px solid red;
	margin-bottom: 10px;
}

.pagingDiv {
	text-align: center;
	display: flex;
	justify-content: center;
}

.pagingDiv > a {
	font-size: 20px;
	cursor: pointer;
	margin-left: 20px;
	margin-right: 20px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	CommonAjax("/hotSpotList", 'POST', null, successHotSpotList);
});

//공통 ajax 처리 로직.
const CommonAjax = (url, type, param, callback) => {	
	$.ajax( {
		type :type
		,url : url
		,data:param
		,success : (jsonData) => {
			callback(jsonData);
		}
		,error : () => {
			alert("error발생");
		}
	});
}

const successHotSpotList = (jsonData) => {
	
	console.log(jsonData);
	console.log(jsonData.data);
	
	//데이터 읽어오고 해당 카테고리 값을 hidden에 저장
	$("#hotspot_cd").val(jsonData.data[0].hotspot_cd);
	
	var resHtml = "";
	
	for (var i = 0; i < jsonData.data.length; i++) {
		resHtml += `<div class="list_detail" onclick="alert('상세보기 구현 예정');">`;
		resHtml += '<p>'+jsonData.data[i].hotspot_idx+'</p>';
		resHtml += `<div style="border: 1px solid blue; width: 100%; height: 50%; background-image: url(../img/background.jpg);">`;
		resHtml += `</div>`;
		resHtml += `<div style="border: 1px solid green; width: 100%; height: 42%;">`;
		resHtml += '<h1>'+jsonData.data[i].hotspot_name+'</h1>';
		resHtml += `<p>정보들 표출 영역2</p>`;
		resHtml += `<p>정보들 표출 영역3</p>`;
		resHtml += `<p>정보들 표출 영역4</p>`;
		resHtml += `<p>정보들 표출 영역5</p>`;
		resHtml += `</div>`;
		resHtml += `</div>`;
	}
	
	$(".list_start").html(resHtml);
	
	//페이징처리
	var pagingHtml = "";
	
	var page = jsonData.pagination.page;
	var startPage = jsonData.pagination.startPage;
	var endPage = jsonData.pagination.endPage;
	
	if(jsonData.pagination.startPage > 8) {
		pagingHtml += '<a onclick="selectPage('+(jsonData.pagination.startPage-1)+');">이전</a>';
	}
	
	for (var num = startPage; num <= endPage; num++) {
		//실제 페이지 번호 표출. 
		if(num == page) {
			pagingHtml += '<a onclick="selectPage('+ num +');">' + num + '</a>';
		} else {
			pagingHtml += '<a onclick="selectPage('+ num +');">' + num + '</a>';
		}
	}
	
	if(jsonData.pagination.totalPageCnt > jsonData.pagination.endPage) {
		pagingHtml += '<a onclick="selectPage('+(jsonData.pagination.endPage+1)+');">다음</a>';
	}
	
	$(".pagingDiv").html(pagingHtml);
	
}

//상단의 3개의 카테고리를 클릭했을때
const selectCategory = (category) => {
// 	alert(category);
	
	var paramData = {
		"hotspot_cd" : category
	}
	
	CommonAjax("/hotSpotList", 'POST', paramData, successHotSpotList);

}

//하단의 페이지의 번호를 클릭했을때
const selectPage = (pageNum) => {
// 	alert("매개변수 : " + pageNum);
// 	alert("hidden값 : " + $("#hotspot_cd").val());
	
	var paramData = {
		"hotspot_cd" : $("#hotspot_cd").val(),
		"page" : pageNum
	}
	
	CommonAjax("/hotSpotList", 'POST', paramData, successHotSpotList);
}

</script>
</head>
<body>
	<div class="mainSection">
		<div class="hotCategory" onclick="selectCategory('R');">맛집</div>
		<div class="hotCategory" onclick="selectCategory('P');">명소</div>
		<div class="hotCategory" onclick="selectCategory('F');">축제</div>
	</div>
	
	<input type="hidden" id="hotspot_cd" value="">

	<div class="hotCategoryOrder">
		<div class="orderMenu">별점순</div>
		<div class="orderMenu">인기순</div>
		<div class="orderMenu">가장많은찜</div>
		<div class="orderMenu">리뷰순</div>
	</div>

	<div class="main_list">
		<div class="list_start">
		</div>
	</div>

	<!-- 하단 리스트 번호 -->
	<div class="pagingDiv"></div>
</body>
</html>