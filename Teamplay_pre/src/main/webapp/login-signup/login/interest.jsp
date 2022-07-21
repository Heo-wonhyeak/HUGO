<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>관심사</title>
<style>
h3 {
	text-align: center;
}

#interest-form {
	padding: 0px 30px 0px 30px;
}

#select {
	width: auto;
	height: 700px;
	padding-left: 30px;
}

.btn {
	width: 150px;
	height: 150px;
	float: left;
	margin: 40px;
}

#next {
	text-align: center
}

.next_btn {
	font-size: 14px;
	border: none;
	padding: 10px;
	width: 200px;
	background-color: #9bb7d6;
	color: white;
	margin: 10px;;
	border-radius: 5px;
}
</style>
</head>
<body>
	<h2>관심사</h2>

	<h2 style="text-align: center;">3.관심사</h2>
	<h3>관심있는 토픽 2개 이상 선택해주세요</h3>
	<h3 style="color: #808080;">취향에 맞는 핫플 소식을 알려드릴게요!</h3>

	<hr style="border: thin 2px #808080;">

	<div id="interest-form">
		<div id="select">
			<button class="btn">
				<img src="./image/mountain.png" height="140" width="140" /> 산
			</button>			

			<button class="btn">
				<img src="./image/sea.png" height="140" width="140" />바다
			</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<!-- 5 -->

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<!-- 10 -->

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<!-- 15 -->

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<button class="btn">명소</button>

			<!-- 18 -->

		</div>
	</div>


	<br>
	<div id="next">
		<input type="button" class="next_btn" value="나중에하기"
			onClick="location.href='save.jsp'"> <input type="submit"
			class="next_btn" value="관심사저장" onClick="location.href='save.jsp'">
	</div>
</body>
</html>