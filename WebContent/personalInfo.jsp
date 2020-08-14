<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 MemberDto mem = (MemberDto)session.getAttribute("login");
 System.out.println(mem.getId());
 
 String id = mem.getId();
 String name = mem.getName();
 String phoneNum = mem.getCall_number();
 String email = mem.getEmail();
 String pwd = mem.getPw();
 int credit = mem.getBonuscredit();
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
th {text-align: right;padding-right: 20px}
.form-control { width: 75%;margin-bottom: 5px }
.btn.btn-primary {width :100px}

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

<%--페이지 시작. --%>
<div align="center" class="container">
	<br><p class="subject">회원 관리</p>

<table>
<col width="140"><col width="300">
	<tr>
		<th><input type="hidden" name="pwd" value='<%=pwd %>'>아이디</th> 
		<td><input type="text" name="id" readonly="readonly" value='<%=id %>' class="form-control"> </td>
	</tr>
	<tr>
		<th>이름</th> 
		<td><input type="text" name="name" readonly="readonly" value='<%=name %>' class="form-control"></td>
	</tr>
	<tr>
		<th>휴대폰번호</th> 
		<td><input type="text" name="phoneNum" readonly="readonly" value='<%=phoneNum %>' class="form-control"> </td>
	</tr>
	<tr>
		<th>이메일:</th> 
		<td><input type="text" name="email" readonly="readonly" value='<%=email %>' class="form-control"> </td>
	</tr>
	<tr>
		<th>포인트: </th> 
	<td><input type="text" name="email" readonly="readonly" value='<%=credit %> 점' class="form-control"></td>
	</tr>
<%--	
=======
		<th>이메일</th> 
		<td><input type="text" name="email" readonly="readonly" value='<%=email %>' class="form-control"> </td>
>>>>>>> Jung_Css
 --%>
	<tr> 
		<td colspan="2" style="text-align: center; padding-top: 20px">
		<div class="btn-group">
			<!-- <a href="personalInfo?command=memcheck"><button type="button">수정</button></a> -->
			<!-- <a href="personalInfo?command=myReserv"><button type="button">내 예약</button></a> -->
			<!-- <a href="login?command=logout"><button type="button">로그아웃</button></a> -->
			<button type="button" onclick="location.href='personalInfo?command=memcheck'" class="btn btn-primary">수정</button>
			<button type="button" onclick="location.href='myReserv?command=myReserv&id=<%=id %>&sort=asc&page=0'" class="btn btn-primary">내 예약</button>
			<button type="button" onclick="location.href='login?command=logout'" class="btn btn-primary">로그아웃</button>
		</div>
		</td>
	</tr>
</table>

<!-- 기존 버튼에 추가 삭제 예정 -->
<%-- <a href="myReserv?command=myReserv&id=<%=id %>&sort=asc&page=0"><button type="button">내 예약</button></a>
<a href="login?command=logout"><button type="button">로그아웃</button></a> --%>

</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>



<script type="text/javascript">


</script>
</body>
</html>