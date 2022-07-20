<!--  
	파 일명 칭   : restaurants_review_write.jsp
	작 성 자    : 정 원 영
	업데이트 날짜 : 2022. 07. 14 목
	수 정 날 짜  : 2022. 07. 21 목
	기  능      : 매장 상세보기 페이지 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 수정/삭제/쓰기</title>
<link rel="stylesheet" href="restaurants.css?after" type="text/css" >
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
                    <input type='file' name='mainImage' id='mainImage'/><label for='mainImage'><div class="upload-box">➕</div></label>
               </div>
               <div class="upload-subImage">
                    <div class="upload-title">photo</div>
                    <input type='file' name='subImage' id='subImage1'/><label for='subImage1'><div class="upload-box">➕</div></label>
                    <input type='file' name='subImage' id='subImage2'/><label for='subImage2'><div class="upload-box">➕</div></label>
                    <input type='file' name='subImage' id='subImage3'/><label for='subImage3'><div class="upload-box">➕</div></label>
               </div>
            </div>
            <div class="restaurant-review-write-btn">
                <input type="button" id="restaurant-review-write-modify" value="수정" />
                <input type="submit" id="restaurant-review-write-submit" value="등록" />
                <input type="button" id="restaurant-review-write-delete" value="삭제" />
            </div>
    </form>
    <script>
        // 폼양식 디비에 올리기
        
    </script>
</body>
</html>