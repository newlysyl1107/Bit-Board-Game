<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style>
		th{	text-align: center; }
</style>

</head>
<body>

<%-- GNB --%>
<header>
	<div id="gnb"></div>
	<script type="text/javascript">
	$(function () {
		$("#gnb").load("./GNB/gnb.jsp");
	})
	</script>
</header>


<section>
<div class="container">
<br><p class="subject">GameList</p>
<br>
</div>

<table align ="center" border="0"> 
<col width="200px"><col width="200px"><col width="200px"><col width="200px"><col width="200px"><col width="200px">
<tr>
	<th><a href="#top">주간 인기 탑 5</a></th>
	<th><a href="#best">베스트 인기 보드게임</a></th>
	<th><a href="#new">신작 보드 게임</a></th>
	<th><a href="#adventure">모험</a></th>
	<th><a href="#sf">SF</a></th>
	<th><a href="#econo">경제</a></th>
</tr>
<tr style="height:45px">
</tr>
<tr>
	<th><a href="#detect">추리</a></th>
	<th><a href="#puzzle">퍼즐</a></th>
	<th><a href="#statige">전략</a></th>
	<th><a href="#card">카드</a></th>
	<th><a href="#possess">기타</a></th>
	<th><a href="#possess">보유중인 보드게임</a></th>
</tr>

</table>
<br><br>

<div>
<table align="left">
	<col width="200px"><col width="260px"><col width="260px"><col width="260px"><col width="260px"><col width="260px">
	
<tr align="right">
<th id="top">< 주간 인기 탑 5 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">A Game of Thrones</th>
				<th align="left">Root </th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor </th>
				<th align="left">Chronicles of Crime</th>
</tr>
<tr align="left">
<th></th>

<td>  
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/A Game of Thrones-EX.jpg')">
	<img src="./gbPic/A Game of Thrones.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Root-EX.jpg')">
	<img src="./gbPic/Root.png" width="210"></a> 		  
 </td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Mansions of Madness-EX.jpg')">
	<img src="./gbPic/Mansions of Madness.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Legends of Andor-EX.jpg')">
	<img src="./gbPic/Legends of Andor.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Chronicles of Crime-EX.jpg')">
	<img src="./gbPic/Chronicles of Crime.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr align="right">
<th id="best">< 베스트 인기 보드게임 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Halli Galli(할리갈리)</th>
				<th align="left">Seasons</th>
				<th align="left">UNO</th>
				<th align="left">Century</th>
				<th align="left">JenGa(젠가)</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Halli Galli-EX.jpg')">
	<img src="./gbPic/Halli Galli.png" width="210"></a> 		  
</td>
<td>

	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Seasons-EX.jpg')">
	<img src="./gbPic/Seasons.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/uno-EX.jpg')">
	<img src="./gbPic/uno.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Century2-EX.png')">
	<img src="./gbPic/Century.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/jenga-EX.jpg')">
	<img src="./gbPic/Jenga.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr align="right" style="">
<th id="new">< 신작 보드 게임 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">Fantastic Factories </th>
				<th align="left">Maracaibo </th>
				<th align="left">Sheriff of Nottingham </th>
				<th align="left">La Cour Des Miracle </th>
				<th align="left">Crazy Tower</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Fantastic Factories-EX.png')">
	<img src="./gbPic/Fantastic Factories.png" width="210"></a> 		  
</td>
<td>

	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Maracaibo-EX.png')">
	<img src="./gbPic/Maracaibo.png" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Sheriff of Nottingham-EX.png')">
	<img src="./gbPic/Sheriff of Nottingham.png" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/La Cour Des Miracle-EX.png')">
	<img src="./gbPic/La Cour Des Miracle.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Crazy Tower-EX.png')">
	<img src="./gbPic/Crazy Tower.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr align="right">
<th id="adventure">< 장르별 : 모험 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">A Feast for Odin</th>
				<th align="left">A Game of Thrones</th>
				<th align="left">Adrenaline </th>
				<th align="left">Architectura</th>
				<th align="left">Are You Dumber</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/A Feast for Odin-EX.jpg')">
	<img src="./gbPic/A Feast for Odin.png" width="210"></a> 		  
</td>
<td>

	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/A Game of Thrones-EX.jpg')">
	<img src="./gbPic/A Game of Thrones.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Adrenaline-EX.jpg')">
	<img src="./gbPic/Adrenaline.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Architectura-EX.jpg')">
	<img src="./gbPic/Architectura.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Are You Dumber-EX.jpg')">
	<img src="./gbPic/Are You Dumber.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr align="right">
