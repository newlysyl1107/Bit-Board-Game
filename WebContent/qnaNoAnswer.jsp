<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 미응답 건 담은 리스트 
List<QnaDto> list = (List<QnaDto>)request.getAttribute("noAnswerList");

/* 페이징 시작 */
//총 게시글의 갯수
int pageNumber = (int)request.getAttribute("pageNum");
System.out.println("관리자페이지에서 pageNumber : " + pageNumber);
//총 게시글의 갯수에 따른 페이지의 갯수
int allCount = (int)request.getAttribute("allCount");
System.out.println("allcount : " + allCount);


int qnaPage = allCount / 15;   // 예: 22개의 글 -> 3페이지
if(allCount % 15 > 0){
   qnaPage = qnaPage + 1;
}

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

th {text-align: center;}
.badge.badge-secondary {display: unset; padding:0.3em 0.8em; vertical-align: bottom;}
.badge.badge-warning {color:#fff; background-color:#ff7307; display: unset; padding:0.3em 0.8em; vertical-align: bottom;}
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
<br><p class="subject">관리자　|　미응답 질문</p>
</div>





<div align="center" class="container">
<table class="table" style="max-width: 1000px">
<col width="50"><col width="100"><col width="300"><col width="100"><col width="100"><col width="150">
<thead class="thead-dark">
<tr style="text-align: center;">
   <th>번호</th><th>글 구분</th><th>제목</th><th>글쓴이</th><th>진행</th><th>작성일</th>
</tr>
</thead>
<% if(list == null || list.size() == 0){ %>
   <tr>
      <td colspan="6">모든 질의에 응답을 완료하였습니다.</td>
   </tr>
<% } else {
   for(int i = 0;i < list.size(); i++){
      QnaDto dto = list.get(i);
   %>
   <tr>
      <th style="text-align: center;"><%=dto.getSeq() %></th>
      
      <%-- 글 구분 --%>
      <% if(dto.getIs_secret() == 0) { %>
         <td align="center">공개</td>
      <% } else { %>
         <td align="center">비공개</td>
      <% } %>
      
      
   <% if(dto.getDel() == 0) { %>   
         <td>
         
            <!-- style="text-decoration:none" -->
            <a href='#' onclick="goDetail(<%=dto.getSeq() %>, <%=pageNumber%>)" ><%=dto.getTitle() %></a>
            
            
         </td>       
   <% } else { %>
          <td>
             <a href='#' onclick="goDetail(<%=dto.getSeq() %>, <%=pageNumber%>)" ><%=dto.getTitle() %><font color="#ff0000"> (삭제 된 글)</font></a>
             
          </td> 
   <% } %>   
       
      <%-- 작성자 ID --%>     
      <td align="center"><%=dto.getId() %></td>
      
      <%-- 답변상태 --%>
      <% if(dto.getIs_answer() == 0) {
            if(dto.getId().equals("aa") || dto.getId().equals("admin")) { %>
               <td align="center"><h6><span class="badge badge-warning">공지 글</span></h6></td>
            
            <%} else {%>
            <td align="center"><h6><span class="badge badge-secondary">답변대기</span></h6></td>      
            <% } 
         }%>
      
      <%-- 작성일 --%>
      <%-- <td align="center"><%=dto.getWdate().substring(0,10) %></td> --%>
         
      <td align="center"><%=dto.getWdate().substring(0,16) %></td>
      
      

   </tr>
   <%
   } // list의 for문 끝
}

%>
</table>
<!-- <input type="button" onclick="location.href='qnaWrite?action=write'" value="등록하기"> -->


<%-- 페이징에 대한 뷰 처리 --%>
<ul class="pagination justify-content-center" style="margin:20px 0">
<% for(int i = 0;i < qnaPage; i++) {      // [1] 2 [3]
   if(pageNumber == i) { // 현재 페이지   %>         
      <li class="page-item active">
         <a class="page-link" href="#">
            <%=i + 1 %>
         </a>
      </li>
      
<%    } else {   // 그 외의 페이지    %>
      <li class="page-item">
         <a class="page-link" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
            <%=i + 1 %>
         </a>
      </li>
<%      
   }
}
%>
</ul>
</div>

<br><br><br><Br>

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


//detail로 가기 
function goDetail( seq, pageNum ) {
   //alert("관리자 pageNum" + pageNum);
   location.href = "qnaServlet?action=detail&seq="+seq+"&pageNum="+pageNum;
}

// 사용자가 보고 있는 페이지 이외의 이동
function goPage( pageNum ) {
    location.href = "auth?command=noAnswer&pageNum="+pageNum;
}

</script>
</body>
</html>