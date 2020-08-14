<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Board Game</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<style type = "text/css">
body {
  font-family: "Century Gothic", "Lato", sans-serif;
}

a {
  text-decoration: none;
}

.et-hero-tabs,
.et-slide {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  position: relative;
  background: #eee;
  text-align: center;
  padding: 0 2em;
}
.et-hero-tabs h1,
.et-slide h1 {
  font-size: 2rem;
  margin: 0;
  letter-spacing: 1rem;
}
.et-hero-tabs h3,
.et-slide h3 {
  font-size: 1rem;
  letter-spacing: 0.3rem;
  opacity: 0.6;
}

.et-hero-tabs-container {
  display: flex;
  flex-direction: row;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 70px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: #fff;
  z-index: 10;
  position:absolute;
 	top:0px;
}
.et-hero-tabs-container--top {
  position: fixed;
  top: 0;
}

.et-hero-tab {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  color: #000;
  letter-spacing: 0.1rem;
  transition: all 0.5s ease;
  font-size: 0.8rem;
  
}
.et-hero-tab:hover {
  color: white;
  background: rgba(102, 177, 241, 0.8);
  transition: all 0.5s ease;
}

.et-hero-tab-slider {
  position: absolute;
  bottom: 0;
  width: 0;
  height: 6px;
  background: #66B1F1;
  transition: left 0.3s ease;
}

@media (min-width: 800px) {
  .et-hero-tabs h1,
.et-slide h1 {
    font-size: 3rem;
  }
  .et-hero-tabs h3,
.et-slide h3 {
    font-size: 1rem;
  }

  .et-hero-tab {
    font-size: 1rem;
  }
}

</style>
</head>
<body>

  <!-- Hero -->
  <section class="et-hero-tabs" 
  style="background-image: url('https://cdn.pixabay.com/photo/2015/03/26/09/43/living-room-690174_1280.jpg'); 
  background-repeat:no-repeat;
  -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;">
    
    <h1 id="typing" style = "font-size:80pt; color:#ffffff"></h1>
    <h3></h3>
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="#tab-es6">NOTICE</a>
      <a class="et-hero-tab" href="#tab-flexbox">GAME LIST</a>
      <a class="et-hero-tab" href="#tab-react">RESERVATION</a>
      <a class="et-hero-tab" href="#tab-angular">EPILOGUE</a>
      <a class="et-hero-tab" href="#tab-qqq">Q&A</a>
      <a class="et-hero-tab" href="#tab-other">DIRECTION</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </section>

  <!-- Main -->
  <main class="et-main">
    <section class="et-slide" id="tab-es6" style = "padding-top:30px">
    	<a href = "noticeList?command=page&pageNumber=0"><img src = "notice.jpg"></a>
    	<br><br>
      <h1>NOTICE</h1>
      <h3>최근 소식</h3>
    </section>
    
    <section class="et-slide" id="tab-flexbox">
    	<a href = "gameList.jsp"><img src = "gamelist.jpg"></a>
    	<br><br>
      <h1>GAME LIST</h1>
      <h3>보유 중인 게임을 확인하세요</h3>
    </section>
    
    <section class="et-slide" id="tab-react">
    	<a href = "reservation.jsp"><img src = "reservation.jpg"></a>
    	<br><br>
      <h1>RESERVATION</h1>
      <h3>빠르고 간편하게 예약하세요</h3>
    </section>
    
    <section class="et-slide" id="tab-angular">
    	<a href = "epiloguelist.jsp"><img src = "epilogue.jpg"></a>
    	<br><br>
      <h1>EPILOGUE</h1>
      <h3>이용 후기를 남겨보세요</h3>
    </section>
    
    <section class ="et-slide" id = "tab-qqq">
    	<a href = "qnaServlet?action=list"><img src = "qna.jpg"></a>
    	<br><br>
      <h1>Q&A</h1>
      <h3>질문과 답변</h3>
    </section>
    
    <section class="et-slide" id="tab-other">
    	<a href = "map.jsp"><img src = "direction.jpg"></a>
    	<br><br>
      <h1>DIRECTION</h1>
      <h3>찾아오시는 길</h3>
    </section>
  </main>
  
  <footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>
  
  
  <script type = "text/javascript">
  class StickyNavigation {
		
		constructor() {
			this.currentId = null;
			this.currentTab = null;
			this.tabContainerHeight = 70;
			let self = this;
			$('.et-hero-tab').click(function() { 
				self.onTabClick(event, $(this)); 
			});
			$(window).scroll(() => { this.onScroll(); });
			$(window).resize(() => { this.onResize(); });
		}
		
		onTabClick(event, element) {
			event.preventDefault();
			let scrollTop = $(element.attr('href')).offset().top - this.tabContainerHeight + 1;
			$('html, body').animate({ scrollTop: scrollTop }, 600);
		}
		
		onScroll() {
			this.checkTabContainerPosition();
	    this.findCurrentTabSelector();
		}
		
		onResize() {
			if(this.currentId) {
				this.setSliderCss();
			}
		}
		
		checkTabContainerPosition() {
			let offset = $('.et-hero-tabs').offset().top + $('.et-hero-tabs').height() - this.tabContainerHeight;
			if($(window).scrollTop() > offset) {
				$('.et-hero-tabs-container').addClass('et-hero-tabs-container--top');
			} 
			else {
				$('.et-hero-tabs-container').removeClass('et-hero-tabs-container--top');
			}
		}
		
		findCurrentTabSelector(element) {
			let newCurrentId;
			let newCurrentTab;
			let self = this;
			$('.et-hero-tab').each(function() {
				let id = $(this).attr('href');
				let offsetTop = $(id).offset().top - self.tabContainerHeight;
				let offsetBottom = $(id).offset().top + $(id).height() - self.tabContainerHeight;
				if($(window).scrollTop() > offsetTop && $(window).scrollTop() < offsetBottom) {
					newCurrentId = id;
					newCurrentTab = $(this);
				}
			});
			if(this.currentId != newCurrentId || this.currentId === null) {
				this.currentId = newCurrentId;
				this.currentTab = newCurrentTab;
				this.setSliderCss();
			}
		}
		
		setSliderCss() {
			let width = 0;
			let left = 0;
			if(this.currentTab) {
				width = this.currentTab.css('width');
				left = this.currentTab.offset().left;
			}
			$('.et-hero-tab-slider').css('width', width);
			$('.et-hero-tab-slider').css('left', left);
		}
		
	}

	new StickyNavigation();
  
  </script>
  
  <script type="text/javascript">
  var str = "BIT BOARD GAME";
  var c = 0;

  setInterval(function(){
        if(c < 20)
           $('#typing').append(str[c]);
        c++;
  }, 78);
  
  </script>

</body>
</html>