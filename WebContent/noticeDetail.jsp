<%@page import="java.util.ArrayList"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="MainAndNotice.NoticeDAO"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    <%
    // 한글 깨짐 방지
    request.setCharacterEncoding("utf-8");
    %>
    
    
    <%
    // 세션 정보 가져오기
    MemberDto sessionDto = (MemberDto)session.getAttribute("login");
    %>
    
    <%
    // DetailServlet 에서 packing 해온 Attribute
    NoticeDto dto = (NoticeDto)request.getAttribute("dto");
    %>
    
    
    <%
    // notice 에서 넘어온 sequence
   	int seq = dto.getSeq();
    System.out.println("Detail seq = " + seq);
    
    /* String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    System.out.println("Detail title = " + title);
    System.out.println("Detail content = " + content); */
    %>
    
    <%
    
    // singleton
    NoticeDAO dao = NoticeDAO.getInstance();
    
    // dto 에 메소드를 통해 글 상세정보 담기
    NoticeDto methodDto = dao.noticeDetail(seq);
    
    
    // 이전글, 다음글
//  NoticeDto pre = dao.preNotice(seq);
//  NoticeDto post = dao.postNotice(seq);
    
//  System.out.println("이전글=" + pre.getSeq());
//  System.out.println("다음글=" + post.getSeq());
    
    
    // 아이디가 일치할경우에만 수정 삭제가 가능하도록 세션에서 정보를 가져온다.
    MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
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
<br><br>





<%-- 페이지 시작 --%>

<div align = "center">
<!-- 이전글, 다음글로 이동하기 -->
<%
List<NoticeDto> list = new ArrayList<NoticeDto>();
list.add(dto);
%>

<a href = "noticeDetail?command=post&seq=<%=seq %>"> <button class="btn btn-outline-primary"> 이전글 </button></a>
<a href = "noticeDetail?command=pre&seq=<%=seq %>"> <button class="btn btn-outline-primary" style = "margin-left:800px"> 다음글 </button> </a>

<br><br>

<div style = "padding-left:400px; padding-right:400px">
<div class= "card text-center">
	<div class="card-header">
		<p class="h4"><%=dto.getTitle() %></p>
	</div>
	<div class="card-body">
		<p class="card-text"> <%=dto.getContent() %> </p>
	</div>
	<div class="card-footer text-muted">
		<b>조회수</b> <%=dto.getReadcount() %> <br>
		<b>작성자</b> <%=dto.getId() %> <br>
		<b>작성일</b> <%=dto.getWdate() %>
	</div>
</div>
</div>

<% System.out.println(dto.getContent()); %>






<form action = "noticeUpdate">
<input type = "hidden" name = "title" value = "<%=dto.getTitle() %>">
<input type = "hidden" name = "content" value = '<%=dto.getContent() %>'>
</form>


<br><br><br>

<!-- 수정, 삭제 기능 -->

<%

	Object oLogin = session.getAttribute("login");
	MemberDto m = null;
	if (oLogin == null) {
		
	} else {
		m = (MemberDto) oLogin;
		 if(m.getId().equals("aa") || m.getId().equals("Admin")) {
			 System.out.println("id = " + m.getId());
	

%>

	<button onclick = "updateNotice(<%=dto.getSeq() %>)" class="btn btn-outline-primary"> 수정 </button> &nbsp;&nbsp;
	<button onclick = "deleteNotice(<%=dto.getSeq() %>)" class="btn btn-outline-primary"> 삭제 </button> &nbsp;&nbsp;
	
	
	<%
		 }
	%>
	
<%
	}
%>	

<!-- 공지사항 리스트로 돌아가기 -->
	<button type= "button" onclick = "location.href='noticeList?command=page&pageNumber=0'" class="btn btn-outline-primary"> 목록 </button>
	
	<br><br><br><br><br><br>
</div>


<script type = "text/javascript">

function updateNotice(seq, title, content) {
	location.href = "noticeUpdate?seq=" + seq + "&command=noticeUpdate&title=" + title + "&content=" + content;
																					
}

function deleteNotice(seq) {
	location.href = "noticeDelete?seq=" + seq;
}


</script>

<br><Br>

<footer id="ft">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>

</body>
</html>