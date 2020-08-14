<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
</head>
<body>


<a style="cursor:pointer;" onclick="javascript:viewPic('./image/CIV-EX.png')"><img src="./image/CIV.jpg" width="150"></a>

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
   var popX = scX + (mtWidth - wsize) / 2 - 50; // 팝업 창을 띄울 x 위치 지정(모니터 두 대를 합한 총 위치 기준) 
   var popY = scY + (mtHeight - hsize) / 2 - 50; // 팝업 창을 띄울 y 위치 지정(모니터 두 대를 합한 총 위치 기준) 
   
   // window.open('주소', '이름(공란가능)', '속성'); 
   imageWin = window.open("", "", "top=" + popY + ",left=" + popX + ",width=" + wsize + ",height=" + hsize +",scrollbars=yes,resizable=yes,status=no"); 
   imageWin.document.write("<html><title>Bit Board Game</title><body style='margin:0;cursor:pointer;' title='Close' onclick='window.close()'>"); 
   imageWin.document.write("<img src='" + imgCommonPreview.src + "'>"); 
   imageWin.document.write("</body></html>"); 
   } 
   
   </script>


</body>
</html>