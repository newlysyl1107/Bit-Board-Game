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
		alert("QnA가 수정 되었습니다.")
		location.href = "qnaServlet?action=list";
	</script>	
<%
} else {
%>
	<script type="text/javascript">
		alert("수정에 실패하였습니다.")
		location.href = "qnaServlet?action=update";
	</script>
<%
}
%>
</body>
</html>