<%@ page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if (oLogin == null) {
%>

	<h4 align="right" style="background-color: #f0f0f0">
		환영합니다, 게스트님
	</h4>
<%
	}else {
	mem = (MemberDto) oLogin;
%>
	<h4 align="right" style="background-color: #f0f0f0">
		환영합니다,
		<%=mem.getId()%>님
	</h4>
<%
	}
%>


<div align="center">
	<table border="1">
		<tr>
			<th><a href="./main.jsp">로고</a></th>
			<th><a href="./notice.jsp">공지</a></th>
			<th><a href="./gameList.jsp">게임목록</a></th>
			<th><a href="./reservation.jsp">예약</a></th>
			<th><a href="./epilogue.jsp">후기</a></th>
			<th><a href="./map.jsp">위치</a></th>
			<th><a href="./qna.jsp">Q&A</a></th>
			<th><a href="./admin.jsp">관리자</a></th>
			<%
			if (oLogin == null) {
			%>
			 	<th><a href="./login.jsp">로그인</a></th>
			<% 
			}
			%>
		</tr>
	</table>
	<hr>
</div>


</body>
</html>