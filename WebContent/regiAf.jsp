<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div>
<%-- GNB --%>
<header>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>
</header>
<br><br><br>

<%--페이지 시작. --%>
<div align="center" class="container">
   <br><p class="subject">회원가입에 성공하였습니다</p>
   <br><p class="subject">잠시 후 로그인 페이지로 이동합니다</p>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>

<script type="text/javascript">
setTimeout(function() {
	 location.href="login?command=login";
	}, 3000);

</script>

</body>
</html>