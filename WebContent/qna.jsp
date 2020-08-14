<%@page import="java.util.Date"%>
<%@page import="qna.QnaCommentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 페이징 시작 */

int pageNumber = (int)request.getAttribute("pageNumber");
/* System.out.println("뷰에서의 pageNumber : " + pageNumber); */
// 총 게시글의 갯수에 따른 페이지의 갯수
int qnaPage = (int)request.getAttribute("qnaPage");
/* System.out.println("뷰에서의 qnaPage : " + qnaPage); */

// 리스트 호출
List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnaList");
List<QnaDto> qnaNoticeList = (List<QnaDto>)request.getAttribute("qnaNoticeList");
/* System.out.println("뷰에서 리스트 호출"); */

// 게스트의 로그인 세션 처리
String curSessionId = "";
String curSessionAuth = "";
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
if(mem != null) {
	curSessionId = mem.getId();
	curSessionAuth = Integer.toString(mem.getAuth());
	// 세션 처리를 Title에서	
} else {
	System.out.println("======= mem 세션 Null 들어옴");
}

String choice = (String)request.getAttribute("choice");
/* System.out.println("뷰에서의 choice : " + choice); */
String searchWord = (String)request.getAttribute("searchWord");
/* System.out.println("뷰에서의 searchWord : " + searchWord); */

QnaCommentDao qcDao = QnaCommentDao.getInstance();

%>


<%-- 시스템 현재 시간(curToday) 호출 --%>
<%
	Date now = new Date();
	/* SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss"); */
	SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
	String today = sf.format(now);
	/* System.out.println("시스템의 현재시간 : " + today); */
	int curTime = Integer.parseInt(today);
%>

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

