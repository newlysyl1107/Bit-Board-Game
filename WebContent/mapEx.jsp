<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Bit Board Game</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
	<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%--GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
});
</script>

<!-- 타이틀 수정 -->
<div class="container">
<br><p class="subject">Location</p>
</div>


	<div style="padding:10px;margin-left:30px;">
	
	<hr align="left" size="2">
	<p><strong>주소</strong>&nbsp;서울시 서초구 강남대로 456(서초동, 백암빌딩)</p>
	</div>
	<!-- 지도담는 영역 -->
	<div id="map" style="width:700px;height:700px;padding:10px;margin-left:30px;"></div>

	<div style="padding:10px;margin-left:30px;">
		<h3 align="center">교통안내</h3>
		<hr width="300">
		<table align="center">
			<col width="150px"><col width="300px">
			<tr>
				<th><img src="./image/subway.png" width="30" height="30">지하철이용</th>
				<td>2호선 강남역 12번출구</td>
			</tr>
			<tr>
				<th><img src="./image/bus.png" width="30" height="30">버스 이용</th>
				<td>강남역 12번출구 정류장 하차 <br> 간선 146, 341, 360, 740 직행 1100, 2000</td>
			</tr>
		
		</table>
	</div>	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe680ff21a68b0f0669e251d8bd150ea"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.503306, 127.024221),//비트 캠프 강남센터 위치 
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		// 마커 표시될 위치 
		var markerPosition = new kakao.maps.LatLng(37.503306, 127.024221);
		// 마커 생성 
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		// 마커가 지도위에 생성되도록 셋팅 
		marker.setMap(map);
		
		var iwContent = '<div stype="padding:5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비트보드게임</div>',
			iwPosition = new kakao.maps.LatLng(37.503306, 127.024221);// 인포 윈도우 표시 위치 
	    // 인포 윈도우 생성
	    var infowindow = new kakao.maps.InfoWindow({
	    	position : iwPosition,
	    	content : iwContent
	    });
		
		// 마커 위에 인포윈도우를 표시. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨
		infowindow.open(map, marker);
	</script>
</body>
</html>