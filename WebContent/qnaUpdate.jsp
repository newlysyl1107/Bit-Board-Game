<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   QnaDto dto = (QnaDto)request.getAttribute("qnaDto"); 
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
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
   <br><p class="subject">Question 수정</p>
</div>

<%
   Object ologin = session.getAttribute("login");
            // request.getSession().getAttribute(name)
   MemberDto mem = null;
   if(ologin == null){            
      %>
      <script type="text/javascript">
         alert("로그인 해 주십시오");
      //   location.href = "login?command=login";
      </script>
      <%
   }
   mem = (MemberDto)ologin;
   //System.out.println("mem : "+mem);

%>

<div align="center" class="container" style="max-width: 800px">
<form id="writeFrm" method="post" >
   <table>
   <colgroup>
   <col width="150"><col>
   </colgroup>
   <!-- col width="150"><col width="600"> -->
   <tbody>
   <tr>   
      <th>아이디</th>
      <td>
         <input type="text" class="form-control" size="50px" name="_id" readonly="readonly" value="<%=dto.getId() %>">
      </td>
   </tr>
   <tr>   
      <th>제목</th>
      <td>
         <input type="text" class="form-control" id="title" size="50px" name="title" value="<%=dto.getTitle() %>" required="required">
      </td>
   </tr>
   <tr>   
      <th>내용</th>
      <td>
         <%-- <textarea rows="15" cols="80" name="content" required="required"><%=dto.getContent() %></textarea> --%>
         <textarea class="form-control" rows="10" id="content" name="content" placeholder="질문" required ><%=dto.getContent() %></textarea>
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
      <!-- 
         <label>
            <input type="checkbox" id="secretChk" >비밀글
            <input type="hidden" id="secret" name="secret" value="0">
         </label> -->
      </td>
   </tr>
   
   </tbody>
   </table>
   <div style="margin-top: 20px; text-align: center">
      
         <!-- <input type="button" onclick="location.href='qnaList'" value="목록"> -->
         <input type="button" class="btn btn-light" onclick="location.href='javascript:history.back()'" value="이전">
         <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
         <input type="button" id="writeBtn" class="btn btn-danger" value="수정하기">
         
         
   </div>
   
   <%-- <button type="button" value="<% session.invalidate(); %>">세션 삭제</button> --%> 
</form>



</div>


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
      $("#writeFrm").attr({"action":"qnaServlet?action=updateAf", "target":"_self"}).submit();      
   }     
});


// 비밀글 선택 처리 (기본:(0) / 비밀글:(1))
$(document).ready(function() {
   $("#secretChk").change(function(){
       if($("#secretChk").is(":checked")){
           $("#secret").val("1");          
           //alert("체크박스 체크했음!");
       }
         /* 
       else{
       //    alert("체크박스 체크 해제!");
          $("#secret").val("2");
       } 
       */
   });
});
</script>
</body>
</html>