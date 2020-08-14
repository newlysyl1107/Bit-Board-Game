<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>

<%
String command = request.getParameter("command");
String sisS = request.getParameter("isS");
boolean isS = Boolean.parseBoolean(sisS);
System.out.println("isS = " + isS);
%>

<%
if(command.equals("writeAf")) {
	
	if(isS == true) {
	
%>

<script>
	alert("등록되었습니다.");
	location.href="noticeList?command=page&pageNumber=0";
</script>
<% 
	} else {
%>

<script>
	alert("공지사항 작성에 실패했습니다.");
	location.href="noticeWrite?command=write";
</script>

<%
	}
	}
%>


</body>
</html>