<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("myList");
System.out.println(list.size());

int len = (int)request.getAttribute("len");
int memPage = len / 10; // 예: 22개의 글 → 3페이지
if (len % 10 > 0) {
	memPage = memPage + 1;
}
int pageNum = (int)request.getAttribute("page");
MemberDto mem = (MemberDto)session.getAttribute("login");
String id = mem.getId();

%>  
<%
Calendar cal = Calendar.getInstance();
int todayDate = cal.get(Calendar.DATE);
int todayMonth = cal.get(Calendar.MONTH) + 1;
int todayYear = cal.get(Calendar.YEAR);


String sDate = null;
if(todayDate < 10) { 
	sDate = "0" + todayDate;	
}else if(todayDate >= 10){
	sDate = todayDate + ""; 
}

String sMonth = null;
if(todayMonth < 10){
	sMonth = "0" + todayMonth;
	
}else if(todayMonth >= 10){
	sMonth = todayMonth + "";
}

String today = todayYear + "-" + sMonth + "-" + sDate;
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

<input type="hidden" id="_today" value=<%=today %>>
<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">My Reservation</p>
</div>
<input type="hidden" id="_id" value="<%=id %>">
<div align="center" class="container" style="max-width: 1100px">
<table class="table">	
	<!-- <col width="100"><col width="150"><col width="250"><col width="150"><col width="100"><col width="200"><col width="100"> -->
	<thead class="thead-dark">
	<tr style="text-align: center">
		<th>#</th><th>Rev Date</th><th>Rev Time</th><th>Table</th><th>Participants</th><th>Memo</th><th>Cancel</th>
	</tr>
	</thead>
	<% if(list.size() == 0){
	%>
	<tr>	
		<td colspan="7" align="center" style="font-size: 13pt;font-weight: bold;"> 예약 내역이 없습니다</td>
		
	</tr>	
	<%	
	}else{
		for( int i = 0; i < list.size(); i++){ 
			String rdate = list.get(i).getRdate();
		%>
		<tr>
			<td><%=i + 1 %></td>
			<td><%=rdate.substring(0, 10) %></td>
			<td><%=list.get(i).getStarttime()%>&nbsp;~&nbsp;<%=list.get(i).getEndtime() %></td>
			<td><%=list.get(i).getTablenumber() %></td>
			<td><%=list.get(i).getNumberpeople() %>명</td>
			<td><%=list.get(i).getMemo() %></td>
			<td>
				<input type="button" value="예약취소" class="btn btn-danger checkBtn" style="padding:3px;width: 80px">
				<input type="hidden"  value=<%=list.get(i).getSeq() %>>
				<input type="hidden" value=<%=list.get(i).getId() %>>
			</td>
			
		</tr>
		
 	<% } 
	} %>

</table>



</div>


<%-- 페이징에 대한 뷰 처리 --%>
<ul class="pagination justify-content-center" style="margin:20px 0">
<% for(int i = 0;i < memPage; i++) {		// [1] 2 [3]
	if(pageNum == i) { // 현재 페이지	%>			
		<li class="page-item active">
			<a class="page-link" href="#">
				<%=i + 1 %>
			</a>
		</li>
		
<%	 } else {	// 그 외의 페이지 	%>
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

<br><br><br><br><br><br><br><br><br><br><br><br><br>

<footer id="ft">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>



<script type="text/javascript">
$(document).ready(function () {
	var height_size = $(document).height();
	var h2_size = window.outerHeight;
	
	if (height_size <= h2_size) {
		$("#ft").attr('style', 'top:' + (height_size + 30) + 'px; position: absolute; width: 100%')
	}else {
		
	}
	//alert(height_size);
	//alert(h2_size);
	
	
});
</script>
	
<script type="text/javascript">
var thisDay = $("#_today").val();

var id = $("#_id").val();
//alert("id: "+id);
function goPage( page) {
//alert("page:===========" + page);
	location.href = "myReserv?command=myReserv&sort=asc&page=" + page  + "&id=" + id;
}

$(".checkBtn").click(function(){ 
	//alert("확인" + thisDay );
	
	var checkBtn = $(this);
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	var revDate = td.eq(1).text();
	//alert("확인: " + revDate);
	// 오늘날짜 및 예약 날짜랑 같은지 확인{
	if(revDate.trim() == thisDay.trim()){
		
		alert("당일 예약은 삭제하실 수 없습니다 ");
		
	}else if(revDate.trim() != thisDay.trim()) {
				
		var del = confirm("정말 삭제하시겠습니까");
		if(del){
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		
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
						alert("삭제");
						location.href="myReserv?command=myReserv&id="+id+"&page=0";
					}else{
						alert("삭제 실패!");
					}
				},
				error : function(){
					alert("삭제과정에서 문제가 발생하였습니다. 동일 증상 지속시 고객센터로 연락주시기 바랍니다");
				}
			
		    });
		}
	}
	
});

</script>	

</body>
</html>