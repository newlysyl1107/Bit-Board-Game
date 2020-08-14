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

</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<Br>

<%--페이지 시작. --%>
<div align="center" class="container">
<!-- <br><p class="subject">정보보호를 위해 비밀번호를 입력해주세요</p> -->
	<br><p class="subject">Confirm Password</p>
	<div><input type="password" id="pwd" placeholder="정보보호를 위해 비밀번호를 재확인 합니다" class="form-control" style="width: 500px;text-align: center;"></div>
	<div><button type="button" onclick="pwdcheck()" class="btn btn-outline-secondary" style="margin-top: 15px">비밀번호 확인</button></div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>


<script type="text/javascript">

$("#fail").hide;

function pwdcheck() {
	var pwd = $("#pwd").val();
	
	$.ajax({url: 'memUpdate',
			type:'POST',
			data: {"command" : "pwdcheck",
				   "pwd" : pwd},
			success : function(data){
				if(data.result){
					location.href="memUpdate?command=update"
				} else{
					alert("비밀번호를 다시 확인해주세요");
					$("#pwd").val("");
					$("#pwd").focus;
					
				}	
			},
			error: function(){
				alert("비밀번호를 확인하는 중 문제가 생겼습니다. 다시 시도해주세요.");
			}		
		});
}


</script>
</body>
</html>