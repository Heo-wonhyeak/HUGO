<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
    <form action="#" method="post" id="restaurant-review-write-form">
        <!-- 히든 속성으로 매장 번호와 사용자 가져오기 -->
        <div class="restaurant-review-write-out"><a onClick="window.close()">✖️<a></div>
        <div class="restaurant-review-write-title"><div id="review-title">title</div><input id="title" type="text" name="title" /></div>
        <div class="restaurant-review-write-section-wrap">
             <div class="restaurant-review-write-content_star">
                 <p class="content-star">content</p><p class="content-star">별점<p>
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
                <textarea class="restaurant-review-write-content" rows="5" id="content" name="content" placeholder="내용 작성" ></textarea>
            </div>
        </div>
            <div class="restaurant-review-write-ImageUpload">
               <div class="upload-mainImage">
                    <div class="upload-title">main</div>
                    <input type='file' name='mainImage' id='mainImage' onchange="readURLMain(this, 0)"/>
                    <label for="mainImage">
                    	<div class="upload-box">
                    		<img class="img-box"  id="mainView" alt="+" src="#" />
                    	</div>
                    </label>
               </div>
               <div class="upload-subImage">
                    <div class="upload-title">photo</div>
                    <input type='file' name='subImage1' id='subImage1' onchange="readURL(this, 1)"/>
                    	<label for='subImage1'>
                    		<div class="upload-box" >
                    			<img class="img-box" id="subView1" alt="+" src="#" />
                    		</div>
                    	</label>
                    <input type='file' name='subImage2' id='subImage2' onchange="readURL(this, 2)"/>
                    	<label for='subImage2'>
                    		<div class="upload-box" >
                    			<img class="img-box" id="subView2" alt="+" src="#" />
                    		</div>
                    	</label>
                    <input type='file' name='subImage3' id='subImage3' onchange="readURL(this, 3)"/>
                    	<label for='subImage3'>
                    		<div class="upload-box" >
                    			<img class="img-box" id="subView3" alt="+ " src="#" />
                    		</div>
                    	</label>
               </div>
            </div>
            <div class="restaurant-review-write-btn">
                <input type="submit" id="restaurant-review-write-submit" value="등록" />
                <input type="reset" id="restaurant-review-write-reset" value="다시쓰기" />
            </div>
    </form>
    <script>
    function readURLMain(input, index) {
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e){
				$('#mainView').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}  
    
    function readURL(input, index) {
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e){
				$('#subView'+index).attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}   
    </script>
</body>
</html>