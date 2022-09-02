<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="review" value="${reviewsMap.review }" />
<c:set var="imgList" value="${reviewsMap.imgList}" />
<c:set var="imgListSize" value="${reviewsMap.imgListSize}" />
<%
	int articleIdx =Integer.parseInt( request.getParameter("reviewIdx"));
	int restIdx =Integer.parseInt( request.getParameter("restIdx"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 수정/삭제/쓰기</title>
<link rel ="stylesheet" href="${contextPath }/resources/css/restaurants.css" type="text/css"/>
<style>
html,body{
    width:100%;
    height:95%;
    margin:auto;
}


</style>
</head>
<body>
    <form action="${contextPath}/board/modArticle.do" method="post" id="restaurant-review-write-form" onSubmit="return form_check(this);" enctype="multipart/form-data">
        <!-- 히든 속성으로 매장 번호와 사용자 가져오기 -->
        <input type="hidden" name="articleIdx" value="<%=articleIdx %>" >
         <input type="hidden" name="restIdx" value="<%=restIdx %>" >
        <div class="restaurant-review-write-out"><a onClick="window.close()">✖️</a></div>
        <div class="restaurant-review-write-title"><div id="review-title">title</div><input id="title" type="text" name="title" value="${review.title}"></div>
        <div class="restaurant-review-write-section-wrap">
             <div class="restaurant-review-write-content_star">
                 <p class="content-star">content</p><p class="content-star">별점 : <a style="color:red;">다시체크</a><p>
                <div class="restaurant-review-write-left">
                    <input type="radio" name="reviewStar" value="5" id="rate1"><label
			          for="rate1">⭐</label>
		            <input type="radio" name="reviewStar" value="4" id="rate2"><label
			          for="rate2">⭐</label>
		            <input type="radio" name="reviewStar" value="3" id="rate3"><label
			          for="rate3">⭐</label>
		            <input type="radio" name="reviewStar" value="2" id="rate4"><label
			          for="rate4">⭐</label>
		            <input type="radio" name="reviewStar" value="1" id="rate5"><label
			          for="rate5">⭐</label>
                </div>
                </div>
            <div class="restaurant-review-write-section">
                <textarea class="restaurant-review-write-content" rows="5" id="content" name="content" >${review.contents}</textarea>
            </div>
        </div>
            <div class="restaurant-review-write-ImageUpload">
               <div class="upload-mainImage">
                    <div class="upload-title">main</div>
                    <input type='file' name='mainImage' id='mainImage' onchange="readURLMain(this, 0)"/>
                    	<label for='mainImage'>
                    		<img class="upload-box"  id="mainView" alt="+" src="${contextPath}/download.do?imageFileName=${imgList[0].imageFileName}&imageFileNO=${imgList[0].imageFileNO}&restaurantIdx=${imgList[0].restaurantIdx}" />
                    	</label>
               </div>
               <div class="upload-subImage">
               <div class="upload-title">photo</div>
                 <c:choose>
               		<%-- 서브이미지가 3개다 있는경우 --%>
               		<c:when test="${imgListSize == 4}">
               			<input type='file' name='subImage1' id='subImage1' onchange="readURL(this, 1)"/>
		           				<label for='subImage1'>                  	
		              				  <img class="upload-box" id="subView1" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[1].imageFileName}&imageFileNO=${imgList[1].imageFileNO}&restaurantIdx=${imgList[1].restaurantIdx}" />             		
		          			    </label>
		                    <input type='file' name='subImage2' id='subImage2' onchange="readURL(this, 2)"/>
		                    	<label for='subImage2'>
		                    			<img class="upload-box" id="subView2" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[2].imageFileName}&imageFileNO=${imgList[2].imageFileNO}&restaurantIdx=${imgList[2].restaurantIdx}" />                    		
		                    	</label>
		                    <input type='file' name='subImage3' id='subImage3' onchange="readURL(this, 3)"/>
		                    	<label for='subImage3'>          		
		                    			<img class="upload-box" id="subView3" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[3].imageFileName}&imageFileNO=${imgList[3].imageFileNO}&restaurantIdx=${imgList[3].restaurantIdx}" />                    		
		                    	</label>
               		</c:when>
               		<%-- 서브이미지가 2개 있는경우 --%>
               		<c:when test="${imgListSize == 3}">
               			<input type='file' name='subImage1' id='subImage1' onchange="readURL(this, 1)"/>
		           				<label for='subImage1'>                  	
		              				  <img class="upload-box" id="subView1" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[1].imageFileName}&imageFileNO=${imgList[1].imageFileNO}&restaurantIdx=${imgList[1].restaurantIdx}" />             		
		          			    </label>
		                <input type='file' name='subImage2' id='subImage2' onchange="readURL(this, 2)"/>
		                    	<label for='subImage2'>
		                    			<img class="upload-box" id="subView2" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[2].imageFileName}&imageFileNO=${imgList[2].imageFileNO}&restaurantIdx=${imgList[2].restaurantIdx}" />                    		
		                    	</label>
		                 <input type='file' name='subImage3' id='subImage3' onchange="readURL(this, 3)"/>
		                    	<label for='subImage3'>          		
		                    			<img class="upload-box" id="subView3" alt="+&nbsp;" src="#" />                    		
		                    	</label>
               		</c:when>
               		<%-- 서브이미지가 1개 있는경우 --%>
               		<c:when test="${imgListSize == 2}">
               			<input type='file' name='subImage1' id='subImage1' onchange="readURL(this, 1)"/>
		           				<label for='subImage1'>                  	
		              				  <img class="upload-box" id="subView1" alt="+&nbsp;" src="${contextPath}/download.do?imageFileName=${imgList[1].imageFileName}&imageFileNO=${imgList[1].imageFileNO}&restaurantIdx=${imgList[1].restaurantIdx}" />             		
		          			    </label>
		          	<input type='file' name='subImage2' id='subImage2' onchange="readURL(this, 2)"/>
		                    	<label for='subImage2'>
		                    			<img class="upload-box" id="subView2" alt="+&nbsp;" src="#" >                    		
		                    	</label>
		                    <input type='file' name='subImage3' id='subImage3' onchange="readURL(this, 3)"/>
		                    	<label for='subImage3'>          		
		                    			<img class="upload-box" id="subView3" alt="+&nbsp;" src="#" />                    		
		                    	</label>
               		</c:when>
               		<%-- 서브이미지가 없는경우 --%>
               		<c:otherwise>
               			<input type='file' name='subImage1' id='subImage1' onchange="readURL(this, 1)"/>
		           				<label for='subImage1'>                  	
		              				  <img class="upload-box" id="subView1" alt="+&nbsp;" src="#" />             		
		          			    </label>
		                    <input type='file' name='subImage2' id='subImage2' onchange="readURL(this, 2)"/>
		                    	<label for='subImage2'>
		                    			<img class="upload-box" id="subView2" alt="+&nbsp;" src="#" />                    		
		                    	</label>
		                    <input type='file' name='subImage3' id='subImage3' onchange="readURL(this, 3)"/>
		                    	<label for='subImage3'>          		
		                    			<img class="upload-box" id="subView3" alt="+&nbsp;" src="#" />                    		
		                    	</label>
               		</c:otherwise>
               </c:choose>
            </div>
            </div>
            <div class="restaurant-review-write-btn">
                <input type="submit" id="restaurant-review-write-submit" value="등록" />
                <input type="button" id="restaurant-review-write-delete" value="삭제" />
            </div>
    </form>
    <script>
 // 메인 이미지 미리보기
    function readURLMain(input, index) {
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e){
				$('#mainView').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}  
    
 // 서브 이미지 미리보기
    function readURL(input, index) {
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e){
				$('#subView'+index).attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}   
    // 유효성 체크
    function form_check(form){
		const title = document.getElementById("title");
		const content = document.getElementById("content");
		const mainView = document.getElementById("mainView");
		
		if(title.value ==""){
			alert("제목은 반드시 입력해야 합니다.");
			title.focus();
			return false;
		}
		if(content.value ==""){
			alert("내용은 반드시 입력해야 합니다.");
			content.focus();
			return false;
		}
		if(mainView.value ==""){
			alert("메인 이미지는 반드시 첨부해 주셔야 합니다.");
			mainView.focus();
			return false;
		}
		if($(':radio[name="reviewStar"]:checked').length<1){
			alert("별점을 체크해 주셔야 합니다.");
			return false;
		}
		return true;		
	}
        
    </script>
</body>
</html>