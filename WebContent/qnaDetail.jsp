<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.QnaCommentDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   QnaDto dto = (QnaDto)request.getAttribute("qnaDto");
   List<QnaCommentDto> commList = (List<QnaCommentDto>)request.getAttribute("commList");
   
   
   int pageNum = 1;
   if(request.getAttribute("pageNum")!=null){
      pageNum=(int)request.getAttribute("pageNum");
   }
   System.out.println("detail !!!!!!!!!!! pageNum : " + pageNum);
   
   
   String enter = "";
   enter = (String)request.getAttribute("enter");
   System.out.println("enter :" + enter);
   
   
   // 댓글 추가 리턴
   String isS = null;
   isS = String.valueOf(request.getAttribute("isS"));
   
   // 댓글 삭제 결과 리턴
   String commDeleteisS = null;
   commDeleteisS = String.valueOf(request.getAttribute("commDeleteisS"));
         
   String qnaAnswerisS = null;
   qnaAnswerisS = String.valueOf(request.getAttribute("qnaAnswerisS"));
   
   
   
   // 게스트의 로그인 세션 처리
   String curSessionId = "";
   String curSessionAuth = "";
   MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
   if(mem != null) {
      curSessionId = mem.getId();
      
      //관리자 페이지에서의 세션처리      
      curSessionAuth = Integer.toString(mem.getAuth());

   }
   
   
%>     


<%-- 시스템 현재 시간(curToday) 추출 --%>
<%--
Date now = new Date();
/* SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss"); */
SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
String today = sf.format(now);
System.out.println("시스템의 현재시간 : " + today);
int curTime = Integer.parseInt(today);
--%>
    
    
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
    color: #545b62;
    padding: 10px;
    background: #ffffff;
    border-bottom: 1px solid #eaeaea;}
   
   .commtd{    
   /* height: 56px; */
    color: #6a6a6a;
   /*  padding: 10px; */
    background: #f6f6f6;
    border-bottom: 1px solid #eaeaea;
    font-weight: normal;
    }
</style>



</head>
<body>


<%-- 세션 ID / Auth 저장--%>
<input type="hidden" value="<%=curSessionId %>" id="sId">
<input type="hidden" value="<%=curSessionAuth %>" id="sAuth">




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






<%-- 댓글 삭제 후처리 --%>
<%
if (commDeleteisS == null){
   
}
else if(commDeleteisS.equals("true")){
%>
   <script type="text/javascript">
      //alert("댓글 삭제 완료")
      location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>+"&pageNum="+<%=pageNum%>+"&enter="+<%=enter%>;
   </script>
<%   
} else if (commDeleteisS.equals("false")){
%>
   <script type="text/javascript">
      alert("댓글 삭제 실패")
      location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
   </script>
<%
} 
%>


<%-- 질문 완료 후처리 --%>
<%
if (qnaAnswerisS == null){
   
}
else if(commDeleteisS.equals("true")){
%>
   <%-- 
   
   <script type="text/javascript">
      //alert("댓글 삭제 완료")
      location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
   </script>
   
    --%>
<%   
} else if (commDeleteisS.equals("false")){
%>
   <script type="text/javascript">
      alert("완료 처리 실패")
      location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
   </script>
<%
} 
%>



<div align="center">

<%-- <input type="button" class="btn btn-light" onclick="returnList(<%=pageNum%>,'<%=enter %>')" value="목록 돌아가기"> --%>
</div>



