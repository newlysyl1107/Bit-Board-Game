<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
.serchText {width: 100px; text-align: right;}
td {text-align: center;}

#sidebox { background-color:rgba(0,0,75,.4); 
		   position:absolute; 
		   width:12%; 
		   top:150px; 
		   left:85%; 
		   padding: 3px 10px;
}
#sidebox2 { background-color:rgba(0,0,75,.4); 
			position:absolute; 
			width:12%; 
			top:150px; 
			left:1200px; 
			padding: 3px 10px;
			display:none;
}
.sidemenu a:hover{
   text-decoration:none !important;
   color : white;
  -webkit-transform: scale(1.10);
     -moz-transform: scale(1.10);
      -ms-transform: scale(1.10);
       -o-transform: scale(1.10);
          transform: scale(1.10);  
}

.sidemenu a {
     padding: 10px;
     text-transform: uppercase;
     color: white;
     text-decoration: none;
     position: relative;
     display: block;
       -webkit-transition: all 0.1s linear;
          transition: all 0.1s linear;
}



</style>
</head>
<body>

<header>
   <%-- GNB --%>
   <div id="gnb"></div>
   <script type="text/javascript">
   $(function () {
      $("#gnb").load("./GNB/gnb.jsp");
   })
   </script>
</header>

<%-- asideBox --%>
<div id="sidebox" align="center"> 
	<div id="mainPg" class="sidemenu" style="font-size:1.3em;" ><a href="./auth?command=adminMain">관리자 메인</a></div>
	<div class="sidemenu" ><a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원관리</a></div>
	<div class="sidemenu"><a href="authRev?command=curRev">예약관리</a></div>
	<div class="sidemenu"><a href="authRev?command=pastRev">지난예약</a></div>
	<div class="sidemenu"><a href="auth?command=noAnswer">미응답 Q&A</a></div>
	<%--<div class="sidemenu"><a href="#">게임관리</a></div>  --%>
	<div class="sidemenu"><a href="auth?command=tableCheck">테이블관리</a></div>
	<hr>
	<div class="sidemenu"><a href="#">맨 위로</a></div>
</div>


<%   //계정 검증
   Object oLogin = session.getAttribute("login");
   MemberDto mem = null;
   if(oLogin == null) {
%>
      <script type="text/javascript">   // TODO 나중에 서블릿으로 교체할 것.
         alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
         location.href = "main.jsp"   
      </script> 
<%   
   }else {
      mem = (MemberDto)oLogin;
      if(mem.getAuth() == 1) {
         //관리자 맞음.
      }else {
%>   
         <script type="text/javascript">   // TODO 나중에 서블릿으로 교체할 것.
            alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
            location.href = "main.jsp"   
         </script> 
<%            
      }   
   }
%>   

<% List<TableDto> list = (List<TableDto>)request.getAttribute("tableList"); //테이블 호출 %>
<% int[] originalPK = null;  %>

<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">관리자　|　테이블 관리</p>
</div>





<form action="AdminTableUpdateServlet" id="frm">
   <div id="tableDiv" align="center" class="container" style="max-width: 800px">
   
   <table border="1" id="listTable" class="table">
   <col width="250"><col width="250"><col width="250">
   <thead class="thead-dark">
   <tr style="text-align: center;">
      <th>테이블 번호</th>
      <th>수용 가능 인원</th>
      <th>예약 테이블 전환</th>
   </tr>
   </thead>
   
   <% if(list == null) { //테이블에 아무것도 없는 경우 %>   
      <h3>표기할 내용이 없습니다.</h3>
   
   <% }else if(list.size() < 1) {%>
      <h3>표기할 내용이 없습니다.</h3>
   
   <% }else {  %>
      <% originalPK = new int[list.size()]; %>
      
      <% for(int i = 0; i < list.size(); i++){ %>
         <tr>
      
         <% TableDto dto = list.get(i); %>
         
         <% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
         <td style="font-weight: bold; padding: 0.4rem">
            <input type="text" class="serchText tn" name="tnValues" value=<%=dto.getTablenumber()%> onkeypress="inNumber();"/> 번 테이블
         </td>
         <td style="font-weight: bold; padding: 0.4rem">
            <input type="text" class="serchText pn" name="pnValues" value=<%=dto.getNumberpeople()%> onkeypress="inNumber();"/> 인
         </td>
         <td style="font-weight: bold; padding: 0.4rem">
            <%if(dto.getIsreserbaitiontable() == 0) {%>
            <!-- <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input ck" id="ck1">
               
               <label class="custom-control-label" for="ck1">테이블 전환</label>
            </div> -->
            
            <input type="checkbox" class="ck">
            <%}else { %>
            <!-- <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input ck" id="ck2"  checked="checked">
               
               <label class="custom-control-label" for="ck2">테이블 전환</label>
            </div> -->
            
            
               <input type="checkbox" class="ck" checked="checked">
            <%} %>
            
         </td>
         
         </tr>
      <% } %>
   <% } %>
   </table>
   <div class="btn-group" role="group" aria-label="Basic example">
   <input type="button" class="btn btn-secondary" id="createTd" value=" 테이블 추가 생성 ">
   <input type="button" class="btn btn-secondary" id="update" value=" 변경사항 적용 "> <%--onclick="location.href='AdminTable?command=update'" --%>
   <input type="button" class="btn btn-secondary" onclick="location.href='AdminTable?command=back'" value="리스트로 돌아가기">
   </div>
   </div>
