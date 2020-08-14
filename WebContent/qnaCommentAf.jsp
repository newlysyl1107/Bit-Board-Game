<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("isS");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>


<%
if(str.equals("true")){
%>
	<script type="text/javascript">
		alert("댓글이 추가 되었습니다.")
		//location.href = "qnaServlet?action=comment";
	</script>	
<%
} else {
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다")
		location.href = "qnaServlet?action=write";
	</script>
<%
}
%>
</body>
</html>