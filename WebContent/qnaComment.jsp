<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	QnaDto dto = (QnaDto)request.getAttribute("qnaDto"); 
	MemberDto mem = (MemberDto)session.getAttribute("login");

%>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<h1>댓글 작성 페이지</h1>

<div align="center">
<form action="">
	<table border="1">
	<col width="150"><col width="600">
	<tr>	
		<th>아이디</th>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>	
		<th>작성일</th>
		<td><%=dto.getWdate().substring(0, 13) %>시 <%=dto.getWdate().substring(14, 16) %>분</td>
	</tr>
	<tr>	
		<th>조회수</th>
		<td><%=dto.getReadcount() %> 회</td>
	</tr>
	<tr>	
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>	
		<th>내용</th>
		<td>
			<textarea rows="15" cols="80" readonly="readonly"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	</table> 
</form>
</div>


<hr>



<div align="center">
<form action="qnaServlet?action=commentAf" method="post">
	<input type="hidden" name="qnaSeq" value="<%=dto.getSeq()%>">
	<input type="hidden" name="commId" value="<%=dto.getId()%>">
		
	<table border="1">
	<col width="130"><col width="500"><col width="100">
		<%-- 
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" readonly="readonly" size="60"
					value="<%=mem.getId() %>">
			</td>
		</tr>
		 --%>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="2" cols="70" name="commContent" placeholder="댓글" required></textarea>
			</td>
			<th>
				<input type="submit" value="댓글추가">
			</th>
		</tr>
	</table>
</form>

</div>

</body>
</html>