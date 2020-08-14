
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

<title>Bit Board Game</title>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
   $("#gnb").load("./GNB/gnb.jsp");
})
</script>
<link rel="stylesheet" href="css/bootstrap.css">


<style type="text/css">
/* table.type02 {
   border-collapse: separate;
   border-spacing: 0;
   vertical-align: center;
   text-align: left;
   line-height: 1.0;
   border-top: 1px solid #ccc;
   border-left: 1px solid #ccc;
   margin: 20px 10px;
}

table.type02 th {
   /* width: 150px; */
   padding: 10px;
   font-weight: bold;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
   border-top: 1px solid #fff;
   border-left: 1px solid #fff;
   background: #eee;
   text-align: center;
}

table.type02 td {
   /* width: 350px; */
   padding: 10px;
   vertical-align: top;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
} */


   table, tr, td {
       border-collapse: separate;
       border-spacing: 0px;
   }
   table {
           width: 100%;
   border-top: 1px solid #eaeaea;
   }
    
    th {
    text-align: center;
   height: 56px;
    color: #6a6a6a;
    padding: 10px;
    background: #f6f6f6;
    border-bottom: 1px solid #eaeaea;
   
    }
   
   td {
   height: 56px;
    color: #545b62;
    padding: 10px;
    background: #ffffff;
    border-bottom: 1px solid #eaeaea;}


</style>



</head>
<body>

<div class="container">
   <br><p class="subject">Epilogue</p>
</div>

<div  align="center"  class="container" style="max-width: 850px">

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
   <td colspan="3">${_epilogue.title }</td>
   <th align="center">글번호</th>
   <td align="center">${_epilogue.seq }</td>
</tr>

<tr align="center">
   <th>내용</th>
   <td colspan="5">
   <div style="overflow:scroll; width:700px; height:400px;" image="visible" name="content"
            readonly="readonly">${_epilogue.content }</div>

   </td>
</tr>
</table>



</div>





<div  align="center"  class="container" style="max-width: 1000px">

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<div class="container">
   <br><p class="subject">Comment</p>
</div>

<form action="epilogueanswerAf.jsp" method="post">
<input type="hidden" name="seq" value="${_epilogue.seq }">

<table>
<col width="100"><col width="150"><col width="80"><col width="150"><col width="50">

<tr>
   <th>아이디</th>
   <td>
      <input type="text" name="id" readonly="readonly" size="10px" class="form-control" value="<%=mem.getId() %>">
   </td>
   <th>제목</th>
   <td colspan="1">
      <input type="text" class="form-control" size="10px" name="title">
   </td>
</tr>

<tr>
   <th>내용</th>
   <td colspan="3">
      <textarea rows="5" cols="100" name="content"></textarea>
   </td>
   <td colspan="2" align="center">
      <input  type="submit" class="btn btn-info" value="댓글작성">
      <br>
      <br>
      <input  type="button" class="btn btn-danger" value="　취소　" onclick="location.href='epiloguelist.jsp'"/>
            
   </td>
</tr>
</table>
</form>
</div>

<br><Br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>


</body>
</html>





