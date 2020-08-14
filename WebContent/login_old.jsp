<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String loginFail = request.getParameter("loginFail");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<div align="center">
<h1>로그인 페이지</h1>
<form action="login?command=toMain" id="frm" method="POST">
	<div>아이디: <input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요"></div>
	<div>비밀번호: <input type="password" id="_pw" name="pw" placeholder="비밀번호를 입력해주세요"></div>
	<div><button type="button" id="_submit">로그인</button></div>
	<div><a href="find?command=toFindPage"><button type="button">아이디 또는 비밀번호 찾기</button></a>
	<a href="addmember?command=add"><button type="button">회원가입</button></a></div>
</form>
</div>



<script type="text/javascript">

// 로그인 실패시 
$(document).ready(function () {
	loginFail();
})

function loginFail(){
	var loginFail = '${loginFail}';
	//alert(loginFail);
	if(loginFail == "0"){
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	
	}
}
	
	$(function () {
		$("#_submit").click(function () {
			var id = $("#_id").val();
			var pw = $("#_pw").val();
			if(id == "" || pw == ""){
				alert("아이디 또는 비밀번호를 입력해주세요");
			}else{
				$("#frm").submit();
			}
			
		});

		
	});

</script>
</body>
</html>