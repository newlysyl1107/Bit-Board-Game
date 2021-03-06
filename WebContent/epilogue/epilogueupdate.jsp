<%@page import="dto.MemberDto"%>
<%@page import="dto.EpilogueDto"%>
<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<title>epilogueupdate</title>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<script>
$(document).ready(function(){
	$("#save").click(function(){		
		alert("save click");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		alert(document.getElementById("ir1").value);
		$("#frm").submit();		
	})
})
</script>


<style type="text/css">
table.type02 {
 	border-collapse: separate;
    border-spacing: 0;
    text-align: left;
	line-height: 1.0;
    border-top: 1px solid white;
    border-left: 1px solid white;

}
table.type02 th {
    /* width: 150px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid white;
    border-bottom: 1px solid white;
    border-top: 1px solid white;
    border-left: 1px solid white;
    background: #eee;
    text-align: center;
}
table.type02 td {
    /* width: 350px; */
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid white;
    border-bottom: 1px solid white;
}
</style>


</head>
<body>

<h1>글 수정</h1>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

EpilogueDao dao = EpilogueDao.getInstance();
EpilogueDto epilogue = dao.getEpilogue(seq);
%>

<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%>



<form id="frm" action="epilogueupdateAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table class="type02">
<col width="150"><col width="500"> 

<tr style="border:none">
	<th align="center">아이디</th>
	<td>
		<input style="border:none" type="text" name="id" readonly="readonly"  value=${ login.id }> 		
	</td>	
</tr>

<tr>
	<th align="center">제목</th>
	<td>
		<input style="border:none" type="text" name="title" size="100%" value="<%=epilogue.getTitle() %>">		
	</td>
</tr>

<tr>
	<th align="center">수정할 내용</th>
	<td align="center"> 
			<textarea rows="10" cols="30" id="ir1" name="ir1" style="width:100%; height:412px;" ></textarea>
			
			<script type="text/javascript">			
				var oEditors = [];										
				$(function(){
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
<%-- 	
	<td align="center">
	<textarea rows="10" cols="90" readonly="readonly"><%=epilogue.getContent() %></textarea>
	   <div contentEditable="true" image="visible" name="content" rows="10" cols="90" readonly="readonly"><%=epilogue.getContent() %></div>
	</td>
--%>
										
</tr>
<tr>
	<td colspan="2" align="right">
		<input type="submit" id="save" value="수정" onclick="fOnAppLoad(this)">
		<input type="button" value="취소" onclick="location.href='epiloguelist.jsp'"/>
	</td>
</tr>
</table>
</form>
</body>
</html>