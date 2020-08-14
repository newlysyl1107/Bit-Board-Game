<%@page import="dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
</head>
<body>

<%
	NoticeDto dto = (NoticeDto)request.getAttribute("dto");
	boolean isS = (boolean)request.getAttribute("isS");
%>


<%
	System.out.println("UpdateAFTER.jsp isS = " + isS);
	
	if(isS == true) {
	
%>

<input type= "hidden" id = "content" value = "<%=dto.getContent() %>">
<input type = "hidden" id = "title" value = "<%=dto.getTitle() %>">

<script>
	alert("수정되었습니다.");
	location.href="noticeDetail?command=detail&seq=<%=dto.getSeq() %>";
</script>
<% 
	} else {
%>

<script>
	var content = $("#content").val();
	var title = $("#title").val();
	
	alert("수정에 실패했습니다.");
	location.href="noticeUpdate?seq=" + <%=dto.getSeq() %> + "&command=noticeUpdate&title=" + title + "&content=" + content;
</script>

<%
	}
%>


</body>
</html>