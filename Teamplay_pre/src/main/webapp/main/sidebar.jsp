<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>사이드 이벤트바</title>
	<link rel ="stylesheet" href="MainStyle.css?after" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>
	<script type="text/javascript">
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 560) {
			 scrollTop = 560;
			}
			$("#sidebarContainer").stop();
			$("#sidebarContainer").animate( { "top" : scrollTop });
			});
	</script>
</head>
<body>
	<div id="sidebarContainer">
		<div class="sidebarEvent">
			<a href="../eventPage/eventDTL.jsp">
				<img class="sidebarImg" alt="고양이사진" src="../img/cuteCat.jpeg" />
			</a>
		</div>
		<div class="sidebarEvent">
			<a href="../eventPage/couponDTL.jsp">
				<img class="sidebarImg" alt="강아지사진" src="../img/cuteDog.jpeg" />
			</a>
		</div>
		<div class="sidebarEvent">
			<a href="../eventPage/eventDTL.jsp">
				<img class="sidebarImg" alt="고양이사진" src="../img/cuteCat.jpeg" />
			</a>
		</div>
	</div>
</body>
</html>