<div align="center" class="container" style="max-width: 850px">
<form action="">
   <table>
   <colgroup>
   <col width="150"><col>
   </colgroup>
   <!-- <col width="150"><col width="600"> -->

   
   <%-- ===== 상단 메뉴 버튼 ===== --%>
   <%--   if(mem != null && ( dto.getId().equals(mem.getId()) || mem.getAuth() == 1)) { --%>
   <%   if(mem != null && (dto.getId().equals(mem.getId()) || mem.getAuth() ==1 ) ) { %>
   <tr>
      <td colspan="2">
         <div align="right" id="buttonDiv">
            <button type="button" class="btn btn-light" onclick="qnaUpdate(<%=dto.getSeq() %>)">수정</button>
            <button type="button" class="btn btn-light" onclick="qnaDelete(<%=dto.getSeq() %>)">삭제</button>
            <input type="button" class="btn btn-light" onclick="returnList(<%=pageNum%>,'<%=enter %>')" value="목록 돌아가기">      
            
            <% if(mem.getAuth()==1 && dto.getIs_answer() == 0) { %>
                  <button type="button" class="btn btn-light" onclick="qnaAnswerEnd(<%=dto.getSeq() %>,<%=pageNum%>,'<%=enter%>')">답변 완료 전환</button>
               <% } else if (mem.getAuth()==1 && dto.getIs_answer() == 1) { %>
                  <button type="button" class="btn btn-light" onclick="qnaAnswerWait(<%=dto.getSeq() %>,<%=pageNum%>,'<%=enter%>')">답변 대기 전환</button>
               <% } %>
            
            <%-- <button type="button" onclick="qnaComment(<%=dto.getSeq() %>)">댓글</button> --%>
            <%-- <button type="button" onclick="test()">test</button> --%>
         </div>   
      </td>
   </tr>
   <% } else { // if 끝 %>
   <tr>
      <td colspan="2">
         <div align="right" id="buttonDiv">
            <input type="button" class="btn btn-light" onclick="returnList(<%=pageNum%>,'<%=enter %>')" value="목록 돌아가기">      
         </div>   
      </td>
   </tr>
   <% } %>
   <tr>   
      <th>아이디</th>
      <%-- <td><input type="text" readonly="readonly" value="<%=dto.getId() %>"></td> --%>
      <td><%=dto.getId() %></td>
   </tr>
   <tr>   
      <th>작성일</th>
      <%-- <td><input type="text" readonly="readonly" value="<%=dto.getWdate() %>" ></td> --%>
      <td><%=dto.getWdate().substring(0, 13) %>시 <%=dto.getWdate().substring(14, 16) %>분</td>
   </tr>
   <tr>   
      <th>조회수</th>
      <%-- <td><input type="text" readonly="readonly"><%=dto.getReadcount() %></td> --%>
      <td><%=dto.getReadcount() %> 회</td>
   </tr>
   <tr>   
      <th>제목</th>
      <%-- <td><input type="text" readonly="readonly"><%=dto.getTitle() %></td> --%>
      <td><%=dto.getTitle() %></td>
   </tr>
   <tr>   
      <th>내용</th>
      <%-- <td><input type="text" readonly="readonly"><%=dto.getContent() %></td> --%>
      <td>
      <textarea cols="80" rows="9" class="form-control" style="overflow:auto" readonly="readonly"><%=dto.getContent() %></textarea>
      <%-- <%=dto.getContent() %> --%>
      </td>
   </tr>
   </table> 
</form>

</div>



<%-- ============= 댓글 출력 시작 ============= --%>
<%-- <% if(dto.get) %> --%>

<!-- <h3>댓글</h3> -->
<br>
<div class="container" style="max-width: 850px">
<!-- <hr> -->
<table>

   <tbody>
   
   <col width="130"><col width="500"><col width="150"><col width="100">
   <!-- <tr>
     <th>작성자</th><th>내용</th><th>작성일</th><th>버튼부</th>
   </tr> -->
<% if(commList == null || commList.size() == 0){ %>
   <tr>
      <td>작성된 추가 질문이 없습니다</td>
   </tr>
<% } else {
   for(int i = 0;i < commList.size(); i++){
      QnaCommentDto commDto = commList.get(i);
      
      //System.out.println(commDto.getContent());
%>
   <tr>
      <%-- <th><%=i+1 %></th> --%>
   <% if(commDto.getDel() == 0) { %>
      <% if( commDto.getId().equals("aa") || commDto.getId().equals("admin")) { %>
      <%-- ============================ 수정필요 ============================ --%>
         <td align="right">관리자 :　</td>
      <%} else { %>
         <td  align="right"><%=commDto.getId() %> :　</td>
      <% } %>
      
      
      <td><%=commDto.getContent() %></td>
      
      
      
      <%-- 
      작성일(wDate)을 잘라서 년월일 추출 yyMMdd
      <%
        String s1 = commDto.getWdate().substring(2,10);
        String p1 = "[-]";
        String[] sArray1 = s1.split(p1);
        String wDateStr = "";
        for( int j = 0; j < sArray1.length; j++ ){
           wDateStr += sArray1[j].trim();
        }
        //System.out.print("스플릿으로 자른 날짜" +sArray1[j].trim());
        System.out.println("스플릿으로 자른 날짜 : " + wDateStr);
        int wDate = Integer.parseInt(wDateStr);
      %>
      
      <% if(wDate < curTime) { %>
         <td align="center"><%=commDto.getWdate().substring(2,11) %></td>
      <% } else { %>
         <td align="center"><%=commDto.getWdate().substring(11,13) %> : <%=commDto.getWdate().substring(14,16) %></td>
      <% } %>
       --%>
      
      <td align="center"><%=commDto.getWdate().substring(5,16) %> </td> 
      
      
      <%   if(mem != null && ( commDto.getId().equals(mem.getId()) || mem.getAuth()==1 ) ) { %>
         <td><button type="button" class="btn btn-light" onclick="commDelete(<%=commDto.getSeq() %>, <%=dto.getSeq()%>,<%=pageNum%>,'<%=enter%>')">삭제</button></td>
      
      
      <%} %>
      
   <% } %>
   
   <%-- 
   
   else { %>
      <td>
          <font color="#ff0000">질문을 삭제하였습니다.</font>
      </td> 
      <% } %>
      
      
       --%>
      
   </tr>
      
<% 
   }
}
%>
</tbody>
</table>





<%-- ============= 댓글 작성 부분 시작 ============= --%>

<table>
<%-- 작성자 댓글 부분 --%>
<%   if(mem != null && ( dto.getId().equals(mem.getId()) ) && mem.getAuth() == 0 ) { %>
   <tr align="center">
      <td>
         <input type="text" id="comment" name="comment" size="80px" required="required">
         <button type="button" id="commWrite" class="btn btn-light" onclick="commWrite(<%=dto.getSeq() %>,<%=pageNum%>,'<%=enter%>')">질문추가</button>
      </td>
      <%-- <td>
         <div align="center">
            <button type="button" class="btn btn-secondary" onclick="commWrite(<%=dto.getSeq() %>,<%=pageNum%>)">질문추가</button>
            <!-- <button type="button" onclick="test()">test</button> -->   
         </div>         
      </td> --%>
   </tr>
<% } // if 끝 %>   








<%-- 관리자 답변 부분 --%>
<%   if(mem != null && ( mem.getAuth() == 1 ) ) { %>
   <tr align="center">
      <td>
         <input type="text" id="comment" name="comment" size="80px" required="required">
         
            <button type="button" id="commWrite" class="btn btn-light" onclick="commWrite(<%=dto.getSeq() %>,<%=pageNum%>,'<%=enter%>')">답변 작성</button>
            <!-- <button type="button" onclick="test()">test</button> -->   
         
      </td>
      <td><%-- 
         <div align="center">
            <button type="button" onclick="commWrite(<%=dto.getSeq() %>,<%=pageNum%>)">답변 작성</button>
            <!-- <button type="button" onclick="test()">test</button> -->   
         </div>    --%>      
      </td>
   </tr>
<% } // if 끝 %>   
</table>

</div>
 
<br><br><br><br><br>

<%--추가 보류!--%>

<%--관리자 미응답 리스트 넘어가기 
<%   if(mem != null && ( mem.getAuth() == 1 ) ) { %>
   <a href="auth?command=noAnswer">미응답 Q & A 리스트로 돌아가기</a> 


<% } // if 끝 %>   

--%>


<footer id="ft">
   <div id="footer"></div>
   <script type="text/javascript">
   $(function () {
      $("#footer").load("./GNB/footer.jsp");
   })
   </script>
</footer>



<script type="text/javascript">
$(document).ready(function () {
   var height_size = $(document).height();
   var h2_size = window.outerHeight;
   
   if (height_size <= h2_size) {
      $("#ft").attr('style', 'top: 940px; position: absolute; width: 100%')
   }else {
      
   }
   //alert(height_size);
   //alert(h2_size);
   
   
});
</script>

<script type="text/javascript">
function returnList(pageNum, enter) {
   //alert("디테일 pageNum : " + pageNum);
   //alert("enter : " + enter);
   if(enter=="qnaPublic") {   
      location.href="qnaServlet?action=list&pageNumber="+pageNum;
   } else {
      location.href="auth?command=noAnswer&pageNum="+pageNum;
   }   
}


</script>

<script type="text/javascript">
var testbutton = 0;
// 질문 수정 함수
function qnaUpdate(seq) {
   var result = confirm("질문을 수정 합니다.")
   if(result) {
      location.href = "qnaServlet?action=update&seq="+seq;
   } else {
      
   }
   
}

// 질문 삭제 함수
function qnaDelete(seq) {
   var result = confirm("질문을 삭제 합니다.")
   if(result) {
      location.href = "qnaServlet?action=delete&seq="+seq;
   } else {
      
   }
   
}

//질문 답변 완료 함수
function qnaAnswerEnd(seq, pageNum, enter) {
   var result = confirm("답변을 완료로 전환 합니다.")
   if(result) {
      location.href = "qnaServlet?action=answerEnd&seq="+seq+"&pageNum="+pageNum+"&enter="+enter;
   }
}

//질문 답변 대기 함수
function qnaAnswerWait(seq,pageNum, enter) {
   var result = confirm("답변 대기 상태로 되돌립니다.")
   if(result) {
      location.href = "qnaServlet?action=answerWait&seq="+seq+"&pageNum="+pageNum+"&enter="+enter;
   } 
}




// 댓글 작성 함수
function commWrite(seq, pageNum, enter) {
   //alert("seq : " + seq);
   //alert("pageNum : " + pageNum);
   
   var comment = $("#comment").val().trim();
   var commId = $("#sId").val();
   if(comment == "") {
      alert("내용을 입력해주세요");
      $("#comment").focus();
   } else {
   
   //alert(comment);
   
   //alert(commId)
   //alert(comment);
   //alert(commId);
   var result = confirm("댓글을 추가 합니다.")
   if(result) {
      location.href = "qnaServlet?action=commentAf&seq="+seq+"&comment="+comment+"&commId="+commId+"&pageNum="+pageNum+"&enter="+enter;
   } 
   }
}

// 댓글 삭제 함수
function commDelete(commSeq, qnaSeq, pageNum, enter) {
   var result = confirm("댓글을 삭제 합니다.")
   if(result) {
      location.href = "qnaCommServlet?action=commDelete&commSeq="+commSeq+"&qnaSeq="+qnaSeq+"&pageNum="+pageNum+"&enter="+enter;
   } else {
      
   }
}

/* 
function test() {
   alert("test");
   if(testbutton == 0) {
      testbutton++;
      $("#testtest").append("<input type='text' id='inputtext'>");
   }else {
      alert($("#inputtext").val())
   }
}
 */
</script>


</body>
</html>