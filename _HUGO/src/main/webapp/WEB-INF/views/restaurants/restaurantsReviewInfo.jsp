<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="review" value="${reviewsMap.review }" />
<c:set var="imgList" value="${reviewsMap.imgList}" />
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
        	<img class="restaurants_review_info_mainImage" alt="" src="${contextPath}/download.do?imageFileName=${imgList[0].imageFileName}&imageFileNO=${imgList[0].imageFileNO}&restaurantIdx=${imgList[0].restaurantIdx}" />
            <div class="restaurants_review_info_subImages">
           		<c:forEach items="${imgList}" var="imgList" varStatus="status">
                	<img class="restaurants_review_info_subImage" alt="" src="${contextPath}/download.do?imageFileName=${imgList.imageFileName}&imageFileNO=${imgList.imageFileNO}&restaurantIdx=${imgList.restaurantIdx}" />
                </c:forEach>
            </div>
        </div>
        <div class="restaurants_review_info_txt">
            <div class="restaurants_review_info_header">
                <div class="restaurants_review_info_user">
                    <img class="restaurants_review_info_userImg" alt="default" src="${contextPath }/resources/img/restaurant/user_default.jpg"/>
                    <div class="restaurants_review_info_userInfo">
                        <table>
                            <tr>
                                <td style="font-size:1.2em;">${review.nickName}&nbsp;&nbsp;</td>
                                <td>${review.regDate}</td>
                            </tr>
                            <tr>
                                <td>추천&nbsp;&nbsp;${review.reviewStamp}</td><td>쓴 리뷰&nbsp;&nbsp;${review.userTotalReview}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="restaurants_review_info_out"><a onClick="window.close()">✖️</a></div>
            </div>
            <div class="restaurants_review_info_star">⭐&nbsp;️️${review.starCount}&nbsp;️️점</div>
            <div class="restaurants_review_info_contents"><p class="restaurants-review-title">${review.title }</p>${review.contents }</div>
        </div>
    </section>

</body>
</html>