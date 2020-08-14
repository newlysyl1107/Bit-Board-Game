<%@page import="dto.MemberDto"%>
<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String year = (String)request.getAttribute("year");
	String month = (String)request.getAttribute("month");
	String day = (String)request.getAttribute("day");
	
	System.out.println("year : " + year);
	System.out.println("month : " + month);
	System.out.println("day : " + day);
	
	Object olist = request.getAttribute("ReservationTableList");
	List<TableDto> list = null;
	if(olist != null) {
		list = (List<TableDto>)olist;
	}
	
	for(int i = 0; i < list.size(); i++) {
		TableDto dto = list.get(i);
		
		System.out.println(dto.getTablenumber() + "," + dto.getNumberpeople() + "," + dto.getIsreserbaitiontable()); 
	}
	
	//범위를 설정하는 날짜. 기준
	Calendar cal = Calendar.getInstance();

	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH) + 1; // 0 ~ 11 +1
	int tday = cal.get(Calendar.DATE);
	int thour = cal.get(Calendar.HOUR_OF_DAY);
	int tmin = cal.get(Calendar.MINUTE);
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
td {text-align: center;width: 70px}
.serchSelect {padding: 0rem 0.5rem}




</style>


</head>
<body>

<%	//로그인 검증부분.
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if (oLogin == null) {
%>
	<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
		alert("잘못된 접근입니다. 메인 페이지로 이동합니다.");
		location.href = "main.jsp"	
	</script> 

<%	
	}else {
		mem = (MemberDto) oLogin;
	}
%>





<%-- GNB  --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">Reservation</p>
<!-- &nbsp;&nbsp;&nbsp;&nbsp;<h4 style="display: inline;"><img src="./image/qnaNotice2.png" width="30">&nbsp;<b>매장 운영 시간은 09시 ~ 22시 입니다.</b></h4> -->





<form action="RevWriteServlet" id="revForm">
	<div>
		<h3><img src="./image/qnaNotice2.png" width="30">&nbsp;&nbsp;<b>매장 운영 시간은 09시 ~ 22시 입니다.</b></h3>
		<br>
		<span style="font-size:14pt; font-weight: bold;">1. 테이블을 선택해주세요.</span>&nbsp;
		<!-- <h5 style="display: inline;"><b>1. 테이블을 선택해주세요 : </b></h5>&nbsp; -->
		<select id="tableSelect" name="tableSelect" class="serchSelect">
			<option value="none">선택</option>
			<% for(int i = 0; i < list.size(); i++) { %>
			<% TableDto dto = list.get(i); %>
			<option value="<%= dto.getTablenumber()%>" data-np="<%=dto.getNumberpeople()%>"><%=dto.getTablenumber()%>번 테이블 (<%=dto.getNumberpeople()%>인용)</option>
			<% } %>
		</select>
	</div>
	
	
	<div id="second">
		<div id="sf">
		
		
		</div>
	</div>
</form>
</div>

<footer style="top: 940px; position: absolute; width: 100%">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>






<script type="text/javascript">
var revCheck = new Array();			//테이블 예약정보 전역변수.
var numberPeoples = null;

