<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>약관동의</title>
</head>
<style>
body {
	padding: 50px;
	margin: 50px;
}

.h2 {
	padding: 0 0 15px 20px;

	color: #222;
	line-height: 100%;
}

.h3{
	text-align: center;
}

.agree {
	border: 1px solid #e6e6e6;
}

.agree>div {
	overflow: auto;
	height: 124px;
	padding: 24px 19px;
	
	color: #555;
	line-height: 16px;
	}

.agree>p {
	height: 43px;
	background: #f8f8f8;
	border-top: 1px solid #e6e6e6;
	line-height: 43px;
	
	color: #222;
	text-indent: 19px;
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form,
	fieldset, p, button, table, th, td, pre {
	margin: 0;
	padding: 0;
}

body, div, dl, dt, dd, h1, h2, h3, h4, h5, h6, form, fieldset, p, th, td,
	input, textarea, select, button, pre, a {
	
	
	color: #222;
}

textarea {
	width: 100%;
}

select, input, img, button {
	vertical-align: middle;
}

ul, ol {
	list-style-type: none;
}

.hide, legend, hr, caption span {
	position: absolute;
	left: -3000%;
}

em, address {
	font-style: normal;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

a {
	color: #666;
	text-decoration: none;
}

a:focus, a:hover {
	text-decoration: none;
}

fieldset, img, button {
	border: 0;
}

input[type=text]::-ms-clear {
	display: none;
}

select {
	padding: 0 0 0 5px;
	height: 38px;
	border: 1px solid #e3e3e3;
}

textarea
	{
	text-indent: 4px;
	border: 1px solid #ccc;
}



input[type="radio"] {
	vertical-align: text-bottom;
}

.clear {
	zoom: 1;
	clear: both;
}

.clear:after {
	content: "";
	display: block;
	clear: both;
}

.skip {
	position: absolute;
	left: 0;
	top: -100px;
	z-index: 1000;
	width: 100%;
	height: 60px;
	line-height: 60px;
	text-align: center;
	font-size: 20px;
	color: #fff;
	transition: all 0.5s;
	background: #666;
}

.skip:focus {
	top: 0;
}

#next_btn{
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 130px;
  background-color:#9bb7d6;
  margin-bottom: 30px;
  color: white;
  text-align: center;
  float:right;
  border-radius: 5px;

}
</style>
<body>

	<h2 class="h2">홈페이지 이용약관</h2>
	<h2 style="text-align: center;">1.약관동의</h2><br>
	
	<div class="agree">
		
	<h3 class="h3">이용약관동의</h3>
		<div tabindex="0">
		이용약관동의
		</div>
		<p>
			<input type="checkbox" id="chk1"><label for="chk1">홈페이지
				이용약관에 동의합니다.(동의하지 않을경우 가입되지 않습니다.)</label>
		</p><br>

		<h3 class="h3">개인정보 처리방침</h3>
		<div tabindex="0">
		개인정보 처리방침
		</div>
		<p>
			<input type="checkbox" id="chk2"><label for="chk2">홈페이지
				이용약관에 동의합니다.(동의하지 않을경우 가입되지 않습니다.)</label>
		</p><br>
		
		<h3 class="h3">위치기반 서비스 이용약관</h3>
		<div tabindex="0">
         위치기반 서비스 이용약관
		</div>
		<p>
			<input type="checkbox" id="chk3"><label for="chk3">홈페이지
				이용약관에 동의합니다.(동의하지 않을경우 가입되지 않습니다.)</label>
		</p>
		
		<p>
			<input type="checkbox" id="chk3"><label for="chk3">
				위 약관에 모두 동의 하십니까?</label>
			<input type="button" id="next_btn" value="다음단계로" onClick="location.href='signup.jsp'"/>
		</p><br>
		
	</div>

</body>
</html>