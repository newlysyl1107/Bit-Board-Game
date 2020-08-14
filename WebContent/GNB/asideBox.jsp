<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#sidebox { background-color:#22eeee; position:absolute; width:12%; top:280px; left:85%; padding: 3px 10px;}
	#sidebox2 { background-color:#eeeeee; position:absolute; width:12%; top:280px; left:1200px; padding: 3px 10px;display:none;}
</style>


</head>
<body>


<div id="sidebox"> 
	내용 입력<br>
	<hr>
	테스트용 박스<br>
	<hr>
	<a href="#">맨 위로</a>
	<hr>
	<img src="./GNB/profile.png" width="40px" height="40px">
</div>


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
})

</script>

</body>
</html>