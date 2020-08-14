<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("curList");
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

td {text-align: center;}

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
<br><p class="subject">관리자　|　예약 현황</p>
</div>

<div align = "center" class="container" style="max-width: 1100px" >
<table  class="table">
   <col width="50"><col width="120"><col width="120"><col width="80"><col width="90"><col width="300"><col width="130"><col width="100">
   
   <thead class="thead-dark">
   <tr>
      <td colspan="8" style="text-align: left; border-top: white;">
         <input type="button" class="btn btn-outline-info" onclick="location.href='authRev?command=pastRev'" value="지난 예약 확인">
      </td>
   </tr>
   
   <tr style="text-align: center">
      <th>#</th><th>Rev Date</th><th>Rev Time</th><th>Table</th><th>Participants</th><th>Memo</th><th>User Id</th><th>Cancel</th>
   </tr>
   </thead>
   
   
   <tbody>
   <% if(list.size() == 0){
   %>
   <tr>   
      <td colspan="8" align="center">예약이 없습니다</td>
      
   </tr>   
   <%   
   }else{
      for( int i = 0; i < list.size(); i++){ 
         String rdate = list.get(i).getRdate();
         if(list.get(i).getDel() != 1){
      %>
      <tr>
         <td ><%=i + 1 %></td>
         <td><%=rdate.substring(0, 10) %></td>
         <td><%=list.get(i).getStarttime()%>시&nbsp;~&nbsp;<%=list.get(i).getEndtime() %>시</td>
         <td><%=list.get(i).getTablenumber() %></td>
         <td><%=list.get(i).getNumberpeople() %> 인</td>
         <td><%=list.get(i).getMemo() %></td>
         <td><%=list.get(i).getId() %></td>
         <td>
            <input type="hidden" value=<%=list.get(i).getSeq() %>>
            <!-- <input type="button" value="예약취소" class="checkBtn" style="padding:3px;"> -->
            <input type="button" value="예약 취소" class="btn btn-danger checkBtn" style="padding:3px;width: 80px">
            
            <!-- <button type="button" class="btn btn-danger">Danger</button> -->
         </td> 
         <%-- 
         <td><%=i + 1 %></td>
         <td><%=rdate.substring(0, 10) %></td>
         <td><%=list.get(i).getStarttime()%>&nbsp;~&nbsp;<%=list.get(i).getEndtime() %></td>
         <td><%=list.get(i).getTablenumber() %></td>
         <td><%=list.get(i).getNumberpeople() %>명</td>
         <td><%=list.get(i).getMemo() %></td>
         <td><%=list.get(i).getId() %></td>
         <td><input type="button" value="예약취소" class="checkBtn"></td>
         <td><input type="hidden"  value=<%=list.get(i).getSeq() %>></td> 
         --%>
      </tr>
      
    <%       } 
      }
   } 
   %>
</tbody>
</table>

</div>

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
   //alert
   var del = confirm("정말 삭제하시겠습니까? 한번 삭제시 되돌릴 수 없습니다");
   if(del){
   // checkBtn.parent() : checkBtn의 부모는 <td>이다.
   // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
   var checkBtn = $(this);
   var tr = checkBtn.parent().parent();
   var td = tr.children();
   var input = td.children();
   var id = td.eq(6).text();
   var seq = input.eq(0).val();
       //alert("seq : " + seq);
       //alert("id : " + id);

   $.ajax({
         url : "myReserv",
         type : "POST",
         data : {"seq" : seq ,
               "command" : "revDel"},
         success : function(data){
            if(data.result){
               //alert("삭제");
               location.href="authRev?command=curRev";
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

<Br><Br><Br><Br>

<footer id="ft">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>

</body>
</html>