<th id="sf">< 장르별 : SF ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">Arler Erde</th>
				<th align="left">Big Shot</th>
				<th align="left">Billabong</th>
				<th align="left">Bosk</th>
				<th align="left">Bottle Imp</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Arler Erde-EX.jpg')">
	<img src="./gbPic/Arler Erde.png" width="210"></a> 		  
</td>
<td>

	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Big Shot-EX.jpg')">
	<img src="./gbPic/Big Shot.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Billabong.jpg')">
	<img src="./gbPic/Billabong.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Bosk-EX.jpg')">
	<img src="./gbPic/Bosk.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Bottle Imp-EX.jpg')">
	<img src="./gbPic/Bottle Imp.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr align="right">
<th id="econo">< 장르별 : 경제/경영 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">BTS UNO</th>
				<th align="left">Can't Stop</th>
				<th align="left">Castello Methoni</th>
				<th align="left">Century</th>
				<th align="left">Century2</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/BTS UNO-EX.png')">
	<img src="./gbPic/BTS UNO.jpg" width="210"></a> 		  
</td>
<td>

	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Cant Stop-EX.jpg')">
	<img src="./gbPic/Cant Stop.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Castello Methoni-EX.jpg')">
	<img src="./gbPic/Castello Methoni.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Century-EX.jpg')">
	<img src="./gbPic/Century.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Century2-EX.png')">
	<img src="./gbPic/Century2.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr id="detect" align="right"><th>< 장르별 : 추리 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">Century-Spice Road </th>
				<th align="left">Chronicles of Crime- Welcome to Redview</th>
				<th align="left">Chronicles of Crime </th>
				<th align="left">Circus Flohcati </th>
				<th align="left">CIV</th>
</tr>
<tr align="left">
<th></th>
<<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Century-Spice Road-EX.png')">
	<img src="./gbPic/Century-Spice Road.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Chronicles of Crime- Welcome to Redview-EX.jpg')">
	<img src="./gbPic/Chronicles of Crime- Welcome to Redview.png" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Chronicles of Crime-EX.jpg')">
	<img src="./gbPic/Chronicles of Crime.png" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Circus Flohcati-EX.jpg')">
	<img src="./gbPic/Circus Flohcati.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/CIV-EX.png')">
	<img src="./gbPic/CIV.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr id="puzzle" align="right"><th>< 장르별 : 퍼즐 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">Cocobanana </th>
				<th align="left">Code 777 </th>
				<th align="left">Codenames Duet </th>
				<th align="left">odenames Pictures </th>
				<th align="left">Codenames</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Cocobanana-EX.jpg')">
	<img src="./gbPic/Cocobanana.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Code 777-EX.jpg')">
	<img src="./gbPic/Code 777.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Codenames Duet-EX.jpg')">
	<img src="./gbPic/Codenames Duet.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Codenames Pictures-EX.jpg')">
	<img src="./gbPic/Codenames Pictures.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Codenames-EX.jpg')">
	<img src="./gbPic/Codenames.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr id="statige" align="right"><th>< 장르별 : 전략 ></th>
</tr>

<tr>
				<th align="left"></th>
				<th align="left">Concordia </th>
				<th align="left">Coup </th>
				<th align="left">Cucco </th>
				<th align="left">Cuzco </th>
				<th align="left">Detective</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Concordia-EX.jpg')">
	<img src="./gbPic/Concordia.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Coup-EX.jpg')">
	<img src="./gbPic/Coup.jpg" width="210"></a> 		  

