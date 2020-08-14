<%@page import="dto.MemberDto"%>
<%@page import="dto.EpilogueDto"%>
<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

EpilogueDao dao = EpilogueDao.getInstance();
EpilogueDto epilogue = dao.getEpilogue(seq);

request.setAttribute("_epilogue", epilogue);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script>

<title>epilogue answer</title>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

</head>
<body>

<h4>선택한 후기 글</h4>

<div align="center">

<table >
<col width="100"><col width="100"><col width="100"><col width="200"><col width="100"><col width="100">

<tr>
	<th height="50" align="center">작성자</th>
	<td height="50">${_epilogue.id }</td>
	<th height="50" align="center">작성일</th>
	<td height="50">${_epilogue.wdate }</td>
	<th height="50" align="center">조회수</th>
	<td height="50">${_epilogue.readcount }</td>
</tr>
	
<tr>
	<th align="center">제목</th>
	<td colspan="5">${_epilogue.title }</td>
</tr>

<tr align="center">
	<th>내용</th>
	<td colspan="5">
	<div style="overflow:scroll; width:700px; height:400px;" image="visible" name="content"
				readonly="readonly">${_epilogue.content }</div>

	</td>
</tr>
</table>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<h4 align="left">댓글</h4>

<form action="epilogueanswerAf.jsp" method="post">
<input type="hidden" name="seq" value="${_epilogue.seq }">

<table>
<col width="100"><col width="80"><col width="80"><col width="195"><col width="50">

<tr>
	<th height="50">아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50"
			value="<%=mem.getId() %>">
	</td>
	<th>제목</th>
	<td colspan="1">
		<input type="text" name="title" size="50">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea rows="10" cols="125" name="content"></textarea>
	</td>
	<td colspan="2" align="center">
		<input style="height: 70px; width:100px"  type="submit" value="댓글작성">
		<br>
		<br>
		<input style="height: 30px; width: 60px"  type="button" value="취소" onclick="location.href='epiloguelist.jsp'"/>
				
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>






