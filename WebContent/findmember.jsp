<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.form-control{width: 250px;text-align: center;margin-bottom: 10px}
	
	div.root{margin: auto;width:800px;}

    div.left {
        width: 50%;
        height:250px;
        float: left;
        
        box-sizing: border-box;
       /*  background: #ff0; */
        text-align: center;
    
    }
    div.right {
        width: 50%;
        height:250px;
        float: right;
        box-sizing: border-box;
       /*  background: #0ff; */
        text-align: center;
       
    }

</style>



</head>

<%	//계정 검증
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
%>

<%	
	}else {
%>	
		<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
			alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
			location.href = "main.jsp"	
		</script> 
<%					
	}
%>	
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
});
</script>

<br>

<div class="root">

<%--페이지 시작. --%>


<div class="left">
<br><p class="subject">Find User ID</p>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td><input type="text" id="_name"  placeholder="이름" class="form-control"></td>
	</tr>
	<tr>	
		<td><input type="text" id="_email" placeholder="이메일" class="form-control"></td>
	</tr>
	<tr>
		<%--<td align="center"><button type="button" onclick="findId()" class="btn btn-danger" style="width: 250px">아이디찾기</button></td>  --%>
		<td align="center"><button type="button" onclick="findId()" class="btn btn-info" style="width: 250px">아이디찾기</button></td>
	</tr>
	<tr>
		<td align="center">
			<!-- <div id="foundId">☆</div> -->
		</td>
	</tr>
</table>

<!-- 아이디 찾기 결과 --> 
<div id="foundId" style="font-weight: bold; margin-top: 10px"></div>
</div>





<div class="right">
<br><p class="subject">Find Password</p>
<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td><input type="text" id="_id" placeholder="아이디" class="form-control" ></td>
	</tr>
	<tr>	
		<td><input type="text" id="idEmail" placeholder="이메일 " class="form-control"></td>
	</tr>
	<tr>

		<%-- <td align="center"><button type="button" onclick="findPw()" class="btn btn-danger" style="width: 250px">비밀번호찾기</button></td> --%>
		<td align="center"><button type="button" onclick="findPw()" class="btn btn-info" style="width: 250px">비밀번호찾기</button></td>
	</tr>
</table>

</div>
</div>

<div align="center">
	<p style="margin-top: 300px;font-weight: bold;" >● 가입하신 이메일이 기억나지 않을 고객센터(080-00A-000B)로 연락주세요 ●</p>
</div>

<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>





<script type="text/javascript">

function findId() {
	var inputName = $("#_name").val();
	var inputEmail = $("#_email").val();

	if(	inputName == "" || inputEmail == ""){
		alert("이름 또는 이메일을 입력해주세요")
	}else{
		var nameChk = /^[가-힣]{2,20}$/i; 
		if (!nameChk.test(inputName)) {	
			alert("이름을 확인해주세요");
			return;
		}
		
		var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i; 
		if (!emailChk.test(inputEmail)) {
			alert("이메일을 확인해주세요");
			return;
		}
	
		$.ajax({ 
			url : "find",
			type : "POST",
			data : {"command" : "findId",
					"name" : inputName,
					"email" : inputEmail
					},
			success	: function (data) {
				if(data.result){
					var gotId = $("#_name").val() + "님의 아이디는 '" + data.id +"' 입니다";
					$("#foundId").text(gotId);
					
				}else{
				 	alert("찾으시는 아이디가 없습니다. 이름 또는 이메일을 다시 확인해주세요");
				}
			},
			error : function(){
				
				alert("아이디를 찾는 중 문제가 발생하였습니다. 다시 시도해주십시오")	
			}		
		});
	}

}

function findPw() {
	//alert("확인");
	var inputId = $("#_id").val();
	var inputIdEmail = $("#idEmail").val();

	if(	inputId == "" || inputIdEmail == ""){
		alert("이름 또는 이메일을 입력해주세요")
	}else{
		var idChk = /^[0-9a-zA-Z]{6,20}$/i; 
		if (!idChk.test(inputId)) {
			alert("아이디를 확인해주세요");
			return;
		}
		
		var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i; 
		if (!emailChk.test(inputIdEmail)) {
			alert("이메일을 확인해주세요");
			return;
		}
	
		$.ajax({ 
			url : "find",
			type : "POST",
			data : {"command" : "findPw",
					"id" : inputId,
					"email" : inputIdEmail
					},
			success	: function (data) {
				if(data.result){
					location.href="emailauth?command=emailAuth&id=" + inputId + "&email=" + inputIdEmail;
				}else if(data.result == false){
					alert("아이디 또는 이메일을 다시 확인해주세요.");
				}
			
			},
			error : function(){
				
				alert("아이디를 찾는 중 문제가 발생하였습니다. 다시 시도해주십시오");	
			}		
		});
	}

}
</script>

</body>
</html>