</td>
<td>
 	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Cucco-EX.jpg')">
	<img src="./gbPic/Cucco.jpg" width="210"></a>		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Cuzco-EX.jpg')">
	<img src="./gbPic/Cuzco.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Detective-EX.jpg')">
	<img src="./gbPic/Detective.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr id="card" align="right"><th>< 장르별 : 카드 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Donkey Derby </th>
				<th align="left">Endeavor </th>
				<th align="left">Escape Room </th>
				<th align="left">Fireball Island </th>
				<th align="left">Five Cucumber</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Donkey Derby-EX.jpg')">
	<img src="./gbPic/Donkey Derby.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Endeavor-EX.jpg')">
	<img src="./gbPic/Endeavor.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Escape Room-EX.jpg')">
	<img src="./gbPic/Escape Room.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Fireball Island-EX.jpg')">
	<img src="./gbPic/Fireball Island.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Five Cucumbers-EX.jpg')">
	<img src="./gbPic/Five Cucumbers.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr id="possess" align="right"><th>< 보유 중인 보드 게임 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Foppen </th>
				<th align="left">Fuji Flush </th>
				<th align="left">Fuji </th>
				<th align="left">Geister </th>
				<th align="left">Get Packing</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Foppen-EX.png')">
	<img src="./gbPic/Foppen.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Fuji Flush-EX.jpg')">
	<img src="./gbPic/Fuji Flush.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Fuji-EX.jpg')">
	<img src="./gbPic/Fuji.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Geister-EX.jpg')">
	<img src="./gbPic/Geister.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Get Packing-EX.jpg')">
	<img src="./gbPic/Get Packing.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Hadara </th>
				<th align="left">Halli Galli Deluxe </th>
				<th align="left">Halli Galli Extreme </th>
				<th align="left">Halli Galli Junior </th>
				<th align="left">Halli Galli</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Hadara-EX.jpg')">
	<img src="./gbPic/Hadara.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Halli Galli Deluxe-EX.jpg')">
	<img src="./gbPic/Halli Galli Deluxe.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Halli Galli Extreme-EX.jpg')">
	<img src="./gbPic/Halli Galli Extreme.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Halli Galli Junior-EX.jpg')">
	<img src="./gbPic/Halli Galli Junior.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Halli Galli-EX.jpg')">
	<img src="./gbPic/Halli Galli.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Hexen Rennen </th>
				<th align="left">Hick Hack in Gackelwack </th>
				<th align="left">High Society </th>
				<th align="left">Indigo-EX </th>
				<th align="left">Intrigue</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Hexen Rennen-EX.jpg')">
	<img src="./gbPic/Hexen Rennen.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Hick Hack in Gackelwack-EX.jpg')">
	<img src="./gbPic/Hick Hack in Gackelwack.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/High Society-EX.jpg')">
	<img src="./gbPic/High Society.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Indigo-EX.jpg')">
	<img src="./gbPic/Indigo.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Intrigue-EX.jpg')">
	<img src="./gbPic/Intrigue.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Invasion of the cow snatchers </th>
				<th align="left">Jenga </th>
				<th align="left">Kushi Express</th>
				<th align="left">Lady Godiva </th>
				<th align="left">Land Unter</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Invasion of the cow snatchers-EX.jpg')">
	<img src="./gbPic/Invasion of the cow snatchers.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/jenga-EX.jpg')">
	<img src="./gbPic/Jenga.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Kushi Express-EX.jpg')">
	<img src="./gbPic/Kushi Express.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Lady Godiva-EX.png')">
	<img src="./gbPic/Lady Godiva.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Land Unter-EX.jpg')">
	<img src="./gbPic/Land Unter.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Las Vegas </th>
				<th align="left">Legends of Andor </th>
				<th align="left">Lowlands </th>
				<th align="left">Mafia Code </th>
				<th align="left">Mahe</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Las Vegas-EX.png')">
	<img src="./gbPic/Las Vegas.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Legends of Andor-EX.jpg')">
	<img src="./gbPic/Legends of Andor.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Lowlands-EX.jpg')">
	<img src="./gbPic/Lowlands.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Mafia Code-EX.jpg')">
	<img src="./gbPic/Mafia Code.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Mahe-EX.jpg')">
	<img src="./gbPic/Mahe.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Majesty For the Realm </th>
				<th align="left">Make n Break </th>
				<th align="left">Manhattan </th>
				<th align="left">Mansions of Madness </th>
				<th align="left">Me Want Cookies</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Majesty For the Realm-EX.jpg')">
	<img src="./gbPic/Majesty For the Realm.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Make n Break-EX.jpg')">
	<img src="./gbPic/Make n Break.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Manhattan-EX.png')">
	<img src="./gbPic/Manhattan.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Mansions of Madness-EX.jpg')">
	<img src="./gbPic/Mansions of Madness.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Me Want Cookies-EX.jpg')">
	<img src="./gbPic/Me Want Cookies.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Medici </th>
				<th align="left">Meeple Circus </th>
				<th align="left">Menara </th>
				<th align="left">Modern Art Korean </th>
				<th align="left">Monster Chase</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Medici-EX.png')">
	<img src="./gbPic/Medici.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Meeple Circus-EX.jpg')">
	<img src="./gbPic/Meeple Circus.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Menara-EX.jpg')">
	<img src="./gbPic/Menara.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Modern Art Korean-EX.jpg')">
	<img src="./gbPic/Modern Art Korean.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Monster Chase-EX.jpg')">
	<img src="./gbPic/Monster Chase.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Newton </th>
				<th align="left">No Touch Kraken </th>
				<th align="left">One Night Ultimate Werewolf </th>
				<th align="left">Original Mafia</th>
				<th align="left">paper-laon</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Newton-EX.png')">
	<img src="./gbPic/Newton.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/No Touch Kraken-EX.jpg')">
	<img src="./gbPic/No Touch Kraken.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/One Night Ultimate Werewolf-EX.jpg')">
	<img src="./gbPic/One Night Ultimate Werewolf.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Original Mafia-EX.jpg')">
	<img src="./gbPic/Original Mafia.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/paper-laon-EX.jpg')">
	<img src="./gbPic/paper-laon.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Paris </th>
				<th align="left">Penguin Pang Pang </th>
				<th align="left">Penguin Party</th>
				<th align="left">Pictomania </th>
				<th align="left">Pioneer Days</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Paris-EX.jpg')">
	<img src="./gbPic/Paris.jpg" width="180"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Penguin Pang Pang-EX.jpg')">
	<img src="./gbPic/Penguin Pang Pang.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Penguin Party-EX.jpg')">
	<img src="./gbPic/Penguin Party.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Pictomania-EX.jpg')">
	<img src="./gbPic/Pictomania.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Pioneer Days-EX.jpg')">
	<img src="./gbPic/Pioneer Days.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr>
				<th align="left"></th>
				<th align="left">Point Salad </th>
				<th align="left">Puerto Rico </th>
				<th align="left">Pulsar 2849 </th>
				<th align="left">Queenz </th>
				<th align="left">Rainbow 35</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Point Salad-EX.jpg')">
	<img src="./gbPic/Point Salad.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Puerto Rico-EX.jpg')">
	<img src="./gbPic/Puerto Rico.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Pulsar 2849-EX.jpg')">
	<img src="./gbPic/Pulsar 2849.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Queenz-EX.jpg')">
	<img src="./gbPic/Queenz.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Rainbow 35-EX.png')">
	<img src="./gbPic/Rainbow 35.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Reykholt </th>
				<th align="left">Root </th>
				<th align="left">Rubiks Race </th>
				<th align="left">Sagrada</th>
				<th align="left">Schotten Totten </th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Reykholt-EX.jpg')">
	<img src="./gbPic/Reykholt.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Root-EX.jpg')">
	<img src="./gbPic/Root.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Rubiks Race-EX.jpg')">
	<img src="./gbPic/Rubiks Race.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Sagrada-EX.jpg')">
	<img src="./gbPic/Sagrada.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Schotten Totten-EX.jpg')">
	<img src="./gbPic/Schotten Totten.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Seals </th>
				<th align="left">Seasons </th>
				<th align="left">Seikatsu</th>
				<th align="left">Skull King</th>
				<th align="left">Twilight Struggle Deluxe</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Seals-EX.jpg')">
	<img src="./gbPic/Seals.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Seasons-EX.jpg')">
	<img src="./gbPic/Seasons.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Seikatsu-EX.jpg')">
	<img src="./gbPic/Seikatsu.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Skull King-EX.jpg')">
	<img src="./gbPic/Skull King.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Twilight Struggle Deluxe-EX.jpg')">
	<img src="./gbPic/Twilight Struggle Deluxe.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>

