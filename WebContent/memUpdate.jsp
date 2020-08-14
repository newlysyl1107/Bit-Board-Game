<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDto mem = (MemberDto)session.getAttribute("login");
    
    
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
.form-control { width: 95%;margin-bottom: 5px }
.btn.btn-primary {width :100px}
.alert.alert-danger.custom {width: 415px;padding: inherit;height: 30px;margin-bottom: auto;text-align: center;}
.alert.alert-success.custom {width: 415px;padding: inherit;height: 30px;margin-bottom: auto;text-align: center;}
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
	<br><p class="subject">회원 정보 수정</p>
</div>
<div align="center" class="container" style="padding-right: 60px">
<table>
<col width="120px"><col width="300px">
   <tr>
      <th>아이디</th>
      <td>
         <!-- 세션 패스워드 -->
         <input type="hidden" id="oldPw" value="<%=mem.getPw() %>">
         <input type="text" id="id" value='<%=mem.getId() %>' readonly="readonly" class="form-control" >
         <%-- <div id="id"><%=mem.getId() %></div> --%> 
      </td>
   </tr>
   <tr>
      <th>이름</th>
      <td>
         <input type="text" id="name" value='<%=mem.getName() %>' readonly="readonly" class="form-control" >
         <%-- <div id="name"><%=mem.getName() %></div> --%>
      </td>
   </tr>
   <tr>
      <th>휴대폰번호</th>
      <td>
         <input type="text" id="_phoneNum" name="phoneNum" value='<%=mem.getCall_number() %>' class="form-control" style="width:220px; display: inline;">
         
         <button type="button" onclick="phoneChange()" class="btn btn-outline-secondary" style="vertical-align: top;">변경</button>
      </td>
   </tr>
   <tr>
      <td colspan="2">
         <div class="alert alert-danger custom" id="phone-notice">잘못된 휴대폰 번호입니다. 확인 후 다시 입력해주세요</div>
      </td>
   </tr>
   <tr>
      <th>이메일</th>
      <td><input type="text" id="_email" name="email" value="<%=mem.getEmail()%>" class="form-control" style="width:220px; display: inline;">
         <button type="button" onclick="emailChange()" class="btn btn-outline-secondary" style="vertical-align: top;">변경</button>
      </td>
   </tr>
      <tr>
      <td colspan="2">
         <div class="alert alert-danger custom" id="email-notice">잘못된 이메일주소 입니다. 확인 후 다시 입력해주세요</div>
      </td>
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" id="pwd1" name="pwd" placeholder="영문+숫자+특수기호 조합 8자이상" class="form-control" style="display: inline;text-align: center;" ></td>
   </tr>
      <tr>
      <td colspan="2">
         <div class="alert alert-danger custom" id="pwd-notice">비밀번호를 양식에 맞게 입력해주세요</div>
      </td>
   </tr>
   <tr>
      <td></td>
      <td><input type="password" id="pwd2" placeholder="비밀번호 확인" class="form-control" style="width:220px; display: inline;text-align: center;">
         <button type="button" id="pwbtn" onclick="pwChange()" class="btn btn-outline-secondary" style="vertical-align: top;">변경</button>
      </td>
   </tr>
   <tr>
      <td colspan="2">
         <div id="alert-success" class="alert alert-success custom">비밀번호가 일치합니다.</div>
         <div id="alert-danger" class="alert alert-danger custom">비밀번호가 일치하지 않습니다.</div>
      </td>
   </tr>   
</table>

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
$("#phone-notice").hide();
$("#email-notice").hide();
$("#pwd-notice").hide();
$("#alert-success").hide();
$("#alert-danger").hide();

var oldPhoneNum = $("#_phoneNum").val();
var oldEmail = $("#_email").val();
var oldPw = $("#oldPw").val();

//phone번호 변경
function phoneChange() { 
	var newPhoneNum = $("#_phoneNum").val() 
	if( oldPhoneNum == newPhoneNum || newPhoneNum == ""){//이전과 같은 폰 번호 입력한경우 혹은 입력하지 않은경우 
		alert("변경하실 번호를 입력해주세요");
		
	}else{	//폰번호 유효성검사 
			var phoneChk = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/
			if (phoneChk.test(newPhoneNum)) { //유효성 검사 pass! 
				//폰번호 중복검사 
				$.ajax({ url : "memUpdate",
					 type : "POST",
					 data : {"phoneNum" : newPhoneNum,
						 	"command" : "phoneNumChk"},
					 success: function(data){
					   if(data.callChk){
						   alert("이미 존재하는 휴대폰 번호입니다. 다시 확인해주세요");
						   return;
					   }else{
							$.ajax({ url : "memUpdate",
									 type : "POST",
									 data : {"phoneNum" : newPhoneNum,
										 	"command" : "phoneNumChg"},
									 success: function(data){
									   if(data.result){
										   alert("변경이 완료되었습니다");
										   
									   }else{
										   alert("변경에 실패하였습니다. 다시 시도해주세요");
									   }	 
									 },
									 error:function(){ 
										 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
									 }
							});
						   
					   }	 
					 },
					 error:function(){ 
						 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
					 }
				});

				$("#phone-notice").hide();
			} else if (!phoneChk.test(newPhoneNum)) {// 유효성검사 fail!
				$("#phone-notice").show();
			}

		}
		
		
	}
