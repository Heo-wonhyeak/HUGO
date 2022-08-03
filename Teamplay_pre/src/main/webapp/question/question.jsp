<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문 (Q&A)</title>
<style type="text/css">

/* 헤더 CSS */
.HeaderContainer {
	width: 90%;
	margin : 0 auto;
	height : 150px;	
}
.HeaderLogo {
	display: inline-block;
	width : 15%;
	height : 80%;
	position : relative;
	left : 2%;
	top : 5%;
}
/* 마이메뉴css */
.myMenu{
	display: none;
	width: 100px;
	height: 150px;
	position: absolute;
	left: 300px;
	border : 1px solid #9bb7d6;
	margin: 0px;
}
.myMenu ul{
	list-style: none;
}
.search {
	display : inline-block;
	width : 70%;
	height : 20%;
	position : relative;
	bottom : 25%;
	left : 3%;
}

.searchbox {
	width : 90%;
	height : 100%;
	border-radius : 0.2em;
}

.searchBtn{
	width : 38px ;
	height : 100%;
	background-color: #9bb7d6; 
	border-radius : 0.5em;
}
.headerMenu{
	display : inline-block;
	position : relative;
	bottom: 75%;
	float : right;
	color : #9bb7d6;
}
.serchDTL{
	display : inline-block;
	position : relative;
	float : left;
	left : 18.5%;
	bottom: 23%;	
}
.searchDTLBTN{
	height : 30px;
	background-color: #9bb7d6; 
	border-radius : 0.5em;
}
/* 헤더 CSS 종료 */


/* 지주 묻는 질문 css */
* {
	margin: 0;
	padding: 0;
}

.accordion {
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translateX(-50%);
	width: 1400px;
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	padding: 30px;
	border-bottom: 0;
	color: black;
	font-weight: 900;
	/* background: #ADD8E6; */
	cursor: pointer;
	position: relative;
	border-top: 2px solid #E0E0E0;
	/* background-color: black; */
}

input[id*="answer"]:checked +label {
	background-color: #9bb7d6;
}

input[id*="answer"]+label em {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 30px;
	height: 30px;
	margin-top: -15px;
	display: inline-block;
	background: url('https://ifh.cc/g/hCtr7Q.png') 0 0 no-repeat;
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #F3FBFD;
	font-size: 11px;
	
}

input[id*="answer"]+label+div p {
	display: inline-block;
	padding: 20px;
}

input[id*="answer"]:checked+label+div {
	max-height: 500px;
}

input[id*="answer"]:checked+label em {
	background-position: 0 -30px;
}

a {
	text-decoration: none;
}

a:link {
	color: black;
}

a:visited {
	color: #0074a5;
}

.ahref {
	text-align: center;
	font-size: x-large;
	/* margin-top: 80px; */
	/* margin-right: 30px; */
	margin-top: 45px;
	font-weight: 900;
	font-size: 23px; 
	font-weight: bold;
	text-shadow: 1px 1px 10px #fff55e;
}

.hreftag {
	margin-right: 170px;
}

#underline {
	text-decoration: underline;
}

p {
	font-size: medium;
}
</style>
  