a {color: #000000;}
a:hover {text-decoration: none; color: #000000;}
/* img {vertical-align: sub;} */

.badge.badge-secondary {display: unset; padding:0.3em 0.8em; vertical-align: bottom;}
.badge.badge-warning {color:#fff; background-color:#ff7307; display: unset; padding:0.3em 0.8em; vertical-align: bottom;}
.badge.badge-info {display: unset; padding:0.3em 0.8em; vertical-align: bottom;}



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



<%-- 검색 처리 --%>
<script type="text/javascript">
$(document).ready(function () {
	var _choice = '<%=choice %>';
	var _searchWord = '<%=searchWord %>';
	if(_choice != '' && _choice != 'sel'){		
		if(_searchWord != ""){			
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});
</script>





<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">Question & Answer</p>
</div>



<!-- 테이블 div 시작 -->
<div align="center" class="container"> 


<!-- <table border="1"> -->
<table class="table table-hover">
<!-- <table class="table table-bordered"> --> <!-- 줄있음 test용-->
<col width="60"><col width="400"><col width="100"><col width="100"><col width="100">
	<thead align="center">
		<tr>
		   <th>No</th><th>제목</th><th>글쓴이</th><th>진행</th><th>작성일</th><!-- <th>글 구분</th> -->
		</tr>
	</thead>


	<tbody>
<% if(list == null || list.size() == 0){ %>
	<tr>
		<td colspan="6">작성된 글이 없습니다</td>
	</tr>
		<% } else { for(int i = 0;i < qnaNoticeList.size(); i++){
			QnaDto noticeDto = qnaNoticeList.get(i); 
			 %>
		<tr>
			<td align="center"><img src="./image/qnaNotice2.png" width="21"></td>
			<td><a href='#' onclick="userChek(<%=noticeDto.getIs_secret() %>, '<%=noticeDto.getId() %>', <%=noticeDto.getSeq() %>, <%=pageNumber%>)">
				<%=noticeDto.getTitle() %></a></td>
			<td align="center">관리자</td>
			<td align="center"><h6><span class="badge badge-info">공지</span></h6></td>
				<% /* 작성일(wDate)을 잘라서 년월일 추출 yyMMdd */
				
				  String s1 = noticeDto.getWdate().substring(2,10);
				  String p1 = "[-]";
				  String[] sArray1 = s1.split(p1);
				  String wDateStr = "";
				  for( int j = 0; j < sArray1.length; j++ ){
					  wDateStr += sArray1[j].trim();
				  }
				  //System.out.print("스플릿으로 자른 날짜" +sArray1[j].trim());
				  System.out.println("스플릿으로 자른 날짜 : " + wDateStr);
				  int wDate = Integer.parseInt(wDateStr);
				  
				  if(wDate < curTime) { %>
					<td align="center"><%=noticeDto.getWdate().substring(2,11) %></td>
				<% } else { %>
					<td align="center"><%=noticeDto.getWdate().substring(11,13) %> : <%=noticeDto.getWdate().substring(14,16) %></td>
				<% } %>
			
		
		</tr>
		
		
		<% 
			
			}
	
	

				for(int i = 0;i < list.size(); i++){
					QnaDto dto = list.get(i);
					
					 %>
			
	<tr>
		<td style="text-align:center"><%=dto.getSeq() %></td>
		<td>
		<%-- 글 구분 --%>
			<% if(dto.getIs_secret() == 1) { %>
				<img src="./image/qnaLock.png" width="17" style="vertical-align: sub;">
			<% } %>
			<a href='#' onclick="userChek(<%=dto.getIs_secret() %>, '<%=dto.getId() %>', <%=dto.getSeq() %>, <%=pageNumber%>)">
			<%=dto.getTitle() %></a>
			
			<!-- 댓글 카운트 -->
			<% if(qcDao.getQnaCount(dto.getSeq()) > 0) {%>
				<span style="color:#ff0000;font-size:15px;font-weight:500" >+<%=qcDao.getQnaCount(dto.getSeq()) %></span>
			<% } %>
			
		
			<%-- 세션 ID 저장--%>
			<input type="hidden" value="<%=curSessionId %>" id="sId">
			<%-- 세션 Auth 저장 --%>
			<input type="hidden" value="<%=curSessionAuth %>" id="sAuth">
		</td>		 
		 
		<%-- 작성자 ID --%> 	 
		<td align="center"><%=dto.getId() %></td>
		
		<%-- 답변상태 --%>
		<% if(dto.getIs_answer() == 0) { %>
			<!-- <td align="center">답변대기☆</td> -->
			<td align="center"><h6><span class="badge badge-secondary">답변대기</span></h6></td>
			<!-- <td align="center"><span style="color:#fff;background:#ff6600;font-size:15px" class="mini">답변대기</span></td> -->
		<% } else { %>
<!-- 			<td align="center">답변완료★</td> -->
			<td align="center"><h6><span class="badge badge-warning">답변완료</span></h6></td>
			<!-- <td align="center"><span style="color:#fff;background:#aaa;font-size:15px" class="mini">답변완료</span></td> -->
		<% } %>
		
		<%-- 작성일 --%>
		
		
	
		
		<% /* 작성일(wDate)을 잘라서 년월일 추출 yyMMdd */
		
		  String s1 = dto.getWdate().substring(2,10);
		  String p1 = "[-]";
		  String[] sArray1 = s1.split(p1);
		  String wDateStr = "";
		  for( int j = 0; j < sArray1.length; j++ ){
			  wDateStr += sArray1[j].trim();
		  }
		  //System.out.print("스플릿으로 자른 날짜" +sArray1[j].trim());
		  System.out.println("스플릿으로 자른 날짜 : " + wDateStr);
		  int wDate = Integer.parseInt(wDateStr);
		  
		  if(wDate < curTime) { %>
			<td align="center"><%=dto.getWdate().substring(2,11) %></td>
		<% } else { %>
			<td align="center"><%=dto.getWdate().substring(11,13) %> : <%=dto.getWdate().substring(14,16) %></td>
		<% } %>
		
		<%-- <td align="center"><%=dto.getWdate().substring(0,10) %></td> --%>
		<%-- <td align="center"><%=dto.getWdate().substring(0,16) %></td> --%>
		
		<%-- 글 구분 --%>
		<%-- <% if(dto.getIs_secret() == 0) { %>
			<td align="center">공개</td>
			<td align="center"><img src="./image/Lock.png" width="15"></td>
		<% } else { %>
			<td align="center">비공개</td>
		<% } %> --%>

	</tr>
<%
			
	
				}
}// list의 for문 끝
%>
</tbody>
</table>






<%-- 등록하기 버튼  --%>
<div align="right">
	<input type="button" class="btn btn-outline-danger" onclick="QnaWrite()" value="QnA 등록하기">
</div>






<%-- 페이징에 대한 뷰 처리 --%>
<ul class="pagination justify-content-center" style="margin:20px 0">
<% for(int i = 0;i < qnaPage; i++) {		// [1] 2 [3]
	if(pageNumber == i) { // 현재 페이지	%>			
		<li class="page-item active">
			<a class="page-link" href="#">
				<%=i + 1 %>
			</a>
		</li>
		
<%	 } else {	// 그 외의 페이지 	%>
		<li class="page-item">
			<a class="page-link" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
				<%=i + 1 %>
			</a>
		</li>
<%		
	}
}
%>
</ul>


		





<%-- 검색창 시작 --%>
<div align="center">
<select id="choice" class="serchSelect">
	<option value="sel">선택</option>
	<option value="title">제목</option>
	<option value="writer">작성자</option>
	<option value="content">내용</option>
</select>
<input type="text" id="search" value="" class="serchText" placeholder="검색어를 입력해 주세요 " size="40px">
<button type="button" onclick="searchQna()" class="btn btn-outline-dark" style="vertical-align: bottom;">검색</button>
</div> <%-- 검색창 끝 --%>


</div> <!-- 테이블 div 끝 -->
<br><br><br>

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




// Qna 등록하기 선택시 세션id 확인 후 처리
function QnaWrite() {
	<% if(mem == null || mem.getId().equals("")){ %>
		alert("QnA는 로그인 후 작성 하실 수 있습니다.");
		location.href = "login?command=login";
	<% } else { %>
		location.href = "qnaServlet?action=write";
	<% } %>
}

// Qna 글 열람시 유저&비밀글 확인 처리
function userChek(is_secret, id, seq, pageNum) {
	
	//alert("pageNumber" + pageNum);
	
	var curSessionId = $("#sId").val();
	var curSessionAuth = $("#sAuth").val();
	
	if(<%=mem == null %>) {
		if(is_secret == 0) {
			// 게스트가 일반글 열람 -> 상세 보기 연결
			//alert("게스트 일반글 접근");
			/* location.href = "qnaServlet?action=detail&seq="+seq; */
			
			location.href = "qnaServlet?action=detail&seq="+seq+"&pageNum="+pageNum+"&enter=qnaPublic";
		}else if (is_secret == 1){
			// 게스트가 비밀글 열람 -> 로그인 페이지 연결
			alert("로그인이 필요합니다.");
			location.href = "login?command=login";
		}
	} else if(<%=mem != null %>){
		if(curSessionAuth==0) {
			if(is_secret == 0){
				// 로그인 이후 모든 유저 일반글 열람 -> 상세글 보기 연결
				/* location.href = "qnaServlet?action=detail&seq="+seq; */

				location.href = "qnaServlet?action=detail&seq="+seq+"&pageNum="+pageNum+"&enter=qnaPublic";
			}else if((is_secret == 1) && (id != curSessionId) ) {
				// 사용자와 작성자 다르고 비밀글 열람 -> 경고창
				alert("비공개 글은 작성자만 확인 할 수 있습니다.");
			} else {
				// 사용자와 작성자 같고 비밀글인 경우 -> 상세글 연결
				//alert("추가 예외 확인");
				/* location.href = "qnaServlet?action=detail&seq="+seq; */
				location.href = "qnaServlet?action=detail&seq="+seq+"&pageNum="+pageNum+"&enter=qnaPublic";
			}
		} else if (curSessionAuth==1) {
			location.href = "qnaServlet?action=detail&seq="+seq+"&pageNum="+pageNum+"&enter=qnaPublic";
		}
	}
}

// 사용자가 보고 있는 페이지 이외의 이동
function goPage( pageNum ) {
	var choice = $("#choice").val();
	var word = $("#search").val();
	//alert("#search:" + word);	

	 
	if(word == "" ){
		document.getElementById("choice").value = 'sel';
	}
	
	var linkStr = "qnaServlet?action=list&pageNumber=" + pageNum;
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&searchWord=" + word + "&choice=" + choice;
	}
	location.href = linkStr;
	//location.href = "qnaServlet?action=list&pageNumber=pageNum&searchWord=word&choice=choice;
}


function searchQna() {

	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
	//alert(choice);
	//alert(word);
 
	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "qnaServlet?action=list&searchWord=" + word + "&choice=" + choice;
	
}

</script>
<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->

</body>
</html>