
<%@page import="MainAndNotice.NoticeDAO"%>
<%@page import="dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%
   
   String sseq = request.getParameter("seq");
   int seq = Integer.parseInt(sseq);
   
   NoticeDAO dao = NoticeDAO.getInstance();
   
   NoticeDto dto = dao.noticeDetail(seq);
   
   %>
   
   <%
   request.setCharacterEncoding("utf-8");
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<script>
$(document).ready(function(){
   $("#save").click(function(){      
      //alert("save click");
      oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
      //alert(document.getElementById("ir1").value);
      $("#frm").submit();      
   })
})
</script>


</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
   $("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%-- <form action = "noticeUpdate">
   <input type = "hidden" name = "command" value = "noticeUpdate">
   <input type = "hidden" name = "seq" value = "<%=dto.getSeq() %>">
</form>
<br><br><br>
<div align = "center">
   <table>
      <tr>
         <td> 제목 <input type = "text" name = "title"> </td>
      </tr>
      <tr>
         <td> 내용 <textarea cols = "40" rows = "50"> </textarea> </td>
      </tr>
   </table>
</div> --%>


<%-- !!!!!!!!!! 수정 본문 시작! --%>
<div align="center" class="container">
   <br><p class="subject">공지사항 수정</p>
   
</div>

<div align = "center" class="container">
<form id = "frm" action = "noticeUpdate" method = "post">
   <input type = "hidden" name = "command" value = "noticeUpdateAf">
      <!-- <br><br><br><br> -->
       <br>
       <input type = "text" class="form-control" id = "title" name = "title" style = "width : 660px;"  value = "<%=dto.getTitle() %>">
       
         <input type = "hidden" name = seq value = "<%=dto.getSeq() %>">
      <table width="700px" height="300px">
         <tr><br>
            <!-- <td></td> -->
            <td align="center">
               <textarea rows="10" cols="30" id= "ir1" name = "ir1" style="width:690px; height:350px; align:center"><%=dto.getContent() %></textarea>
               <input type = "hidden" name= "wDate">
               <script type = "text/javascript">
                  var oEditors = [];
                  $(function() {
                     nhn.husky.EZCreator.createInIFrame({
                        oAppRef: oEditors,
                        elPlaceHolder: "ir1",
                        //SmartEditor2Skin.html 파일이 존재하는 경로
                        sSkinURI:"editor/SmartEditor2Skin.html",
                        
                        htParams:{
                           // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                           bUseToolbar:true,            
                           // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                           bUseVerticalResizer:true,      
                           // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                           bUseModeChanger:true,         
                           fOnBeforeUnload:function(){                     
                           }
                        }, 
                        fOnAppLoad:function(){                  
                           //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
                           oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
                        },
                        fCreator:"createSEditor2"
                     });
                     });   
               </script>
            </td>
         </tr>
         <tr>
            <td colspan ="2" align = "center">
            <br>
               <input type = "button" id = "save" value = "저장" onclick="fOnAppLoad(this)" class="btn btn-outline-success" style="width: 100px">
               <input type = "button" onclick = "location.href='javascript:history.back()'" value = "취소" class="btn btn-outline-warning" style="width: 100px">
            </td>   
         </tr>
      </table>
</form>
</div>


</body>
</html>