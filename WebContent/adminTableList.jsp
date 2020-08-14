<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.css">


<style type="text/css">
#sidebox { background-color:rgba(0,0,75,.4); 
		   position:absolute; 
		   width:12%; 
		   top:150px; 
		   left:85%; 
		   padding: 3px 10px;
}
#sidebox2 { background-color:rgba(0,0,75,.4); 
			position:absolute; 
			width:12%; 
			top:150px; 
			left:1200px; 
			padding: 3px 10px;
			display:none;
}
.sidemenu a:hover{
   text-decoration:none !important;
   color : white;
  -webkit-transform: scale(1.10);
     -moz-transform: scale(1.10);
      -ms-transform: scale(1.10);
       -o-transform: scale(1.10);
          transform: scale(1.10);  
}

.sidemenu a {
     padding: 10px;
     text-transform: uppercase;
     color: white;
     text-decoration: none;
     position: relative;
     display: block;
       -webkit-transition: all 0.1s linear;
          transition: all 0.1s linear;
}


.badge.badge-success{font-size: 12pt;width: 130px}
.badge.badge-secondary{font-size: 12pt;width: 130px}



td {text-align: center}

</style>

</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
   $("#gnb").load("./GNB/gnb.jsp");
})
</script>

<div id="sidebox" align="center"> 
	<div id="mainPg" class="sidemenu" style="font-size:1.3em;" ><a href="./auth?command=adminMain">관리자 메인</a></div>
	<div class="sidemenu" ><a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원관리</a></div>
	<div class="sidemenu"><a href="authRev?command=curRev">예약관리</a></div>
	<div class="sidemenu"><a href="authRev?command=pastRev">지난예약</a></div>
	<div class="sidemenu"><a href="auth?command=noAnswer">미응답 Q&A</a></div>
	<%--<div class="sidemenu"><a href="#">게임관리</a></div>  --%>
	<div class="sidemenu"><a href="auth?command=tableCheck">테이블관리</a></div>
	<hr>
	<div class="sidemenu"><a href="#">맨 위로</a></div>
</div>

<%   //계정 검증
   Object oLogin = session.getAttribute("login");
   MemberDto mem = null;
   if(oLogin == null) {
%>
      <script type="text/javascript">   // TODO 나중에 서블릿으로 교체할 것.
         alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
         location.href = "main.jsp"   
      </script> 
<%   
   }else {
      mem = (MemberDto)oLogin;
      if(mem.getAuth() == 1) {
         //관리자 맞음.
      }else {
%>   
         <script type="text/javascript">   // TODO 나중에 서블릿으로 교체할 것.
            alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
            location.href = "main.jsp"   
         </script> 
<%            
      }   
   }
%>   

<% List<TableDto> list = (List<TableDto>)request.getAttribute("TableList"); //테이블 호출 %>
<% int[] originalPK = null;  %>


<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">관리자　|　테이블 현황</p>
</div>


<div align="center" class="container" style="max-width: 800px">
<!-- <div style="float:left;"> -->

<table border="1" class="table">
<col width="250"><col width="250"><col width="250">

<thead class="thead-dark">
<tr style="text-align: center;">
   <th>테이블 번호</th>
   <th>수용 가능 인원</th>
   <th>테이블 종류</th>
</tr>
</thead>


<% if(list.size() < 1 || list == null) { //테이블에 아무것도 없는 경우 %>   
   <h3>표기할 내용이 없습니다.</h3>

<% }else {  %>
   <% originalPK = new int[list.size()]; %>
   
   <% for(int i = 0; i < list.size(); i++){ %>
      <tr>
   
      <% TableDto dto = list.get(i); %>
      
      <% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
      <td style="font-weight: bold; padding: 0.4rem"><%=dto.getTablenumber()%> 번</td>
      <td style="font-weight: bold; padding: 0.4rem"><%=dto.getNumberpeople()%> 인</td>
      <td style="padding: 0.4rem"> 
         <%
         if (dto.getIsreserbaitiontable() == 1) {
         %>
         <span class="badge badge-success">예약용 테이블</span>      
         <% } else {   %>
         <span class="badge badge-secondary">일반 테이블</span>
         <% } %> 
         
      </td>

      </tr>
   <% } %>
<% } %>
</table>


<div class="btn-group" role="group" aria-label="Basic example">

<input type="button" class="btn btn-secondary" onclick="location.href='AdminTable?command=update'" value="　수정　">
<input type="button" class="btn btn-secondary" onclick="location.href='AdminTable?command=delete'" value="　삭제　">
<input type="button" class="btn btn-secondary" onclick="location.href='AdminTable?command=back'" value="뒤로가기">

</div>

</div>

<br><Br><br><br>

<footer id="ft">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>



<script type="text/javascript">

var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { 
   var position = $(window).scrollTop();
   $("#sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
});

$(window).resize(function (){
    var width_size = window.outerWidth;
    
    if (width_size <= 800) {
       $("#sidebox").attr("id","sidebox2");
    }else {
       $("#sidebox2").attr("id","sidebox");
    }
});
</script>

</body>
</html>