</head>
<body>

	<div class="HeaderContainer">
		<div class="HeaderLogo">
			<img src="https://ifh.cc/g/pqSQJr.jpg" style="width:100%; height:100%;">
		</div>
		<div class="search">
			<input type="text" class="searchbox"/>
			<button class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<div class="headerMenu">
			<a>이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href = "../custormercenter/CustomerCenterMain.jsp">고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a onclick="return showMenu()"><i class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
			<div class="myMenu">
				<ul>	
					<li>ezen님</li>
					<li>&nbsp;</li>
					<li><a>회원정보</a></li>
					<li><a>쿠폰함</a></li>
					<li><a>찜리스트</a></li>
			</ul>
			</div>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>
	
	
	<div class="ahref">
		<a href="../board/write.jsp" class="hreftag">1:1문의</a> <a
			href="../board/list.jsp" class="hreftag">문의내역</a> <a 
			href="../question/question.jsp" class="hreftag" id = underline>자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	
	<div class="accordion">
		<br><br><br>
		<input type="checkbox" name="accordion" id="answer01"> <label
			for="answer01">Q. [고객센터] 고객센터 운영시간은 어떻게 되나요?<em></em></label>
			
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 24시간 365일 연중무휴로 운영하고 있지만 전화 상담은 평일 9:00~18:00에만 가능합니다.
    		     더 자세한 내용은 고객센터 홈페이지를 이용해주시길 바랍니다</p>
		</div>
		<input type="checkbox" name="accordion" id="answer02"> <label
			for="answer02">Q. [회원정보] 개인정보와 관련된 피해를 입은 경우 어떻게 하나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 고객님의 개인정보를 [개인정보 취급방침] 에서 고지한 범위 내에서 사용하며, <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp;  고지한 범위를 초과하여 이용하거나 타인 또는 타기업/기관에 제공하지 않습니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer03"> <label
			for="answer03">Q. [회원정보] 개인정보는 안전하게 보호받고 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 저희 HUGO는 인터넷을 통해 전달되는 고객님의 정보 보안 및 안전한 거래를 위해 보안시스템 SSL(Secure Socket Layer) 암호화를 도입했습니다. <br/><br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;※ SSL(Secure Socket Layer)란? <br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;브라우저와 서버 간의 통신에서 정보를 암호화함으로써 인터넷 도중에 해킹을 통해 정보가 유출되더라도 해당 정보의 내용을 보호할 수 있게 해주는 <br/>
			   &nbsp;&nbsp;&nbsp;&nbsp;보안 시스템입니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer04"> <label
			for="answer04">Q. [비밀번호] 비밀번호가 기억나지 않아요.<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 아래의 경로로 비밀번호를 재설정해 주시기 바랍니다. <br/><br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; <b>비밀번호 재설정하기</b></p>
		</div>
		<input type="checkbox" name="accordion" id="answer05"> <label
			for="answer05">Q. [회원정보] 회원정보 수정은 어떻게 하나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 회원정보에서는 이름(개명), 아이디, 휴대폰번호, 비밀번호 등 수정이 가능합니다. <br/><br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; <b>회원정보 수정하기</b></p>
		</div>
		<input type="checkbox" name="accordion" id="answer06"> <label
			for="answer06">Q. [회원정보] 본인명의 휴대폰인증이 안되는 경우도 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 타인 및 법인 명의, 일시 정지된 휴대폰 등의 경우 휴대폰 인증이 불가합니다. <br/><br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; <b>휴대폰 인증이 불가한 경우</b><br/> 
			      &nbsp;&nbsp;&nbsp;&nbsp; • 본인명의 인증이 불가한 기기(휴대폰): 선불 휴대폰<br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; • 본인인증이 불가능한 상태:<br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 분실 또는 일지정지(이용자의 요청 또는 미납 상태) 상태<br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 법인 명의로 개통<br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 이동 통신사에 미등록된 휴대폰(해지 또는 미개통)</p>
		</div>
		<input type="checkbox" name="accordion" id="answer07"> <label
			for="answer07">Q. [회원가입] 제 명의로 가입된 휴대폰번호가 없습니다. 다른 사람의 휴대폰번호를 사용해도 되나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 본인 명의의 휴대폰 번호로 가입해주시기 바랍니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 휴고는 가입 시 등록한 휴대폰번호로 주요 서비스 정책 변경 등의 중요한 정보를 안내해 드립니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 또한 일부 서비스의 경우 본인 인증 후 서비스 이용이 가능합니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer08"> <label
			for="answer08">Q. [회원가입] 아이디를 여러개 사용할 수 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 여러 개의 아이디로 가입하실 수는 있습니다만, 상품 구매를 위해서는 본인인증이 필요합니다. <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; 구매 활동에 대한 정확한 안내를 위해 1인당 1개의 아이디만 사용하실 것을 권장합니다. <br/>
    			  &nbsp;&nbsp;&nbsp;&nbsp; 이미 가입(인증)한 아이디가 있다면 아이디 찾기를 이용해주시길 바랍니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer09"> <label
			for="answer09">Q. [회원가입] 외국인도 회원가입을 할 수 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 국내에 거주하는 외국인은 회원가입이 가능합니다. <br/><br/>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 단, 중요 정보 안내를 위해 휴대폰 본인 인증이 필요하며, 본인인증을 완료하지 않을 경우 서비스 이용에 제한이 있을 수 있습니다 </p>
		</div>
		<input type="checkbox" name="accordion" id="answer10"> <label
			for="answer10">Q. [회원탈퇴] 회원탈퇴는 어떻게 하나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 회원 탈퇴하는 방법은 다음과 같습니다. 회원 탈퇴 전, 유의사항을 반드시 확인해주시기 바랍니다.<br/><br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; <b>회원 탈퇴하기</b><br/><br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; <b>회원탈퇴 시 유의 사항</b><br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; • 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다. <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; • 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다. <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; • 유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다. <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp; • 회원탈퇴 후 쿠팡 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, <br/>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.
			</p>
		</div>
		<input type="checkbox" name="accordion" id="answer11"> <label
			for="answer11">Q. [쿠폰] 쿠폰함에서 쿠폰이 사라졌어요.<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 사용하지 않은 쿠폰은 유효기간이 지나면 쿠폰함에서 자동 삭제가 됩니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 쿠폰함에서 유효기간을 미리 확인해 주세요.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer12"> <label
			for="answer12">Q. [회원정보] 아이디가 기억나지 않아요.<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 로그인 > 아이디찾기에서 확인 가능 <br/> <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; ㆍ가입된 아이디 확인 방법 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1) 휴대폰번호로 찾기 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 고객명과 가입 시 등록한 휴대폰 번호를 통해 인증 후 확인 가능 <br/><br/>
			      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2)  이메일로 찾기 <br/>
      			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 고객명과 가입 시 등록한 이메일 주소를 입력 후 확인 가능
			      </p>
		</div>
		<input type="checkbox" name="accordion" id="answer13"> <label
			for="answer13">Q. [회원탈퇴] 탈퇴하면 개인정보는 모두 삭제되나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> ㆍ고객님의 개인정보는 5일 동안 보관 후 모두 삭제되며, 탈퇴에 대한 안내메일을 발송해 드립니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; ㆍ단, 상법 및 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에 의하여 아래와 같이 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 정해진 기간 동안 보유 후 파기합니다. <br/><br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 계약 또는 청약철회 등에 관한 기록 : 5년 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 대금 결제 및 재화 등의 공급에 관한 기록 : 5년 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; - 소비자의 불만 또는 분쟁에 관한 기록 : 3년 <br/>
			      </p>
		</div>
		<input type="checkbox" name="accordion" id="answer14"> <label
			for="answer14">Q. [회원가입]이미 가입된 이메일 주소라고 표시되며, 회원가입을 할 수 없습니다.<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 이미 가입된 고객이 동일한 이메일 주소를 등록하여 사용중인 경우로 중복되어 가입할 수 없습니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 이메일 주소는 아이디로 활용되는 동시에 주요 서비스 정책 변경 등을 안내해 드리고 있으므로 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 반드시 가입자 본인 명의의 이메일 주소 사용 바랍니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer15"> <label
			for="answer15">Q. [회원정보] 아이디를 변경할 수 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> ㆍ아이디가 이메일주소로 등록되어 있지 않은 경우 아이디는 변경하실 수 없습니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; ㆍ아이디 변경이 불가피한 경우, 회원 탈퇴 후 새로운 아이디로 재가입을 하셔야 합니다. <br/> 
			      &nbsp;&nbsp;&nbsp;&nbsp; (새로운 가입 시, 아이디와 이메일주소가 동일한 계정으로 가입됨.)		</p>
		</div>
		<input type="checkbox" name="accordion" id="answer16"> <label
			for="answer16">Q. [회원탈퇴] 강제탈퇴가 될 수도 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 타인의 정보를 도용하여 가입하거나, 부정한 용도 또는 영리를 추구할 목적으로 휴고 서비스를 이용하는 경우 <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 휴고 이용약관에 따라 강제로 회원자격을 박탈하여 탈퇴 시킬 수 있습니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 위의 내용 외에도 이용약관에 위배되는 행위가 있는 경우에도 강제로 탈퇴 될 수 있습니다.
			</p>
		</div>
		<input type="checkbox" name="accordion" id="answer17"> <label
			for="answer17">Q. [고객센터] 1:1문의로 문의한 내역은 어디서 확인할 수 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 고객센터 > 1:1문의내역 에서 문의 내용과 답변 내역을 함께 확인하실 수 있습니다.</p>
		</div>
		<input type="checkbox" name="accordion" id="answer18"> <label
			for="answer18">Q. [회원가입] 여러 개의 아이디를 사용할 수 있나요?<em></em></label>
		<div>
			<p><b>&nbsp;&nbsp;A.</b> 회원가입시 가입확인 절차를 거친 본인의 명의로 하나의 아이디만을 사용하실 수 있습니다. <br/>
			      &nbsp;&nbsp;&nbsp;&nbsp; 이미 가입된 회원 아이디를 잊어버리신 경우 로그인 > 아이디찾기 에서 확인이 가능합니다.</p>
		</div>

	</div>
</body>
</html>
