<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<QnaDto> list = (List<QnaDto>)request.getAttribute("searchList");
System.out.println("qnaSerchList.jsp 호출");

String curSession = "";

MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
if(mem != null) {
	curSession = mem.getId();
}
%>  

<%
// 검색 실행 후 필터, 검색어 저장
String rsChoice = request.getParameter("choice");
String rsWord = request.getParameter("searchWord");

System.out.println("searchView Choice : " + rsChoice);
System.out.println("searchView Word : " + rsWord);

%>
<!-- 
// 검색 필터 확인되지 않을때 [선택]으로 설정 (최초 실행 초기화)
if(choice == null || choice.equals("")){
	choice = "sel";
	System.out.println("검색 초기화 1");
}
// 검색 필터 [선택]일때 검색어 넘어오면 초기화
if(choice.equals("sel")){
	searchWord = "";
	System.out.println("검색 초기화 2");
}
// 검색어 없을때 초기화
if(searchWord == null){
	searchWord = "";
	choice = "sel";
	System.out.println("검색 초기화 3");
}
%>
 -->




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%-- 검색후 필터와 검색어 저장 --%>
<script type="text/javascript">
$(document).ready(function () {
	var _choice = '<%=rsChoice %>';
	var _searchWord = '<%=rsWord %>';
	if(_choice != '' && _choice != 'sel'){		
		if(_searchWord != ""){			
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});
</script>


<%--페이지 시작. --%>
<h1>QNA 페이지</h1>

<div align="center">
<table border="1">
<col width="70"><col width="500"><col width="100"><col width="100"><col width="150"><col width="100">
<tr>
   <th>No</th><th>제목</th><th>작성자</th><th>답변유무</th><th>작성일</th><th>글 구분</th>
</tr>

<% if(list == null || list.size() == 0){ %>
	<tr>
		<td colspan="6">검색된 글이 없습니다</td>
	</tr>
<% } else {
	for(int i = 0;i < list.size(); i++){
		QnaDto dto = list.get(i);
%>
	<tr>
		<th><%=i+1 %></th>
	<% if(dto.getDel() == 0) { %>	
			<td>
				<%-- <a href="qnadetail?seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a> --%>
				<%-- <a href="qnaServlet?action=detail&seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a> --%>
				<%-- <a href='javascript:void(0);' onclick="userChek(<%=dto.getIs_secret() %>, '<%=dto.getId() %>')"><%=dto.getTitle() %></a> --%>
				<a href='#' onclick="userChek(<%=dto.getIs_secret() %>, '<%=dto.getId() %>', <%=dto.getSeq() %>)"><%=dto.getTitle() %></a>
				<input type="hidden" value="<%=curSession %>" id="getid">
			</td>		 
	<% } else { %>
		 	<td>
		 		<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font>
		 	</td> 
	<% } %>	
		 
		<%-- 작성자 ID --%> 	 
		<td align="center"><%=dto.getId() %></td>
		
		<%-- 답변상태 --%>
		<% if(dto.getIs_answer() == 0) { %>
			<td align="center">답변대기</td>
		<% } else { %>
			<td align="center">답변완료</td>
		<% } %>
		
		<%-- 작성일 --%>
		<td align="center"><%=dto.getWdate().substring(0,10) %></td>
		
		<%-- 글 구분 --%>
		<% if(dto.getIs_secret() == 0) { %>
			<td align="center">공개</td>
		<% } else { %>
			<td align="center">비공개</td>
		<% } %>

	</tr>
	<%
	} // for문 마지막
}
%>


</table>
<!-- <input type="button" onclick="location.href='qnaWrite?action=write'" value="등록하기"> -->
<input type="button" onclick="QnaWrite()" value="등록하기">
</div>

<%-- 검색창 시작 --%>
<div align="center">
	<form action="qnaServlet?action=searchList" method="post">
	<select id="choice" name="choice">
	   <!-- <option value="sel">선택</option> -->
	   <option value="title">제목</option>
	   <option value="writer">작성자</option>
	   <option value="content">내용</option>
	</select>
	
	<input type="text" id="search" name="searchWord" required="required">
	<input type="submit" value="검색">
	</form>
</div>


<script type="text/javascript">
// Qna 등록하기 선택시 세션id 확인 후 처리
function QnaWrite() {
	<% if(mem == null || mem.getId().equals("")){ %>
		alert("QnA는 로그인 후 작성 하실 수 있습니다.");
		location.href = "login?command=login";
	<% } else {	%>
		location.href = "qnaServlet?action=write";
	<% } %>
}

// Qna 글 열람시 유저&비밀글 확인 처리
function userChek(is_secret, id, seq) {
	var curSession = $("#getid").val();
	if(<%=mem == null %>) {
		if(is_secret == 0) {
			// 게스트가 일반글 열람 -> 상세 보기 연결
			location.href = "qnaServlet?action=detail&seq="+seq;
		}else if (is_secret == 1){
			// 게스트가 비밀글 열람 -> 로그인 페이지 연결
			alert("로그인이 필요합니다.");
			location.href = "login?command=login";
		}
	}else if(<%=mem != null %>){
		if(is_secret == 0){
			// 로그인 이후 모든 유저 일반글 열람 -> 상세글 보기 연결
			location.href = "qnaServlet?action=detail&seq="+seq;
		}else if((is_secret == 1) && (id != curSession) ) {
			// 사용자와 작성자 다르고 비밀글 열람 -> 경고창
			alert("비공개 글은 작성자만 확인 할 수 있습니다.");
		} else {
			// 사용자와 작성자 같고 비밀글인 경우 -> 상세글 연결
			//alert("추가 예외 확인");
			location.href = "qnaServlet?action=detail&seq="+seq;
		}
	}
}
</script>






</body>
</html>