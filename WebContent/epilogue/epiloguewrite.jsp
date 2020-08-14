<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>epilogueswrite.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>

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

</head>
<body>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem == null){
	response.sendRedirect("login.jsp");
	%>
	<script type="text/javascript">
	location.href = "";
	</script>
	<%
}
%>  

<a href="logout.jsp">로그 아웃</a>
<h1>후기를 남겨 주세요.</h1>

<div  style="height: 100%; width: 100%">
<form id="frm" action="epiloguewriteAf.jsp" method="post" >
<table width = "100%">
	<tr>
	<th>작성자</th>
	<td>
		<input type="text" name="id" size="50px" value=${ login.id } readonly="readonly">
	</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" id="title" name="title" size="110px"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td> 
			<textarea rows="10" cols="30" id="ir1" name="ir1" style="width:766px; height:412px; "></textarea>
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
	</tr>
	<tr align = "center">
		<td colspan="2">
			<input type="submit" id="save" value="저장" onclick="fOnAppLoad(this)"/>
			<input type="button" value="취소" onclick="location.href='epiloguelist.jsp'"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>




