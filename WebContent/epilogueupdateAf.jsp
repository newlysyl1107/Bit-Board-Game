<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bit Board Game</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<script>
$(document).ready(function(){
	$("#save").click(function(){		
		alert("save click");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		alert(document.getElementById("ir1").value);
		$("#frm").submit();		
	})
})
</script>


</head>
<body>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String title = request.getParameter("title");
String content = request.getParameter("ir1");

EpilogueDao dao = EpilogueDao.getInstance();
boolean isS = dao.updateEpilogue(seq, title, content);
System.out.println("boolean isS" + isS);

if(isS == true){
	%>
	<script type="text/javascript">
	alert("글 수정 성공");
	location.href = "epiloguelist.jsp";
	</script>	
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글 수정 실패");
	location.href = "epiloguelist.jsp";
	</script>
	<%
}	
%>

</body>
</html>





