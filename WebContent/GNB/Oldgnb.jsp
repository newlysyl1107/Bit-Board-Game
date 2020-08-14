<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<!-- 
	<meta name="viewport" content="width=device-width", initial-scale="1">

width 속성은 뷰포트의 크기를 조정한다. 특정한 숫자를 사용해 width=600라고 할 수도 있고 device-width와 같은 특정한 값을 사용할 수도 있는데, device-width는 100% 스케일에서 CSS 픽셀들로 계산된 화면의 폭을 의미한다. (뷰포트의 높이에 따라 크기와 위치가 변하는 요소들로 이루어진 페이지의 경우 상응하는 height와 device-height 값들이 유용하게 사용될 수 있다.)
initial-scale 속성은 페이지가 처음 로드될 때 줌 레벨을 조정한다. maximum-scale, minimum-scale, 그리고 user-scalable 속성들은 사용자가 얼마나 페이지를 줌-인, 줌-아우트 할 수 있는지를 조정한다. 
-->
	<title>Insert title here</title>
	
	
	
	<!-- CDN 링크 주석처리 -->
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
	<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
	
	
	<style type="text/css">
	.navbar.navbar-expand-sm.bg-dark.navbar-dark {
		height: 50px;
	}
	
	.navbar.navbar-expand-sm.bg-success.navbar-dark{
		height: 50px;background-color: #004eff !important;
	}
	
a {color: #000000;}
a:hover {text-decoration: none; color: #000000;}

th, td{text-align:center;vertical-align: middle !important;}
	
	</style>
	



<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
		
	}else {
		mem = (MemberDto)oLogin;
	}
%>	


<header>
	<div align="center">
		<a class="navbar-brand" href="./main.jsp"><img src="./GNB/logo.png" width="180px" height="180px"></a>
	</div>


<!-- <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand-sm bg-success navbar-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="./notice.jsp">공지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./gameList.jsp">게임목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./reservation.jsp">예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./epiloguelist.jsp">후기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./mapEx.jsp">위치</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="qnaServlet?action=list">Q & A</a>
      </li>
      
      <% if(oLogin != null) { %>
      	<%if(mem.getAuth() == 1) {%>
	      <li class="nav-item">
	        <a class="nav-link" href="./admin.jsp">관리자</a>
	      </li>
      	<% } %>
      <% } %>
      
    </ul>
    
    <form class="form-inline my-2 my-lg-0">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="./GNB/people.png" width="50px" height="40px">
        </a> 
        <% if(oLogin == null) { %>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./login.jsp">로그인</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="addmember?command=add">회원가입</a>
        </div>
        <% }else { %>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./personalInfo.jsp">내정보</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="login?command=logout">로그아웃</a>
        </div>	
        <% } %>
      </li>
    </ul>
    <span class="navbar-text">
    	<% if(oLogin == null) { %>
    		반갑습니다. 게스트님.
    	<% }else { %>
    		반갑습니다. <%=mem.getName() %>님.
    	<% } %>
	      
	    </span>
    </form>
  </div>
</nav>
</header>


<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- CDN 이용시 추가 -->
<!--
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> 
-->

</body>
</html>