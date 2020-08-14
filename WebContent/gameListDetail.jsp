<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>

<% String src = request.getParameter("Link"); %>
<% System.out.println(src); %>

<img src=<%=src %> width="100%">

</body>
</html>