<tr>
				<th align="left"></th>
				<th align="left">Tzolkin </th>
				<th align="left">Ubongo 3D Family </th>
				<th align="left">Ultimate Werewolf </th>
				<th align="left">Underwater Cities </th>
				<th align="left">UNO Frozen2</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Tzolkin-EX.jpg')">
	<img src="./gbPic/Tzolkin.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Ubongo 3D Family-EX.jpg')">
	<img src="./gbPic/Ubongo 3D Family.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Ultimate Werewolf-EX.png')">
	<img src="./gbPic/Ultimate Werewolf.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Underwater Cities-EX.jpg')">
	<img src="./gbPic/Underwater Cities.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/UNO Frozen2-EX.jpg')">
	<img src="./gbPic/UNO Frozen2.png" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">UNO Pokemon </th>
				<th align="left">uno </th>
				<th align="left">Up And Down </th>
				<th align="left">Uxmal </th>
				<th align="left">Venice Connection</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/UNO Pokemon-EX.jpg')">
	<img src="./gbPic/UNO Pokemon.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/uno-EX.jpg')">
	<img src="./gbPic/uno.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Up And Down-EX.jpg')">
	<img src="./gbPic/Up And Down.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Uxmal-EX.jpg')">
	<img src="./gbPic/Uxmal.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Venice Connection-EX.jpg')">
	<img src="./gbPic/Venice Connection.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>


