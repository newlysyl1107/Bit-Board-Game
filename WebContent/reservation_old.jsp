<%@page import="dto.MemberDto"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!	//초기 선언 함수

//nvl 함수
public boolean nvl(String msg){
	return msg == null || msg.trim().equals("")?true:false;
}

/*
//날짜를 클릭시 모든 일정 호출(callist.jsp)로 이동
public String callist(int year, int month, int day){
	String str = "";
	
	//callist.jsp로 parameter (year, month, day) 저장
	str += String.format("<a href='%s?year=%d&month=%d&day=%d'>", 
							"callist.jsp", year, month, day);
	
	str += String.format("%2d", day);	// <a href="">(%2d날짜)</a>
	str += "</a>";
		// 예 : <a href='callist.jsp?year=2020&month=02&day=05'>_5</a>
	return str;
			
}
*/


//이미지 클릭시 예약하기(RevWrite) 이동
public String showPen(int year, int month, int day){
	String str = "";
		
	//String image = "<img src='../image/pen2.png' width='15px' height='15px'>";
	String image = "[예약]";
	
	str = String.format("<a href='%s?year=%d&month=%d&day=%d' style='text-decoration:none' >%s</a>", 
							"ReservationServlet", year, month, day, image);
	
	
//	 == <a href=calwrite.jsp=?year=2020&month=02&day=05>
//			<img src='./image/pen2.png' width='18px' height='18px'>
//		</a>
	
	
	return str;
}
%>    


<%
	Object oYear = request.getAttribute("year");
	Object oMonth = request.getAttribute("Month");
	Object oDay = request.getAttribute("day");



%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
-->
<!-- 부가적인 테마 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
-->
<!-- 합쳐지고 최소화된 최신 자바스크립트
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->

</head>
<body>

<%	//로그인 검증부분.
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if (oLogin == null) {
%>
	<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
		alert("로그인이 필요한 서비스입니다. 로그인 후 이용해주세요.");
		location.href = "login.jsp"	
	</script> 

<%	
	}else {
		mem = (MemberDto) oLogin;
	}
%>

<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%--페이지 시작. --%>
<h1>예약페이지</h1>
<hr>


<%-- 만약 예약가능한 테이블이 전혀 없다면 페이지를 띄우지 않고 막을 기능이 필요함. --%>



<%
Calendar cal = Calendar.getInstance();
int todayDate = cal.get(Calendar.DATE);
int todayMonth = cal.get(Calendar.MONTH);
int todayYear = cal.get(Calendar.YEAR);
System.out.println("------------------------------");
System.out.println("오늘 날짜 : " + todayYear + "년 " + (todayMonth + 1) + "월 " + todayDate + "일");


cal.set(Calendar.DATE, 1); // 현재 객체의 특정 필드를 다른 값으로 설정한다 / (현재 월)
System.out.println("Calendar.DATE : " + Calendar.DATE);

String syear = request.getParameter("year");
System.out.println("parameter syear : " +syear);
String smonth = request.getParameter("month");
System.out.println("parameter smonth : " +smonth);

int year = cal.get(Calendar.YEAR);
System.out.println("year : " +year);
if(nvl(syear) == false){	//문자열이 들어있으면 실행
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;
System.out.println("month : " +month);
if(nvl(smonth) == false){	//문자열이 들어있으면 실행
	month = Integer.parseInt(smonth); 
}

// 1월 이전 선택시 처리
if(month < 1){
	month = 12;
	year--;
}
//12월 이후 선택시 처리
if(month > 12){
	month = 1;
	year++;
}

//연,월,일 set
cal.set(year, month-1, 1);	
System.out.println("month-1 : " + (month-1));

// 요일 계산
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
// 현재 객체의 주어진 값의 필드에 해당하는 상수 값을 반환한다. 이 상수값은 Calendar 클래스의 상수중에 가진다
System.out.println("Calendar.DAY_OF_WEEK : " +dayOfWeek);
System.out.println("------------------------------");

// <<	year--
String pp = String.format("<a href='%s?year=%d&month=%d'>"
							+ "<img src=' /* 이미지 삽입 부분 */' width='18px' height='18px'>" +
						  "</a>", 
						  		  "reservation.jsp", year-1, month);  
										//%s,		 %d, 	%d 
// <	month--
String p = String.format("<a href='%s?year=%d&month=%d'>"
							+ "<img src='/* 이미지 삽입 부분 */' width='18px' height='18px'>" +
						  "</a>", "reservation.jsp", year, month-1);
// >	month++
String n = String.format("<a href='%s?year=%d&month=%d'>"
							+ "<img src='/* 이미지 삽입 부분 */' width='18px' height='18px'>" +
						  "</a>", "reservation.jsp", year, month+1);
// >>	year++
String nn = String.format("<a href='%s?year=%d&month=%d'>"
							+ "<img src='../image/last.gif' width='18px' height='18px'>" +
						  "</a>", "reservation.jsp", year+1, month);

//CalendarDao dao = CalendarDao.getInstance();

//List<CalendarDto> list = dao.getCalendarList(mem.getId(), year+two(month+""));

%>
<div align="center">
<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">


<%-- << < yyyy년 mm월 > >> 처리  --%>
<tr height="100">
	<td colspan="7" align="center" style="padding-top: 20px">
		<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp;
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
		</font>
		<%=n %>&nbsp;&nbsp;<%=nn %>
	</td>
</tr>

<%-- 요일 처리 --%>
<tr height="50">
	<th align="center">일</th>
	<th align="center">월</th>
	<th align="center">화</th>
	<th align="center">수</th>
	<th align="center">목</th>
	<th align="center">금</th>
	<th align="center">토</th>
</tr>




<tr height="100" align="left" valign="top">
<%
// 위쪽 빈칸 처리
for(int i = 1;i < dayOfWeek; i++){
	%>
	<td style="background-color: #cecece">&nbsp;</td>
	<%
}
%>

<%-- 날짜 --%>
<%
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1; i <= lastday; i++){
	%>
		<%-- 날짜 / 펜 --%> 
	<td>
		<%= i %>
		
		<%-- <%=callist(year, month, i) %> --%>
	 	<%-- &nbsp;<%=showPen(year, month, i) %> --%>
		<%-- <%=makeTable(year, month, i, list) %> --%>
				
		<% if(year > todayYear){ %>
			&nbsp;<%=showPen(year, month, i) %> 
		<% }else if(year == todayYear) { %>
			<% if(month > (todayMonth + 1)) { %>
				&nbsp;<%=showPen(year, month, i) %> 
			<% }else if(month == (todayMonth + 1)) { %>
				<% if(i > todayDate) {%>
					&nbsp;<%=showPen(year, month, i) %> 
				<% }else { %>
					&nbsp;[X]
				<% } %>
			<% }else { %>
				&nbsp;[X]
			<% } %>
		<% }else { %>
			&nbsp;[X]
		<% } %>

	</td>	
	<%
		/* 일주일 단위 개행 */
	if((i + dayOfWeek - 1 ) % 7 == 0 && i != lastday){
		%>
		</tr>
		<tr height="100" align="left" valign="top">
		<%
	}
}
%>



<%-- 아래 빈칸 처리 --%>
<%
cal.set(Calendar.DATE, lastday);	// 그 달의 마지막 날짜
int weekday = cal.get(Calendar.DAY_OF_WEEK);
for(int i = 0 ; i < 7 - weekday; i++){
	%>
	<td style="background-color: #cecece">&nbsp;</td>
	<%
}
%>

</tr>
</table>
</div>


</body>
</html>