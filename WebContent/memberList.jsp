<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   List<MemberDto> list =  (List<MemberDto>)request.getAttribute("memList");

   int len = (int)request.getAttribute("len");
   int memPage = len / 10; // 예: 22개의 글 → 3페이지
   if (len % 10 > 0) {
      memPage = memPage + 1;
   }
   int pageNum = (int)request.getAttribute("page");
   String pItem = (String)request.getAttribute("item");
   String pSort = (String)request.getAttribute("sort");
   System.out.println("pSort: " + pSort );
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style type="text/css">
<%-- @import url(https://fonts.googleapis.com/css?family=Lato:100,300,900);  --%>
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
   color: white;
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

<%-- asideBox --%>
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

<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">관리자　|　 회원 정보</p>
</div>






<!-- 메인 페이지 -->
<div align = "center" class="container" style="max-width: 900px">

<input type="hidden" id="pItem" value='<%=pItem %>'>
<input type="hidden" id="pSort" value='<%=pSort %>'>


<table class="table">
   <!-- <col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100"> -->
   <thead class="thead-dark">
   <tr>
      <!-- 정렬메뉴 상단 이동 CSS 포함-->
      <td colspan="6" align="left">
      
         <select id="sort" class="serchSelect" style="vertical-align: bottom;">
               <option value="choice">정렬</option>
               <option value="name">이름</option>
               <option value="rdate">가입일</option>   
         </select>
      <div class="btn-group">
         <button onclick="sortAsc()"  class="btn btn-outline-info">오름차순</button>
         <button onclick="sortDesc()" class="btn btn-outline-info">내림차순</button>
      </div>
      </td>
   </tr>
   
   
   <tr>
      <th>User ID</th><th>Name</th><th>E-mail</th><th>Group</th><th>Join Date</th><th>Detail</th>
   </tr>
   </thead>
   
   <tbody>
   <%    
   for (int i = 0; i < list.size(); i++) {
      MemberDto mem = list.get(i);

      if (mem.getDel() != 1) {
         if(mem.getAuth() == 1){
   %>
   <tr style="background-color: #ffe596">
      <%
         }else{
      %>
   <tr>
      <%
         }
      %>   
      <th scope="row" align="center"><%= mem.getId()%></th>
      <td><%=mem.getName() %></td>
      <td><%=mem.getEmail() %></td>
      <td><%if (mem.getAuth() == 1 ){ %> 관리자 
         <%}else{ %> 회원 <%} %></td>
      <td><%=mem.getRegdate().substring(0, 10) %></td>   
      <td><%-- <a href="auth?command=getMemDetail&page=0&id=<%=mem.getId() %>">상세보기</a>    --%>
      <button type="button" class="btn btn-light" onclick="location.href='auth?command=getMemDetail&page=0&id=<%=mem.getId() %>'">상세보기</button></td>
   </tr>
   </tbody>
<%
      }
   }   
%>
</table>
 
<!-- css 추가 전 -->
<%--
   <div align="center">
      <%
         for (int i = 0; i < memPage; i++) { // [1][2[3]]
            if (pageNum == i) { // 현재 페이지
      %>
      <span style="font-size: 15pt; color: #0000ff; font-weight:bold;">
         <%=i + 1%>
      </span> &nbsp;
      <%
         } else { // 그 외의 페이지
      %>
      <a href="#none" title="<%=i + 1%> 페이지" onclick="goPage(<%=i%>)"
         style="font-size: 15pt; color: #000; font-weight: bold;"> [<%=i + 1%>]
      </a>&nbsp;
      <%
         }
      }
      %>
   </div>
 --%>


<!-- 페이징 css 추가 -->
<ul class="pagination justify-content-center" style="margin:20px 0">
<% for(int i = 0;i < memPage; i++) {      // [1] 2 [3]
   if(pageNum == i) { // 현재 페이지   %>         
      <li class="page-item active">
         <a class="page-link" href="#">
            <%=i + 1 %>
         </a>
      </li>
      
<%    } else {   // 그 외의 페이지    %>
      <li class="page-item">
         <a class="page-link" href="#" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
            <%=i + 1 %>
         </a>
      </li>
<%      
   }
}
%>
</ul>   

<div>
   <select id="item" class="serchSelect">
         <option value="choice">선택</option>
         <option value="id">아이디</option>
         <option value="name">이름</option>
   </select>
   <input type="text" id="searchWord" placeholder="검색어를 입력해주세요" class="serchText" >
   <button type="button" onclick="search()" class="btn btn-outline-dark" style="vertical-align: bottom;">검색</button>
</div>

</div>

<br><br><br><br>


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

function goPage( pageNum) {
   //alert("pageNum:" + pageNum);
   var pItem = $("#pItem").val();
   var pSort = $("#pSort").val();
   location.href = "auth?command=getMemlist&pageNum=" + pageNum + "&item=" + pItem + "&sort=" + pSort;
}

function sortAsc(){
   var sort = $("#sort").val();
   if(sort == "name"){
      location.href="auth?command=getMemlist&pageNum=0&item=name&sort=asc";
      
   }else if(sort == "rdate"){
      location.href="auth?command=getMemlist&pageNum=0&item=rdate&sort=asc";
   }else if(sort == "choice"){
      alert("정렬하실 카테고리를 선택해주세요");
   }
}

function sortDesc(){
   var sort = $("#sort").val();
   // alert(sort);
   if(sort == "name"){
      location.href="auth?command=getMemlist&pageNum=0&item=name&sort=desc";
   }else if(sort == "rdate"){
      location.href="auth?command=getMemlist&pageNum=0&item=rdate&sort=desc";
   }else if(sort == "choice"){
      alert("정렬하실 카테고리를 선택해주세요");
   }
}
function search(){
   var item = $("#item").val();
   var searchWord = $("#searchWord").val();
   if(item == "choice"){
   
      alert("찾으실 카테고리를 선택해주세요");
   }else{
      if(searchWord == null || searchWord == ""){
         alert("검색어를 입력해주세요");
      }else{   
         location.href="auth?command=searchList&page=0&item=" + item + "&searchWord=" + searchWord;
      }
   }
}


</script>
</body>
</html>