<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%
	// session을 얻어오는 두가지 방법
	// 1. 내장객체 session을 통해 getAttribute로 접근  
	Object oLogin = session.getAttribute("login");
	// 2. request소속의 getSession()으로 
	// request.getSession();
	MemberDto mem = null;
	%>	



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

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>