<tr>
				<th align="left"></th>
				<th align="left">Voyage of the Beagle </th>
				<th align="left">Welcome </th>
				<th align="left">Werewords </th>
				<th align="left">Winners Circle</th>
				<th align="left">YINSH</th>
</tr>
<tr align="left">
<th></th>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Voyage of the Beagle-EX.jpg')">
	<img src="./gbPic/Voyage of the Beagle.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Welcome-EX.jpg')">
	<img src="./gbPic/Welcome.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Werewords-EX.jpg')">
	<img src="./gbPic/Werewords.png" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/Winners Circle-EX.jpg')">
	<img src="./gbPic/Winners Circle.jpg" width="210"></a> 		  
</td>
<td>
	<a style="cursor:pointer;" onclick="javascript:viewPic('./gbPic/YINSH-EX.jpg')">
	<img src="./gbPic/YINSH.jpg" width="210"></a> 		  
</td>
</tr>
<tr><th style="height:100px" ></th>	<th></th><th></th><th></th>	<th></th></tr>




</table>
</div>
</section>

<br><br><br><br><br>

<footer style="top: 9500px; position: absolute; width: 100%">
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>


<script type="text/javascript"> 

var imgCommonPreview = new Image(); 
function viewPic(filepath) { 
   if(filepath == "") { 
      alert('등록된 이미지가 없습니다.'); 
   return; 
   } 
   
   imgCommonPreview.src = filepath; 
   
   setTimeout("createPreviewWin(imgCommonPreview)", 100); 
   
} 


function createPreviewWin(imgCommonPreview) { 
   if(!imgCommonPreview.complete) { 
      setTimeout("createPreviewWin(imgCommonPreview)", 100); 
      return; 
   } 
   
   var scrollsize = 17; 
   var swidth = screen.width - 10; 
   var sheight = screen.height - 90; 
   var wsize = imgCommonPreview.width 
   var hsize = imgCommonPreview.height; 
   
   if(wsize < 50) wsize = 50; // 가로 최소 크기 
   if(hsize < 50) hsize = 50; // 세로 최소 크기 
   if(wsize > swidth) wsize = swidth; // 가로 최대 크기 
   if(hsize > sheight) hsize = sheight; // 세로 최대 크기 
   // 세로가 최대크기를 초과한경우 세로스크롤바 자리 확보 
   if((wsize < swidth-scrollsize) && hsize >= sheight) wsize += scrollsize; 
   
   // 가로가 최대크기를 초과한경우 가로스크롤바 자리 확보 
   if((hsize < sheight-scrollsize) && wsize >= swidth) hsize += scrollsize; 
   
   // IE 6,7 전용 : 가로세로 크기가 보통일때 세로 스크롤바 자리 확보 
   
   if((wsize < swidth-scrollsize) && hsize < sheight && (navigator.userAgent.indexOf("MSIE 6.0") > -1 || navigator.userAgent.indexOf("MSIE 7.0") > -1))wsize += scrollsize; 
   
   // 듀얼 모니터에서 팝업 가운데 정렬하기 
   
   var mtWidth = document.body.clientWidth; 
   
   // 현재 브라우저가 있는 모니터의 화면 폭 사이즈 
   var mtHeight = document.body.clientHeight; 
   
   // 현재 브라우저가 있는 모니터의 화면 높이 사이즈 
   var scX = window.screenLeft; 
   
   // 현재 브라우저의 x 좌표(모니터 두 대를 합한 총 위치 기준) 
   var scY = window.screenTop; 
   
   // 현재 브라우저의 y 좌표(모니터 두 대를 합한 총 위치 기준) 
   var popX = scX + (mtWidth - wsize) / 2 - 50; 
   // 팝업 창을 띄울 x 위치 지정(모니터 두 대를 합한 총 위치 기준) 
   var popY = scY + (mtHeight - hsize) / 2 - 50; 
   // 팝업 창을 띄울 y 위치 지정(모니터 두 대를 합한 총 위치 기준) 
   
   // window.open('주소', '이름(공란가능)', '속성'); 
   imageWin = window.open("", "", "top=" + popY + ",left=" + popX + ",width=" + wsize + ",height=" + hsize +",scrollbars=yes,resizable=yes,status=no"); 
   imageWin.document.write("<html><title>Bit Board Game</title><body style='margin:0;cursor:pointer;' title='Close' onclick='window.close()'>"); 
   imageWin.document.write("<img src='" + imgCommonPreview.src + "'>"); 
   imageWin.document.write("</body></html>"); 
   } 
   
   </script>



</body>
</html>