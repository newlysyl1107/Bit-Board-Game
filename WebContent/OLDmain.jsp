<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<style type = "text/css">
@import url('https://fonts.googleapis.com/css?family=Indie+Flower');
@import url('https://fonts.googleapis.com/css?family=Amatic+SC');

body {
	/* font-family: 'Indie Flower', cursive !important; */
  background-image: url("background.jpg"); /*CAPE HONEY*/
	margin: 0px;
	padding: 0px;
}

::selection {
	background: transparent;
}

h4 {
	font-size: 26px;
	line-height: 1px;
	/* font-family: 'Amatic SC', cursive !important; */
}

.color1{color:#382746;
		margin-left: 32px;
		font-size: 30px;}			/*MOUNTAIN MEADOW*/
.color2{color:#4a2e61;
		margin-left: 32px;
		font-size: 63px;
		font-style:bold;}		/*TALL POPPY*/


.card {
	color: #013243; /*SHERPA BLUE*/
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 400px;
	background: #e0e1dc;
	transform-style: preserve-3d;
	transform: translate(-50%,-50%) perspective(2000px);
	box-shadow: inset 300px 0 50px rgba(0,0,0,.5), 20px 0 60px rgba(0,0,0,.5);
	transition: 1s;
}

.card:hover {
	transform: translate(-50%,-50%) perspective(2000px) rotate(15deg) scale(1.2);
	box-shadow: inset 20px 0 50px rgba(0,0,0,.5), 0 10px 100px rgba(0,0,0,.5);
}

.card:before {
	content:'';
	position: absolute;
	top: -5px;
	left: 0;
	width: 100%;
	height: 5px;
	background: #BAC1BA;
	transform-origin: bottom;
	transform: skewX(-45deg);
}

.card:after {
	content: '';
	position: absolute;
	top: 0;
	right: -5px;
	width: 5px;
	height: 100%;
	background: #92A29C;
	transform-origin: left;
	transform: skewY(-45deg);
}

.card .imgBox {
	width: 100%;
	height: 100%;
	position: relative;
	transform-origin: left;
	transition: .7s;
}

.card .bark {
	position: absolute;
	background: #e0e1dc;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: .7s;
}

.card .imgBox img {
	min-width: 250px;
	max-height: 400px;
}

.card:hover .imgBox {
	transform: rotateY(-135deg);
}

.card:hover .bark {
	opacity: 1;
	transition: .6s;
  box-shadow: 300px 200px 100px rgba(0, 0, 0, .4) inset;
}

.card .details {
	position: absolute;
	top: 0;
	left: 0;
	box-sizing: border-box;
	padding: 0 0 0 10px;
	z-index: -1;
	margin-top: 70px;
}

.card .details p {
	font-size: 15px;
	line-height: 5px;
	transform: rotate(-10deg);
	padding: 0 0 0 20px;
}

.card .details h4 {
	text-align: center;
}

.text-right {
	text-align: right;
}
</style>
</head>
<body>


<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>


<!-- GNB 부분 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->

<%
	// session을 얻어오는 두가지 방법
	// 1. 내장객체 session을 통해 getAttribute로 접근  
	Object oLogin = session.getAttribute("login");
	// 2. request소속의 getSession()으로 
	// request.getSession();
	MemberDto mem = null;
	%>	


<%--
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="./main.jsp"><img src="./GNB/icon.png" width="50px" height="50px"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="./notice.jsp">공지<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./gameList.jsp">게임목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./resetvation.jsp">예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./epilogue.jsp">후기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./map.jsp">위치</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./qna.jsp">Q & A</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./admin.jsp">관리자</a>
      </li>
     
  <%     if (oLogin == null) { %>
  	  <li class="nav-item  form-inline my-2 my-lg-0">
        <a class="nav-link" href="./login.jsp">로그인</a>
      </li>
      <%} else { %>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          내정보
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login?command=logout">로그아웃</a>
          <a class="dropdown-item" href="personalInfo.jsp">내정보 보기</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">추가사항</a>
        </div>
      </li>
      <% } %> 
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
   
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
 --%>


<!-- 본문 부분!!!!!!! -->
<div style="padding-top: 400px">
	<div class="card">
		<div class="imgBox">
			<div class="bark"></div>
			<img src="imgmain.png">
		</div>
		<div class="details" align = "center">
			<br><br>
			<h4 class="color1" align = "center">Your Boardgame</h2>
			<br><br><br><br><br>
			<h4 class="color2 margin" align = "center"> Enjoy!</h3>
			<br><br>
			<!-- <p>Dear Dad,</p>
			<p>Let's see.. .</p>
			<p class="text-right">Happy Birthday, papa!</p>
			<p class="text-right">♥Sarah</p> -->
		</div>
	</div>
</div>

</body>
</html>