$("#tableSelect").on("change", function () {	//테이블 선택 변경
	//alert("값 변환 감지");
	var tableNumber = $("#tableSelect option:selected").val(); //테이블 넘버를 가져옴.
	
	
	if(tableNumber == "none") {
      	$("#sf").remove();
    	$("#second").append('<div id="sf">');
    	$("#second").append('</div>');
	}else {
	    jQuery.ajax({
	        type:"GET",
	        url:"RevWriteServlet",
	        //traditional : true, 	//배열전송할때 쓰는거. 지금은 아니니 필요 없을듯.
	        dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			data:{"command":"tableSet","year":<%=year%> , "month":<%=month%> , "day":<%=day%> , "tableNumber":tableNumber},
	        success : function(data) {
	             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	             //Result(data , "delete" , id , null, null);
	             //alert("success"); 
	             //alert(data); 
	             //alert(data.length); //0~12 -> 13
	    
	             revCheck = new Array();
	             for(i = 0; i < data.length; i++) {
	            	revCheck[i] = data[i];
	             }
	             numberPeoples = $("#tableSelect option:selected").data("np");
	             
	          	$("#sf").remove();
	        	$("#second").append('<div id="sf">');
	        	$("#second").append('</div>');
	        	

	        	var isP = false;
	        	
	        	for(i = 0; i < revCheck.length; i++) {
	        		if(revCheck[i] == 0) {
	        			isP = true;
	        			break;
	        		}
	        	}

	        	
	
	        	$("#sf").append('<br>');
	        	
	        	$("#sf").append('<table border="1" id="revTable" class="table table-bordered">');
	        	
	            $("#revTable").append('<tr>');
	            for(var i = 0; i < (revCheck.length /*+ 1 */); i++) {
	           		$("#revTable").append('<td><b>' + (9 + i) + '</b></td>');
	            }
	            $("#revTable").append('</tr>');
	         
	            
	            
	            $("#revTable").append('<tr>');
	            for(var i = 0; i < revCheck.length; i++) {
	            	if(revCheck[i] == 0) {
	            		$("#revTable").append('<td>' + "<span class='badge badge-info'> 예약가능 </span>" + '</th>');
	            	}else {
	            		$("#revTable").append('<td>' + "<span class='badge badge-secondary'> 예약불가 </span>" + '</th>');
	            	}
	            }
	            /* $("#revTable").append('<td>' + '</td>'); */
	            $("#revTable").append('</tr>');

	            
	        	$("#sf").append('</table>');
	        	
	        	
		        if(isP) {
	
		        	$("#sf").append('<br><br>');
		        	
		        	/* $("#sf").append('<b>2.이용할 시간과 이용 인원을 선택해주세요.</b><br><br>'); */
		        	$("#sf").append('<span style="font-size:14pt; font-weight: bold;">2. 이용 시간과 인원을 선택해주세요.</span>');
		        	
		        	$("#sf").append('<br><b>◎ 이용 시간 : </b>');
		             
		        	
		        	$("#sf").append('<select id="startTime" name="startTime" class="serchSelect">');
		        	$("#startTime").append('<option value="none">선택</option>');
		        	for(i = 0; i < revCheck.length; i++) {
		        		if(revCheck[i] == 0) {
			        		$("#startTime").append('<option value=' + i + '>' + (i + 9) + '시</option>');
		        		}
		        	}
		        	$("#sf").append('</select>');
		        	$("#sf").append(' <b>~</b>');
		        	
		        	
		        	$("#sf").append(' <span id ="endSpan">');
	
		        	$("#sf").append('</span>');
		        	
		        	
		        	
		        	
		        	$("#sf").append('<br>');
		        	$("#sf").append('<b>◎ 인원수 : </b>');
		        	$("#sf").append('<select id="peopleNumber" name="peopleNumber" class="serchSelect">');
		        	for(i = 1; i <= numberPeoples; i++) {
		        		$("#peopleNumber").append('<option value=' + i + '>' + i + '명</option>');
		        	}
		        	$("#sf").append('</select>');
	        	
	        	}else {
		        	/* $("#sf").append('<br><br>'); */
		        	$("#sf").append('<span class="badge badge-warning" style="font-size:15px">이 테이블은 모든 예약이 마감되었습니다. 다른 테이블을 이용하시거나, 다른 날짜를 이용해주세요.</span>');
		        	/* $("#sf").append('<b>현재 이 테이블은 예약이 전부 차있습니다. 다른 테이블을 이용하시거나, 다른 날짜를 이용해주세요.</b><br><br>'); */
	        	}
	             
	
	        },
	        error : function(xhr, status, error) {
	              alert("에러발생");
	        }
	 	 });
		
	}
	

	
	
	
})


$(document).on("change", "#startTime", function () {
	//alert("시작시간 변환 감지");

	var st = $("#startTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	$("#endTime").remove();
  	$("#third").remove();
	
	if(st == "none") {

	}else {
		st *= 1;
		//alert(st);
		
	   	$("#endSpan").append('<select id="endTime" name="endTime" class="serchSelect">');
	   	$("#endTime").append('<option value="none">선택</option>');
	   	for(i = st; i < revCheck.length; i++) {
	   		if(revCheck[i] == 0) {
	       		$("#endTime").append('<option value=' + (i + 1) + '>' + (i + 10) + '시</option>');
	   		}else{
	   			break;
	   		}
	   	}
	   	$("#endSpan").append('</select>');
	}
})


$(document).on("change", "#endTime", function () {
	//alert("시간설정 완료 감지");
	$("#third").remove();
	
	var st = $("#startTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	var et = $("#endTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	
	if(et == "none") {

	}else {
		st *= 1;
		et *= 1;

	
		$("#sf").append('<div id="third">');
			$("#third").append('<br><br>');
	
			$("#third").append('<span style="font-size:14pt; font-weight: bold;">3. 예약과 함께 남길 메모를 작성해주세요.</span><br>');
			
			$("#third").append('<b> ◎ 예약자 이름 : <%=mem.getName() %></b>');
			$("#third").append('<br>');
			$("#third").append('<b> ◎ 예약일 : <%=year %>년 <%=month %>월 <%=day %>일 </b>');
			$("#third").append('<br>');
			$("#third").append('<b> ◎ 예약시간 : ' + (st+9) + '시 ~ ' + (et+9) + '시</b>');
			$("#third").append('<br>');
			$("#third").append('◎ 남길 말 : <input type="text" class="serchText" placeholder="이곳에 메모를 남겨주세요" id="memo" name="memo" class="serchText" style="margin-right:5px">');
			/* $("#third").append('<br>');	 */		
			$("#third").append('<button type="button" id="revGo" class="btn btn-success" style="vertical-align:top">예약완료</button>');
			$("#third").append('<br><br><br>');
			
			
			$("#third").append('<input type="hidden" name="year" value="<%=year%>">');
			$("#third").append('<input type="hidden" name="month" value="<%=month%>">');
			$("#third").append('<input type="hidden" name="day" value="<%=day%>">');
			$("#third").append('<input type="hidden" name="command" value="revGo">');
			$("#third").append('<input type="hidden" name="id" value="<%=mem.getId()%>">');
	
		$("#sf").append('</div>');
	
	}
	
});

$(document).on("click", "#revGo", function () {
	//alert("예약이 완료되었습니다.");

	$('#revForm').submit();
	
	
});

</script>





</body>
</html>