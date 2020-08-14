<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style type="text/css">

   table, tr, td {
       border-collapse: separate;
       border-spacing: 0px;
   }
   table {
           width: 100%;
   border-top: 1px solid #eaeaea;
   }
    
    th {
    text-align: center;
   height: 56px;
    color: #6a6a6a;
    padding: 10px;
    background: #f6f6f6;
    border-bottom: 1px solid #eaeaea;
   
    }
   
   td {
   height: 56px;
    color: #9a9a9a;
    padding: 10px;
    background: #ffffff;
    border-bottom: 1px solid #eaeaea;}
   
/*    
   height: 56px;
    color: #6a6a6a;
    padding: 10px;
    background: #f6f6f6;
    border-bottom: 1px solid #eaeaea;
    font-weight: normal; */
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

<div class="container">
   <br><p class="subject">Question</p>
</div>

<%-- =============== 로그인 세션 호출 =============== --%>
<%
   Object ologin = session.getAttribute("login");
            // request.getSession().getAttribute(name)
   MemberDto mem = null;
   if(ologin == null){            
      %>
      <script type="text/javascript">
         alert("로그인 해 주십시오");
         location.href = "login?command=login";
      </script>
      <%
   }
   mem = (MemberDto)ologin;
%>







<%-- =============== QnA 작성 시작 =============== --%>
<div align="center" class="container" style="max-width: 800px">
<form id="writeFrm" method="post">
<!-- <form id="writeForm" method="post"> --> 
   <table>
   <colgroup>
   <col width="150"><col>
   </colgroup>
   <tbody>
   <tr>
      <th>아이디</th>
      <td>
         <input type="text" class="form-control" name="_id" size="50px" readonly="readonly" value="<%=mem.getId() %>">
         <%-- <input type="text" name="id" size="50px" value=${login.id } readonly="readonly"> --%>
         <!-- <input type="text" id="_id" name="_id" required> -->
      </td>
   </tr>
   <tr>
      <%-- =============== 이메일 전송 확인 요 =============== --%>
      <th>이메일</th>
      <td>
         <input type="text" class="form-control" name="email"size="50px" readonly="readonly" value="<%=mem.getEmail() %>">
         <!-- <input type="text" id="email" name="email" maxlength="50" placeholder="이메일" required> -->
         <!-- maxlength="50" 필드 최대 문자 갯수 50자 -->
      </td>
   </tr>
   <tr>
      <th>제목</th>
      <td>
         <input type="text" class="form-control" id="title" name="title" size="50px" maxlength="50" placeholder="제목 (최대 50자)" required>
      </td>
   </tr>
   <tr>
      <th>내용</th>
      <td>
         <textarea class="form-control" rows="10" id="content" name="content" placeholder="질문" required ></textarea>
      </td>
   </tr>
   <tr>
      <th>옵션</th>
      <td>
         <div class="custom-control custom-checkbox">
           
             <input type="checkbox" class="custom-control-input" id="secretChk" > 
            <input type="hidden" id="secret" name="secret" value="0">
            <label class="custom-control-label" for="secretChk">비밀글</label>
          
         </div>
      </td>
   </tr>
   </tbody>
   </table>
   
   <div style="margin-top: 20px; text-align: center">
      <input type="button" id="writeBtn"  value="등록하기" class="btn btn-danger" style="width: 150px">
      <!-- <input type="button" class="btn btn-outline-danger" onclick="QnaWrite()" value="QnA 등록하기"> -->
   </div>
   
</form>
</div>

<br><br><br><br>

<footer>
   <div id="footer"></div>
   <script type="text/javascript">
   $(function () {
      $("#footer").load("./GNB/footer.jsp");
   })
   </script>
</footer>






 
<script type="text/javascript">

$("#writeBtn").click(function() {   
   if( $("#title").val().trim() == "" ){
      alert("제목을 입력해 주십시오");
      $("#title").focus();
   }
   else if( $("#content").val().trim() == "" ){
      alert("내용을 입력해 주십시오");
      $("#content").focus();
   }
   else{
      $("#writeFrm").attr({"action":"qnaServlet?action=writeAf", "target":"_self"}).submit();      
   }    
});






<%-- =============== 비밀글 선택 처리 =============== --%>
// 비밀글 선택 처리 (기본:(0) / 비밀글:(1))
$(document).ready(function() {
   $("#secretChk").change(function(){
       if($("#secretChk").is(":checked")){
           $("#secret").val("1");          
       //    alert("체크박스 체크했음!");
       }
         /* 
       else{
       //    alert("체크박스 체크 해제!");
          $("#secret").val("2");
       } 
       */
   });
});


<%-- =============== QnA 등록 확인창 임시 제거 =============== --%>
/* 
$("#writeBtn").click(function () {
   var result = confirm("QnA를 등록 합니다.")
   if(result) {
      $("#writeForm").attr("action", "qnaServlet?action=writeAf")
   } else {
      
   }
});
*/
</script>
</body>
</html>