<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 리뷰 상세보기(팝업)</title>
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