<%@page import="dto.EpilogueDto"%>
<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script>
<title>epilogue answer Af</title>
</head>
<body>
<%
EpilogueDao dao = EpilogueDao.getInstance();
boolean isS = dao.epilogueReply(seq, new EpilogueDto(id, title, content));
if(isS){
	%>
		<script type="text/javascript">
		alert("답글 입력 성공!");
		location.href = "epiloguelist.jsp";
		</script>
	<%
}else{
	%>
		<script type="text/javascript">
		alert("답글 입력 실패");
		location.href = "epiloguelist.jsp";
		</script>
	<%
}
%>
</body>
</html>






