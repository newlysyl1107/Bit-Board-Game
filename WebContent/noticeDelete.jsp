<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>

<%
String command = request.getParameter("command");
%>

<%
if(command.equals("deleteAf")) {
	String sisS = request.getParameter("isS");
	System.out.println("String boolean = " + sisS);
	boolean isS = Boolean.parseBoolean(sisS);
	
	System.out.println("boolean = " + isS);
	
	if(isS == true) {
%>
<script>
	alert("삭제되었습니다.");
	location.href="noticeList?command=page&pageNumber=0";
</script>
<%
	} else {
%>
<script>
	alert("삭제에 실패했습니다.");
	location.href="notice.jsp";
</script>
<%
	}
	}
%>


</body>
</html>