</form>



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

var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { 
   var position = $(window).scrollTop();
   $("#sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
});

$(window).resize(function (){
    var width_size = window.outerWidth;
    
    if (width_size <= 800) {
       $("#sidebox").attr("id","sidebox2");
    }else {
       $("#sidebox2").attr("id","sidebox");
    }
});
</script>





<script type="text/javascript">
$(document).on("click", "#createTd", function () {
   //어우 되게 긴데 쪼개기 귀찮으니 한줄로 간다
   $("#listTable").append('<tr><td><input type="text" class="serchText tn" name="tnValues" value="0" onkeypress="inNumber();"/> 번 테이블</td><td><input type="text" class="serchText pn" name="pnValues" value="0" onkeypress="inNumber();"/> 인</td><td><input type="checkbox" class="ck"></td></tr>');
});

function inNumber(){
  if(event.keyCode<48 || event.keyCode>57){
     event.returnValue=false;
  }
}

function zeroDelete() {
   var zeroDele = $('#listTable').find(".tn");
   
   for(var i = 0; i < zeroDele.length; i++) {
      zeroDele[i].value = zeroDele[i].value.replace(/(^0+)/, "");
   }
}

function tableNumberOverlapCheck() {
   var tntn = $('#listTable').find(".tn");
   
   for(var i = 0; i < (tntn.length - 1); i++) {
      for(var j = (i + 1); j < tntn.length; j++) {
         if(tntn[i].value == tntn[j].value) {
            return false;   //중복 발견
         }
      }   
   }
   return true;
}

function peopleNumberCheck() {            //인원 점검
   var pnpn = $('#listTable').find(".pn");
   
   for(var i = 0; i < pnpn.length; i++) {
      if(pnpn[i].value <= 0) {
         return false;   //0이하의 숫자 발견
      }   
   }
   return true;
}



$(document).on("click", "#update", function () {

   var isOverlap = false;
   var isPnCheck = false;
   
   zeroDelete();
   isOverlap = tableNumberOverlapCheck();
   isPnCheck = peopleNumberCheck();
   
   if(isOverlap) {
      alert("테이블넘버 중복 발견 안됨");
      if(isPnCheck) {
         alert("인원수 정상");
         
         var checkArray = $('#listTable').find(".ck");
         //alert(checkArray.length);
         
         for(var i = 0; i < checkArray.length; i++) {
            if($(checkArray[i]).is(":checked")) {
               $("#tableDiv").append('<input type="hidden" value="1" name="isRev">');
               //alert(i + "번째 박스 체크 됨");
            }else {
               $("#tableDiv").append('<input type="hidden" value="0" name="isRev">');
               //alert(i + "번째 박스 체크 안됨");
            }
         }
         
         <% for(int i : originalPK) {%>
            $("#tableDiv").append('<input type="hidden" value="<%=i%>" name="originalPk">');
         <%} %>
         
         
         $("#frm").submit();
      }else {
         alert("인원수 0이하 발견");
      }
   }else {
      alert("테이블넘버 중복 발견");
   }
   

   
   
   
   //alert("test");
   
   /*
   $('#listTable').children('.tn').each(function () {
      alert($(this).val());
   });   
   */
   
   //var contents = {},
    //duplicates = false;
   
/*
   
$("#listTable #tn").each(function() {
   alert($(this).val());
   
    var tdContent = $(this).text();
    if (contents[tdContent]) {
        duplicates = true;
        return false;
    }
    contents[tdContent] = true;
});    
if (duplicates)
   alert("There were duplicates.");
*/

});

</script>




</body>
</html>