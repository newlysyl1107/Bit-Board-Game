<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
   List<TableDto> yesList = (List<TableDto>)request.getAttribute("yesList");
   List<TableDto> noList = (List<TableDto>)request.getAttribute("noList");

   int originalPK[] = null;
   

%> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.css">

<style type="text/css">
.yestd{
   text-align: center;

}
.badge.badge-success{font-size: 12pt;width: 100px}
.badge.badge-secondary{font-size: 12pt;width: 100px}

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

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
   $("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%--페이지 시작. --%>
<div class="container">
<br><p class="subject">관리자　|　테이블 삭제</p>
</div>

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


<div align="center" class="container" style="max-width: 800px">
<form action="AdminTable">
<table border="1" id="yestable" class="table">
<col width="50"><col width="200"><col width="200"><col width="200">
      <thead class="thead-dark">
      <tr style="text-align: center;">
         <th>
         <!-- 
         <div class="custom-control custom-checkbox">
               <input type="checkbox" id="jb-checkbox all" class="custom-control-input" 
                id="allchk" onclick="allChk()">
               <label class="custom-control-label" for="jb-checkbox all">Checkbox</label>
         </div>
          -->
         
         
         <input type="checkbox" id="allchk" onclick="allChk()">
         
         </th>
         <th>테이블 번호</th>
         <th>수용 가능 인원</th>
         <th>현재 보유 테이블 현황</th>
      </tr>
      </thead>

      <% if(yesList.size() < 1 || yesList == null) { //테이블에 아무것도 없는 경우 %>   
      <h3>현재 삭제 가능한 테이블이 없습니다</h3>

      <% }else {  %>
      <% originalPK = new int[yesList.size()]; %>
   
      <% for(int i = 0; i < yesList.size(); i++){ %>
      <tr>
      
      <% TableDto dto = yesList.get(i); %>
      
      <% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
         <th style="text-align: center;  padding: 0.4rem">
            <input type="checkbox" class="delchk" name="del<%=i %>"value="<%=originalPK[i] %>">
            <%-- 
            <div class="custom-control custom-checkbox">
                  <input type="checkbox" id="jb-checkbox" class="custom-control-input delchk" 
                  name="del<%=i %>" value="<%=originalPK[i] %>">
                  <label class="custom-control-label" for="jb-checkbox">Checkbox</label>
            </div>
             --%>
            
            
         </th>
         <td class="yestd" style="font-weight: bold; padding: 0.4rem"><%=dto.getTablenumber()%> 번</td>
         <td class="yestd" style="font-weight: bold; padding: 0.4rem"><%=dto.getNumberpeople()%> 인</td>
         <td class="yestd" style="font-weight: bold; padding: 0.4rem"><% if(dto.getIsreserbaitiontable() == 1){
                       %>
                         
                         <span class="badge badge-success">예약</span>
                          <%
                        }else{
                       %>
                         <span class="badge badge-secondary">일반</span>
                       <%
                        }
                        %>   
                     
             <%--  <input type="hidden" id="tableNum" value="<%=originalPK[i] %>"   > --%>
         
         </td>
      </tr>
   <% } %>
<% } %>
      <!-- <tr><input type="hidden" name="command" value="tableDel"></tr> -->
</table>

<!-- <input type="submit" value="삭제하기">  -->

<button type="button" class="btn btn-danger" onclick="del()">체크 한 테이블 삭제</button>
<input type="button" class="btn btn-secondary" onclick="location.href='auth?command=tableCheck'" value="리스트로 돌아가기">
</form>


<br><br>

<% if(noList.size() < 1 || noList == null) { //테이블에 아무것도 없는 경우 %>   
<% }else {  %>

<br><br><br><br>


<div class="container">
<br><p class="subject" style="color: red;border-bottom: 3px solid #ff0000;">아래 테이블은 현재 예약중인 상태로 삭제 할 수 없습니다</p>
</div>
      <!-- <h3 style="color:red" >아래 테이블은 현재 예약중인 상태로 삭제 할 수 없습니다</h3> -->
<table border="1" id="notable" class="table" style="max-width: 800px">
<col width="200"><col width="200"><col width="200">
      <thead class="thead-dark">
      <tr style="text-align: center;">
         <th>테이블 번호</th>
         <th>수용 가능 인원</th>
         <th>현재 예약 된 테이블</th>
      </tr>
      </thead>
      
      <% originalPK = new int[noList.size()]; %>
   
      <% for(int i = 0; i < noList.size(); i++){ %>
      <tr>
      
      <% TableDto dto = noList.get(i); %>
      
      <%-- <% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %> --%>
         <td class="yestd" style="font-weight: bold; padding: 0.4rem"><%=dto.getTablenumber()%> 번</td>
         <td class="yestd" style="font-weight: bold; padding: 0.4rem"><%=dto.getNumberpeople()%> 인</td>
         <td class="yestd" style=" padding: 0.4rem">
                  <% if(dto.getIsreserbaitiontable() == 1){
                  %>
                     <span class="badge badge-success">예약</span> 
                  <%
                     }else{
                  %>
                     <span class="badge badge-secondary">일반</span> 
                  <%
                     }
                  %>   
             <%--  <input type="hidden" id="tableNum" value="<%=originalPK[i] %>"   >--%>         
         </td>
      </tr>
   <% } %>
<% } %>
      <!-- <tr><input type="hidden" name="command" value="tableDel"></tr> -->
</table>

</div>

 <!-- <a href="auth?command=tableCheck"><button type="button">리스트로 돌아가기</button></a> -->

<script type="text/javascript">

function allChk(){
   //alert("확인")
   if($("input[id=allchk]").is(":checked")){
      $("input[class=delchk]").prop("checked", true);
   
   }else{
      
      $("input[class=delchk]").prop("checked", false);
   }
}



function del(){
   var checkedNum = $("input:checkbox[class=delchk]:checked").length
   //alert("체크수: " + checkedNum);
   var delArray = new Array();
   //var i = 0;
   // alert("확인:" + checkedNum);
   /*
   $("input[class=delchk]:checked").each(function() {
        alert("테이블넘버: " + $(".delchk").val());
        //array[i] = $(".delchk").val();
      //alert("테이블넘버 확인2: " + array[i]);
      i++;
   });
   */
   $("input:checkbox[class=delchk]:checked").each(function() {
       delArray.push($(this).val());
      
      //alert(i + "번째 테이블: " + delArray[i]);
      //i++;
      
   });
   
   //alert("배열길이:" + delArray.length);

   jQuery.ajaxSettings.traditional = true;

   $.ajax({
         url: 'AdminTable',
         data:{ 'command' : 'tableDel',
               'tableNum' : delArray},
         type : "POST",
         success: function(data){
            if(data.result){
               alert("테이블 삭제가 완료되었습니다");
               location.href='AdminTable?command=delete'
            }else if(data.result){
               
               alert("삭제에 문제가 생겨 테이블이 삭제가 안되었을 수 있습니다. 다시 시도해주세요 ");
               location.href='AdminTable?command=delete'
            }
            
         },
         error : function(request,status,error){
            //alert("실패!");
            alert("code:"+ request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }      
   
   });
      
   
   
}



</script>

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

<Br><Br><Br><Br>

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