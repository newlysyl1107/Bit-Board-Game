<%@page import="member.MemberDao"%>
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>

<h1>Index 페이지</h1>


<% DBConnection.initConnection(); %>

<%--
<a href="adminServlet?command=tableCheck">테스트용 어드민 테이블</a> <br><br>

  response.sendRedirect("./auth?command=adminMain"); 
<a href="main.jsp">메인으로</a>

--%>


<%  response.sendRedirect("main.jsp"); %>






</body>
</html>