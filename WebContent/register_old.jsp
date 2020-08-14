<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%-- GNB --%>
	<div id="gnb"></div>
	<script type="text/javascript">
		$(function() {
			$("#gnb").load("./GNB/gnb.jsp");
		})
	</script>

	<%--페이지 시작. --%>
	<div align="center">
		<h1>회원가입</h1>
		<form id="frm" name="frm" action="addmember" method="post">
			<input type="hidden" name="command" value="addAf">
			<table>
				<col width="150">
				<col width="500">
				<tr>
					<td>아이디:</td>
					<td><input type="text" class="del" id="_id" name="id" placeholder="영문, 숫자 6~20자"
						not_null="true"  correct="true" hg_nm="아이디">
						<button type="button" id="dupl" onclick="idDuplChk()">ID중복체크</button></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="id-notice" id="id-notice">아이디는 영문, 숫자 6~20자로 입력해주세요</div></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" class="del" id="pwd1" placeholder="영문, 숫자, 특수문자 조합 8자리이상"
						name="password" not_null="true" correct="true" hg_nm="비밀번호"></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="pw-notice" id="pw-notice">비밀번호는 영문, 숫자, 특수문자 조합 8자이상으로 입력해주세요</div></td>
				</tr>
				<tr>
					<td>비밀번호 확인:</td>
					<td>
						<input type="password" class="del" id="pwd2" name="passchk">
						
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td>
						<!-- 비밀번호 일치여부 확인문구 -->
						<div class="alert-notice" id="alert-notice">위와 동일한 비밀번호를
							다시한번 입력해주세요.</div>
						<div class="alert alert-success" id="alert-success">비밀번호가
							일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다.</div>
					</td>
				</tr>
				
				<tr>
					<td>이름:</td>
					<td><input type="text" class="del" id="_name" name="name" placeholder=""
						not_null="true" correct="true" hg_nm="이름"></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="name-notice" id="name-notice">이름의 양식이 잘못되었습니다. 다시 확인해주세요.</div></td>
				</tr>
				<tr>
					<td>휴대폰번호:</td>
					<td><input type="text" class="del" id="phoneNum"
						name="call_number" not_null="true" correct="true" hg_nm="휴대폰번호"placeholder="공백없이 숫자만 기입해주세요"></td>
				</tr>
				<tr>
					<td></td>
					<td><div class=phone-notice" id="phone-notice">휴대폰번호 양식이 잘못되었습니다. 다시 확인해주세요.</div></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" class="del" id="_emailFront"
						name="emailFront" not_null="true" correct="true" hg_nm="이메일">@ <input
						type="text" class="del" id="_emailBack" name="emailBack"
						placeholder="직접입력해주세요" value="" not_null="true" correct="true" hg_nm="이메">
						<!-- 이메일 뒷부분 주소 선택 --> 
						<select id="_email">
							<option value="" selected="selected">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
					</select>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<!-- 이메일주소 양식 맞는지 여부 -->
						<div class="alert-wrong" id="_alert-wrong">이메일주소를 다시 확인해주세요</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><br>
						 <button type="button" id="_submit" onclick="register()"
							disabled="disabled">회원가입</button> 
					<!-- <input type="submit" id="_submit" value="회원가입" disabled="disabled"> -->
						<button type="button" id="restart">다시작성</button></td>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		var idck = 0; // id 중복검사 여부 확인
		var checkedId = ""; // 중복검사한 id담을 변수 
	//	var checkAll = true; // form 유효성체크 위한 변수 
		// id 중복체크
		function idDuplChk(){
			var inputId = $("#_id").val();
			//alert(inputId);
			// 아이디 입력 안하고 중복체크 버튼 누른경우 
			if(inputId == ""){
				alert("아이디를 입력해주세요.");
				$("#_id").focus();
			}
			// 아이디 입력한 경우 
			if (inputId != "") {
				// 양식에 맞게 입력하지 않은경우 
				var idChk = /^[0-9a-zA-Z]{6,20}$/i; 
				if (!idChk.test(inputId)) {
					alert("아이디가 양식에 맞지않습니다. 다시 입력해주세요");
				}else{
				// 양식에 맞게 입력한 경우 
					$.ajax({
						type : "POST",
						url : 'idcheck',
						data : {"id" : inputId},
						success : function(data) {
							if (data.result) {
								alert("이미 사용자가 있는 아이디 입니다");
								$("#_id").val("");
								$("#_id").focus();
							} else {
								alert("사용 가능한 아이디 입니다");
								idck = 1;
								checkedId = data.inputId;
								checkAll = true;
							}
						},
						error : function() {
							alert("아이디 중복체크에 문제가 생겼습니다. 다시 시도해주세요");
						}
					});
				}
			}	
		}
				
		$(function () {
			$("#_id").focus();
			
			
			//id 양식확인 
			$("#id-notice").hide();
			$("#_id").blur(function () {	
				var inputId = $("#_id").val();
			//	alert(inputId);
				var idChk = /^[0-9a-zA-Z]{6,20}$/i; 
				if (idChk.test(inputId)) {
					//alert("양식에 맞습니다");
					//checkAll =true;
					$("#id-notice").hide();
				} else if (!idChk.test(inputId)) {
					$("#id-notice").show();
					//alert("양식에 맞지않습니다");
					//checkAll = false;
					//$("#_id").attr('correct', 'false');
				}
	
			});
			
			// 비밀번호 양식확인 
			$("#pw-notice").hide();
			$("#pwd1").blur(function () {	
				var inputPw = $("#pwd1").val();
				// alert(inputPw);
				var pwChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

				if (pwChk.test(inputPw)) {
					//alert("양식에 맞습니다");
					//checkAll = ture;
					$("#pw-notice").hide();
					$("#pwd1").attr('correct', 'true');
				} else if (!pwChk.test(inputPw)) {
					$("#pw-notice").show();
					//alert("양식에 맞지않습니다");
					//checkAll = false;
					$("#pwd1").attr('correct', 'false');
				}
	
			});
			
			// 이름 양식확인 
			$("#name-notice").hide();
			$("#_name").blur(function () {	
				var inputName = $("#_name").val();
				// alert(inputPw);
				var nameChk = /^[가-힣]{2,20}$/i; 
				if (nameChk.test(inputName)) {
					//alert("양식에 맞습니다");
					//checkAll = true;
					$("#name-notice").hide();
					$("#_name").attr('correct', 'true');
				} else if (!nameChk.test(inputName)) {
					$("#name-notice").show();
					//alert("양식에 맞지않습니다");
					//checkAll = false;
					$("#_name").attr('correct', 'false');
				}
	
			});
			
			//휴대폰 번호 양식확인 
				$("#phone-notice").hide();
			$("#phoneNum").blur(function () {	
				var inputPhoneNum = $("#phoneNum").val();
				// alert(inputPw);
				var phoneChk = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/
				if (phoneChk.test(inputPhoneNum)) {
					//alert("양식에 맞습니다");
					//checkAll = true;
					$("#phone-notice").hide();
					$("#phoneNum").attr('correct', 'true');
				} else if (!phoneChk.test(inputPhoneNum)) {
					$("#phone-notice").show();
					//alert("양식에 맞지않습니다");
					//checkAll = false;
					$("#phoneNum").attr('correct', 'false');
				}
	
			});
			
			// 이메일 앞부분 양식에 맞는지 확인
			$("#_alert-wrong").hide();
			//$("#_emailFront").keyup(function() {
			  $("#_emailFront").blur(function () {	
				var inputFront = $("#_emailFront").val();
			//	alert(inputFront);
				var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i; 
				if (emailChk.test(inputFront)) {
				//	alert("양식에 맞습니다");
					$("#_alert-wrong").hide();
					//checkAll = true;
					$("#_emailFront").attr('correct', 'true');
				} else if (!emailChk.test(inputFront)) {
					$("#_alert-wrong").show();
				//	alert("양식에 맞지않습니다");
					//checkAll = false;
					$("#_emailFront").attr('correct', 'false');
				}
			});
			  	//이메일 뒷부분 양식 확인 
				$("#_emailBack").blur(function () {	
					var inputBack = $("#_emailBack").val();
				//	alert(inputFront);
					var emailChk = /^[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/
					if (emailChk.test(inputBack)) {
					//	alert("양식에 맞습니다");
						//checkAll = true;
						$("#_alert-wrong").hide();
						$("#_emailBack").attr('correct', 'true');
					} else if (!emailChk.test(inputBack)) {
						$("#_alert-wrong").show();
					//	alert("양식에 맞지않습니다");
						//checkAll = false;
						$("#_emailBack").attr('correct', 'false');
					}
				});
				
			//이메일 뒷부분 옵션 선택
			$("#_email").change(function() {
				//직접입력
				if ($("#_email").val() == "") {
					$("#_emailBack").val("");
					$("#_emailBack").removeAttr('readonly');
				} else if ($("#_email").val() == "naver.com") {
					// 원래는 value도 attr로 속성 변경 해줄 수 있지만 input text안에 실제 값이 있는 경우
					// 그 값의 우선순위가 attribute인 value="입력값" 보다 높으므로 변경되지 않음. 그래서 직접 val( ) 안에 입력해주어야
					$("#_emailBack").val("naver.com");
					$("#_emailBack").attr('readonly', 'readonly');
				} else if ($("#_email").val() == "gmail.com") {
					$("#_emailBack").val("gmail.com");
					$("#_emailBack").attr('readonly', 'readonly');
				} else if ($("#_email").val() == "hanmail.net") {
					$("#_emailBack").val("hanmail.net");
					$("#_emailBack").attr('readonly', 'readonly');
				}
			});


			
			$("#alert-notice").hide();
			$("#alert-success").hide();
			$("#alert-danger").hide();
			//비밀번호 확인칸에 포커스 이동시 문구 보이도록
			$("#pwd2").focus(function() {
				if ($("#pwd1") != "" && $("#pwd2") == "") {
					//alert("확인")
					$("#alert-notice").show();
				}
			});
			//비밀번호 재입력 제대로 입력했는지 확인문구 띄우기
			$("#pwd2").keyup(function() {
				var pwd2 = $("#pwd2").val();
				var pwd1 = $("#pwd1").val();
				if (pwd1 != "" && pwd2 != "") {
					if (pwd1 == pwd2) { // 비밀번호 일치할때
						$("#_submit").removeAttr("disabled");
						$("#alert-notice").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();

					} else if (pwd1 != pwd2) { // 비밀번호 일치하지 않을때
						$("#alert-notice").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				} else { // 둘중하나라도 입력되지 않았을때
					$("#alert-notice").hide();
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#submit").attr("disabled", "disabled");
				}
			});
			
			//비밀번호 재입력 제대로 입력했는지 확인문구 띄우기
			$("#pwd1").keyup(function() {
				var pwd2 = $("#pwd2").val();
				var pwd1 = $("#pwd1").val();
				if (pwd1 != "" && pwd2 != "") {
					if (pwd1 == pwd2) { // 비밀번호 일치할때
						$("#_submit").removeAttr("disabled");
						$("#alert-notice").hide();
						$("#alert-success").show();
						$("#alert-danger").hide();

					} else if (pwd1 != pwd2) { // 비밀번호 일치하지 않을때
						$("#alert-notice").hide();
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				} else { // 둘중하나라도 입력되지 않았을때
					$("#alert-notice").hide();
					$("#alert-success").hide();
					$("#alert-danger").hide();
					$("#submit").attr("disabled", "disabled");
				}
			});
			

			// 다시작성 클릭시 입력된 정보들 지우기
			$("#restart").click(function() {
				// alert("click");
				$(".del").val("");
				$("#alert-notice").hide();
				$("#alert-success").hide();
				$("#alert-danger").hide();
			});
		
		});
			
			// form 유효성 검사
			function register(){
				//alert("확인");
			 	// id중복검사 여부 확인 
				if(idck == 1 && checkedId == $("#_id").val()){	
					// alert("id 중복검사를 하였습니다");
					if (valchk("#frm")) {
						//모든 항목 입력 되면 회원가입 controller로 이동
						$.ajax({
							url : 'addmember',
							type : "POST",
							data : {"emailFront" : $("#_emailFront").val(),
									"emailBack" : $("#_emailBack").val(),
									"call_number" : $("#phoneNum").val(),
									"command" : "emailCallNumChk"							
									},
							success : function(data){
								if(data.emailChk){
									alert("이미 존재하는 이메일 입니다. 다시 확인해주세요.");	
								} else if(data.callChk){
									alert("이미 존재하는 휴대폰번호 입니다. 다시 확인해주세요.");	
								
								} else if(data.emailChk == false && data.emailChk == false){
									alert("이메일, 번호 확인이 완료되었습니다")
								
									document.getElementById('frm').submit();
								}
							},
							error : function(){
								alert("회원가입에 문제가 생겼습니다. 문제가 지속될시 고객센터로 문의해주십시오");
							}
						
						});	
						
					}
				
				}else{
					alert("아이디 중복검사를 해주세요");
				}
			}

			function valchk(formId) {
				// 입력해야하는 항목 가져오기
				var formObj = $("" + formId + "");
				var objs = formObj.find("[not_null]");

				// alert(objs.length);

				// 항목의 값 검증
				for (var i = 0; i < objs.length; i++) {
					//alert(objs.eq(i).attr('name')+":"+objs.eq(i).attr('correct'));
				
					if (objs.eq(i).val() == '') {
						alert('"' + objs.eq(i).attr("hg_nm") + '"을(를)입력해주십시오');
						objs.eq(i).focus();

						return false;
					}
					
					if (objs.eq(i).attr('correct') == 'false'){
						alert('"' + objs.eq(i).attr("hg_nm") + '"을(를) 양식에 맞게 다시 입력해주십시오');
						objs.eq(i).focus();
						return false;
					}
					
				}
				return true;
			}
			
	
	</script>
</body>
</html>