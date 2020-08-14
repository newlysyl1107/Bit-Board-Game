<%@page import="dto.EpilogueDto"%>
<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

</head>
<body>
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("ir1");

if(content.equals("<p>&nbsp;</p>")){
	content="";
}

System.out.println("id:" + id);
System.out.println("title:" + title);
System.out.println("content:" + content);

if(title == null || title == "" || content == "" || content == null){
%>
	<script type="text/javascript">
	alert("제목과 내용을 모두 작성해 주세요");
	location.href = "epiloguewrite.jsp";
	</script>
	<%
}else{
%>
<%
EpilogueDao dao = EpilogueDao.getInstance();

boolean isS = dao.writeEpilogue(new EpilogueDto(id, title, content));



if(isS){
	%>
	<script type="text/javascript">
	alert("글쓰기 성공!");
	location.href = "epiloguelist.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("후기를 작성 하십시오");
	location.href = "epiloguewrite.jsp";
	</script>
	<%
}
}
%>
</body>
</html>




