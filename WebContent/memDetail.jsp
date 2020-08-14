<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   MemberDto mem = (MemberDto)request.getAttribute("dto");


List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("myList");
System.out.println(list.size());

int len = (int)request.getAttribute("len");
int memPage = len / 10; // 예: 22개의 글 → 3페이지
if (len % 10 > 0) {
   memPage = memPage + 1;
}
int pageNum = (int)request.getAttribute("page");


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
.table th , td{text-align: center;}

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
<br><p class="subject">관리자　|　회원 관리</p>
</div>

<br>
<div align="center" class="container" style="max-width: 1000px">
<table  class="table table-striped" style="width: 60%">
   <col width="100"><col width="200">
   <tr>
      <th>아이디</th>
      <td><%=mem.getId() %></td>
   </tr>
   <tr>
      <th>이름</th>
      <td><%=mem.getName() %></td>
   </tr>
   <tr>
      <th>휴대폰 번호</th>
      <td><%=mem.getCall_number() %></td>
   </tr>
   <tr>
      <th>이메일</th>
      <td><%=mem.getEmail() %></td>
   </tr>
   <tr>
      <th>마일리지</th>
      <td><%=mem.getBonuscredit() %>   </td>
   </tr>   
   <tr>
      <th>가입일</th>
      <td><%=mem.getRegdate() %></td>      
   </tr>
</table>
<br>
<table  class="table table-bordered">
   <col width="100"><col width="150"><col width="250"><col width="150"><col width="100"><col width="200"><col width="100">
   <tr>
      <th colspan="7" align="center" style="font-size: 15pt; font-weight: bold;">예약현황</th>
   <tr>
      <th>번호</th><th>예약일</th><th>예약시간</th><th>테이블넘버</th><th>인원수</th><th>메모</th><th>예약관리</th>
   </tr>
   <% if(list.size() == 0){
   %>
   <tr>   
      <td colspan="7" align="center">예약이 없습니다</td>
      
   </tr>   
   <%   
   }else{
      for( int i = 0; i < list.size(); i++){ 
         String rdate = list.get(i).getRdate();
      %>
      <tr>
         <td><%=i + 1 %></td><td><%=rdate.substring(0, 10) %></td>
         <td><%=list.get(i).getStarttime()%>시&nbsp;~&nbsp;<%=list.get(i).getEndtime() %>시</td>
         <td><%=list.get(i).getTablenumber() %></td><td><%=list.get(i).getNumberpeople() %>인</td>
         <td><%=list.get(i).getMemo() %></td>
         <td>
         <input type="button" value="예약취소" class="btn btn-danger checkBtn" style="padding:3px;width: 80px">
            <!-- <input type="button" value="예약취소" class="checkBtn"> -->
            <input type="hidden"  value=<%=list.get(i).getSeq() %>>
            <input type="hidden" value=<%=list.get(i).getId() %>>
         </td>
         
      </tr>
      
    <% } 
   } %>

</table>   
<!-- <a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">리스트로 돌아가기</a> -->
<input type="button" class="btn btn-secondary" onclick="location.href='auth?command=getMemlist&pageNum=0&item=name&sort=asc'" value="리스트로 돌아가기">
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

$(".checkBtn").click(function(){ 
   var del = confirm("정말 삭제하시겠습니까? 한번 삭제시 되돌릴 수 없습니다");
   if(del){
   // checkBtn.parent() : checkBtn의 부모는 <td>이다.
   // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
   var checkBtn = $(this);
   var tr = checkBtn.parent().parent();
   var td = tr.children();
   var input = td.children();
   var seq = input.eq(1).val();
   var id = input.eq(2).val();
       //alert("seq:" + seq);
       //alert("id" + id);

   $.ajax({
         url : "myReserv",
         type : "POST",
         data : {"seq" : seq ,
               "command" : "revDel"},
         success : function(data){
            if(data.result){
               //alert("삭제");
               location.href="auth?command=getMemDetail&id="+id+"&page=0";
            }else{
               alert("삭제 실패!");
            }
         },
         error : function(){
            alert("삭제과정에서 문제가 발생하였습니다. 동일 증상 지속시 고객센터로 연락주시기 바랍니다");
         }
      
       });
   }
});

</script>


</body>
</html>