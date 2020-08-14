<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<style type = "text/css">

<%--
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
--%>

body {
  font-family: "Century Gothic", "Lato", sans-serif;
  z-index: 3;
}

a {
  text-decoration: none;
}

.et-hero-tabs,
.et-slide {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 130px;
  position: relative;
  /* background: #eee; */
  text-align: center;
  padding: 0 2em;
  z-index: 3;
}
.et-hero-tabs h1,
.et-slide h1 {
  font-size: 2rem;
  margin: 0;
  letter-spacing: 1rem;
  z-index: 3;
}
.et-hero-tabs h3,
.et-slide h3 {
  font-size: 1rem;
  letter-spacing: 0.3rem;
  opacity: 0.6;
  z-index: 3;
}

.et-hero-tabs-container {
  display: flex;
  flex-direction: row;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 70px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: #fff;
  z-index: 10;
  position:absolute;
 	top:20px;
 	z-index: 3;
}
.et-hero-tabs-container--top {
  position: fixed;
  top: 0;
  z-index: 3;
}

.et-hero-tab {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  color: #000;
  letter-spacing: 0.1rem;
  transition: all 0.5s ease;
  font-size: 0.8rem;
  z-index: 3;
  
}
.et-hero-tab:hover {
  color: white;
  background: rgba(102, 177, 241, 0.8);
  transition: all 0.5s ease;
  z-index: 3;
}

.et-hero-tab-slider {
  position: absolute;
  bottom: 0;
  width: 0;
  height: 6px;
  background: #66B1F1;
  transition: left 0.3s ease;
  z-index: 3;
}

@media (min-width: 800px) {
  .et-hero-tabs h1,
.et-slide h1 {
    font-size: 3rem;
    z-index: 3;
  }
  .et-hero-tabs h3,
.et-slide h3 {
    font-size: 1rem;
    z-index: 3;
  }

  .et-hero-tab {
    font-size: 1rem;
    z-index: 3;
  }
}






.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  z-index:99 !important;
  
}

.dropdown {
  align : right;
  position: relative;
  display: inline-block;
  z-index:99 !important;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #e8e8e8;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 99 !important;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  z-index:1 !important;
}

.dropdown-content a:hover {background-color: #ddd; z-index:1 !important;}

.dropdown:hover .dropdown-content {display: block; z-index:1 !important;}

.dropdown:hover .dropbtn {background-color: #3e8e41; z-index:1 !important;}


</style>
</head>
<body>

<%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
		
	} else {
		mem = (MemberDto)oLogin;
	}
%>
<div style="padding-left:calc(90% - 120px); padding-top:15px">
	<div align = "right" class="dropdown">
	<img class = "dropImage" src = "./GNB/people.png" style = "width:40px; height: 33px;">
	<div class = "dropdown-content">
	<% if(oLogin == null) { %>
		<a href = "main.jsp"> 메인으로 </a>
		<hr>
		<a href = "login.jsp"> 로그인 </a>
		<a href = "addmember?command=add"> 회원가입 </a>
	<% } else { %>
		<a href = "main.jsp"> 메인으로 </a>
		<hr>
		<a href = "personalInfo.jsp"> 내정보 </a>
		<a href = "login?command=logout"> 로그아웃 </a>
		<% if (mem.getAuth() == 1) { %>
		<hr>
		<a href = "auth?command=adminMain"> 관리자 페이지 </a>
		<% } %>
	<% } %>
		
	</div>
	<% if(oLogin == null) { %>
		안녕하세요, <font color="ff7a14"><b>Guest</b></font>님
	<% } else { %>
		
		안녕하세요, <font color="ff7a14"><b><%=mem.getName() %></b></font>님
	<% } %>
	
	</div>
</div>


<section class="et-hero-tabs">
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="noticeList?command=page&pageNumber=0">NOTICE</a>
      <a class="et-hero-tab" href="gameList.jsp">GAME LIST</a>
      <a class="et-hero-tab" href="reservation.jsp">RESERVATION</a>
      <a class="et-hero-tab" href="epiloguelist.jsp">EPILOGUE</a>
      <a class="et-hero-tab" href="qnaServlet?action=list">Q&A</a>
      <a class="et-hero-tab" href="map.jsp">DIRECTION</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </section>
</body>
</html>