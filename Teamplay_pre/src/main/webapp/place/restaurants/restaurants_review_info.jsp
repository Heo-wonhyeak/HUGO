<!--  
	파 일명 칭   : view.jsp
	작 성 자    : 정 원 영
	업데이트 날짜 : 2022. 07. 06 수
	수 정 날 짜  : 2022. 07. 14 목
	기  능      : 매장 상세보기 페이지 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 리뷰 상세보기(팝업)</title>
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
    <section class="restaurants_review_info_popup">
        <div class="restaurants_review_info_image">
            <div class="restaurants_review_info_mainImage"></div>
            <div class="restaurants_review_info_subImages">
            <!-- 있는 갯수 만큼 보이기 -->
                <div class="restaurants_review_info_subImage"></div> 
                <div class="restaurants_review_info_subImage"></div>
                <div class="restaurants_review_info_subImage"></div>
                <div class="restaurants_review_info_subImage"></div>
            </div>
        </div>
        <div class="restaurants_review_info_txt">
            <div class="restaurants_review_info_header">
                <div class="restaurants_review_info_user">
                    <div class="restaurants_review_info_userImg"></div>
                    <div class="restaurants_review_info_userInfo">
                        <table>
                            <tr>
                                <td>닉시아</td><td>2022 - 06 - 12</td>
                            </tr>
                            <tr>
                                <td>추천 1</td><td>쓴 리뷰 30</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="restaurants_review_info_out"><a onClick="window.close()">✖️<a></div>
            </div>
            <div class="restaurants_review_info_star">⭐️⭐️⭐️⭐️⭐️</div>
            <div class="restaurants_review_info_contents">12121212</div>
            <div class="restaurants_review_info_recommend">추천해요😀</div>
        </div>
    </section>

    <script>
        // DTO 담아와서 뿌리기
    </script>
</body>
</html>