<%@page import="dto.MemberDto"%>
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
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style type="text/css">


.member_btns {text-align:center;padding:1px 0 27px 0;}
.member_btns a {font-size:16px;font-weight:bold;color:#9a9a9a;}
.member_btns a:hover {color:#1a1a1a;text-decoration:none}
.member_btns span {font-size:21px;color:#cacaca;padding:0 30px;}


</style>
</head>
<body onkeydown="javascript:onEnterLogin();">

<%--	//계정 검증
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
--%>

<%--
	}else {
--%>	

<%-- 
		<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
			alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
			location.href = "main.jsp"	
		</script> 
--%>
<%--					
	}
--%>	


<%-- GNB --%>
<div id="gnb"></div>

<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>




<br><br>

<%--페이지 시작. --%>
<div align="center" class="container">
	<br><p class="subject">Login</p>
</div>



<div align="center" style="line-height:3em">
<form action="login?command=toMain" id="frm" method="POST">

	<div><!-- 아이디:  --><input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 10px"></div>
	<div><!-- 비밀번호:  --><input type="password" id="_pw" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 15px"></div>
	<div class="custom-control custom-checkbox" style="line-height: normal">
      <!-- <input type="checkbox" id="saveId">아이디 저장 -->
      <input type="checkbox" class="custom-control-input" id="saveId">
       <label class="custom-control-label" for="saveId" style="font-weight:bold">아이디 저장</label>
   </div>
	<div>
		<input type="button" id="_submit" class="btn btn-danger" style="width: 380px;vertical-align: middle;" value="로그인">
	</div>
	<div class="member_btns">
		<a href="addmember?command=add" >회원가입</a>
		<span>|</span>
		<a href="find?command=toFindPage">아이디 · 비밀번호 찾기</a>
	</div>
</form>
</div>


<%--
<<<<<<< HEAD
 	
	<div>아이디: <input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요"></div>
 	
@@ -60,18 +59,6 @@ $(function () {
	<div><a href="find?command=toFindPage"><button type="button">아이디 또는 비밀번호 찾기</button></a>
 	
	<a href="addmember?command=add"><button type="button">회원가입</button></a></div>
=======
	<div><!-- 아이디:  --><input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 10px"></div>
	<div><!-- 비밀번호:  --><input type="password" id="_pw" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 15px"></div>
	<div>
		<input type="button" id="_submit" class="btn btn-danger" style="width: 380px;vertical-align: middle;" value="로그인">
	</div>
	<div class="member_btns">
		<a href="addmember?command=add" >회원가입</a>
		<span>|</span>
		<a href="find?command=toFindPage">아이디 · 비밀번호 찾기</a>
	</div>
>>>>>>> Lee_css
</form>
</div>
--%>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>



<script type="text/javascript">

// 저장된 쿠키 가져오기 
$(function(){
    var userId = getCookie("Cookie_userid");
    $("#_id").val(userId);
    
    if($("#_id").val() != "")
        $("#saveId").attr("checked", true);
});


// 로그인 실패시 
$(document).ready(function () {
	loginFail();
});



function loginFail(){
	var loginFail = '${loginFail}';
	//alert(loginFail);
	if(loginFail == "0"){
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	
	}
}

//버튼 클릭으로 로그인
$(function () {
		$("#_submit").click(function () {
			login();
		});	
});

//엔터키로 로그인
function onEnterLogin(){

	var keyCode = window.event.keyCode;

	if (keyCode == 13) { //엔테키 이면

		login();

	}

} 

// 로그인 함수/ 쿠키저장
function login(){
	 //alert("확인");
	var id = $("#_id").val();
	var pw = $("#_pw").val();
	if(id == "" || pw == ""){
		alert("아이디 또는 비밀번호를 입력해주세요");
	}else{
		  
	    if($("#saveId").is(":checked")){
	        var userId = $("#_id").val();
	        setCookie("Cookie_userid", userId, 30);
	    }else{
	        deleteCookie("Cookie_userid");
	    }
	    
		$("#frm").submit();
	}
}


 /*
function loginProcess(){
    var id = document.getElementById('_Id');
    var pw = document.getElementById('userPw');
    var loginForm = document.getElementById('loginForm');  
 
}
 /**/

//쿠키 셋팅 함수 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 // 쿠키 삭제 함수 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 // 쿠키 가져오는 함수  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}	

</script>
</body>
</html>