<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>epiloguedelete.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

</head>
<body>

<%
int seq = Integer.parseInt( request.getParameter("seq") );
System.out.println("seq:" + seq);

EpilogueDao dao = EpilogueDao.getInstance();
boolean isS = dao.deleteEpilogue(seq);

if(isS){
	%>
	<script type="text/javascript">
	alert("삭제하였습니다");
	location.href = 'epiloguelist.jsp';
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = 'epiloguelist.jsp';
	</script>	
	<%
}
%>

</body>
</html>