// 폰번호 입력후 다른 정보 입력하기 위해 벗어난 경우 유효성 검	사 
$("#_phoneNum").blur(function() {
	var newPhoneNum = $("#_phoneNum").val();
	var phoneChk = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/
	if (phoneChk.test(newPhoneNum)) { //유효성 검사 pass! 
		$("#phone-notice").hide();
	} else if (!phoneChk.test(newPhoneNum)) { //유효성검사 fail!
		$("#phone-notice").show();
	}
});

function emailChange(){
	var newEmail = $("#_email").val();
	// alert("oldEmail:" + oldEmail);
	// alert("email:" + email);
	
	if(oldEmail == newEmail || newEmail == ""){//이전과 같은 메일 주소 입력한경우, 안적은경우  
		alert("변경하실 이메일주소를 입력해주세요");
		
	}else{	
	// 이메일 유효성검사 
		var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i; 
		if (emailChk.test(newEmail)) {
			// 이메일 중복검사 
			$.ajax({ url : "memUpdate",
				 type : "POST",
				 data : {"email" : newEmail,
					 	"command" : "emailChk"},
				 success: function(data){
				   if(data.emailChk){
					   alert("이미 존재하는 이메일주소 입니다. 다시 확인해주세요");
				   }else{
						$.ajax({ url : "memUpdate",
							 type : "POST",
							 data : {"email" : newEmail,
								 	"command" : "emailUpdate"},
							 success: function(data){
							   if(data.result){
								   alert("변경이 완료되었습니다");
							   }else{
								   alert("변경에 실패하였습니다. 다시 시도해주세요");
							   }	 
							 },
							 error:function(){ 
								 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
							 }
					});

				   }	 
				 },
				 error:function(){ 
					 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
				 }
		});
			
			
			
					$("#email-notice").hide();
		} else if (!emailChk.test(newEmail)){
			$("#email-notice").show();
		}
	}		
		
}	

// 이메일 입력 후 다른정보 입력위해 포커스 이동한 경우 유효성 검사 
$("#_email").blur(function () {	
	var newEmail = $("#_email").val();
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i;
	if (emailChk.test(newEmail)) { //유효성 검사 pass! 
		$("#email-notice").hide();
	} else if (!phoneChk.test(newEmail)) { //유효성검사 fail!
		$("#email-notice").show();
	}
});
		
//비밀번호 변경 	
function pwChange(){
		// alert("확인")
		var newPw = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		// alert(newPw);
		if(oldPw == newPw){
			alert("이전과 같은 번호로 변경하실 수 없습니다");
		}else if(newPw != pwd2){
		 	alert("입력하신 비밀번호가 일치하지 않습니다 ");	
		
		}else{
			var pwChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

			if (pwChk.test(newPw)) { //유효성검사 
				$.ajax({ url : "memUpdate",
					 type : "POST",
					 data : {"pwd" : newPw,
						 	"command" : "pwUpdate"},
					 success: function(data){
					   if(data.result){
						   alert("변경이 완료되었습니다");
					   }else{
						   alert("변경에 실패하였습니다. 다시 시도해주세요");
					   }	 
					 },
					 error:function(){ 
						 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
					 }
			});
				$("#pw-notice").hide();
			} else if (!pwChk.test(newPw)) {
				$("#pw-notice").show();

			}
		
		}
}

//비밀번호 입력후 다른 정보 입력하기 위해 벗어난 경우 유효성 검사 
$("#pwd1").blur(function() {
	var newPw = $("#pwd1").val();
	var pwChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	if (pwChk.test(newPw)) { //유효성 검사 pass! 
		$("#pwd-notice").hide();
	} else if (!pwChk.test(newPw)) { //유효성검사 fail!
		$("#pwd-notice").show();
	}
});

// 비밀번호 일치여부 확인 (pwd1에 변화있을때)
$("#pwd1").keyup(function() {
	var pwd2 = $("#pwd2").val();
	var pwd1 = $("#pwd1").val();
	if (pwd1 != "" && pwd2 != "") {
		if (pwd1 == pwd2) { // 비밀번호 일치할때
			$("#alert-success").show();
			$("#alert-danger").hide();
		} else if (pwd1 != pwd2) { // 비밀번호 일치하지 않을때
			$("#alert-success").hide();
			$("#alert-danger").show();	
		}
	} else { // 둘중하나라도 입력되지 않았을때
		$("#alert-success").hide();
		$("#alert-danger").hide();
	}
});
//비밀번호 일치여부 확인 (pwd2에 변화있을)
$("#pwd2").keyup(function() {
	var pwd2 = $("#pwd2").val();
	var pwd1 = $("#pwd1").val();
	if (pwd1 != "" && pwd2 != "") {
		if (pwd1 == pwd2) { // 비밀번호 일치할때
			$("#alert-success").show();
			$("#alert-danger").hide();

		} else if (pwd1 != pwd2) { // 비밀번호 일치하지 않을때 
			$("#alert-success").hide();
			$("#alert-danger").show();
		}
	} else { // 둘중하나라도 입력되지 않았을때
		$("#alert-success").hide();
		$("#alert-danger").hide();
	}
});

</script>

</body>
</html>