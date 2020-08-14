<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>

<style type="text/css">
	#sidebox { background-color:#22eeee; position:absolute; width:200px; top:280px; left:1200px; padding: 3px 10px }
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
</script>

</body>
</html>