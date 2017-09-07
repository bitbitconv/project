<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--페이스북 로그인 api --%>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1943226235933346',
      xfbml      : true,
      version    : 'v2.10'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
  <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=409465049448770";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

	<!-- Side Navigation -->
	<nav
		class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left w3-center"
		style="display: none" id="mySidebar">
		<h1 class="w3-xxxlarge w3-text-theme">메뉴</h1>
		<button class="w3-bar-item w3-button" onclick="w3_close()">
			숨기기 <i class="fa fa-remove"></i>
		</button>
		<a href="/conv/com/conv/recipe/controller/recipelistcontroller"
			class="w3-bar-item w3-button">혼밥 게시판!</a> <a
			href="/conv/com/conv/world/controller/worldlistcontroller"
			class="w3-bar-item w3-button">세계의 편의점</a>
		<form action="/conv/review/list">
			<a href="/conv/review/list" class="w3-bar-item w3-button">리뷰 게시판</a>
		</form>
		<a href="/conv/free/list" class="w3-bar-item w3-button">나눔 게시판</a>
		<a	href="#" class="w3-bar-item w3-button">PB 상품</a>
		<a href="/conv/sale/list" 	class="w3-bar-item w3-button">이달의 행사</a>
	</nav>

	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">
		<i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
		<span style="float: left"> 
		<form action ="/conv/main/search">
		<input type="text" name="keyword">
		<button type="submit">searchtest</button>
		</form>
			<a class="w3-button w3-theme" href="/conv/main/search"> 검색</a>
		</span>
		<c:choose>
			<c:when test="${empty user}">
				<span style="float: right"> ${welcome} <a
					class="w3-button w3-theme" href="/conv/jsp/member/login.jsp">로그인</a>
					<%--페이스북 로그인 버튼 --%>
				<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
				</span>
				<c:if test="${empty welcome}">
					<span style="float: right"> <a class="w3-button w3-theme"
						href="/conv/jsp/member/signin.jsp">회원가입</a>
					</span>
				</c:if>
			</c:when>
			<c:otherwise>
				<span style="float: right"> <a class="w3-button w3-theme"
					href="/conv/member/logout"> 로그아웃</a>
				</span>
				<span style="float: right"> ${user}님 환영합니다! </span>
				<%--
				접속시간 : ${user.accessTime}
				 --%>
			</c:otherwise>
		</c:choose>

		<div class="w3-center">
			<h4>펴니점 꿀정보 사이트</h4>
			<h1 class="w3-xxxlarge w3-animate-bottom">
				<a href="/conv/jsp/main/main.jsp">펴니펴니펴니점</a>
			</h1>
			<div class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id01').style.display='block'"
					style="font-weight: 900;">밥 뭐먹지</button>
			</div>
		</div>
	</header>

	<!-- Modal -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">X</span>
				<h4>뭐먹을지 고민됨?!!</h4>
				<h5>
					메뉴 골라줄게<i class="fa fa-smile-o"></i>
				</h5>
			</header>
			<div class="w3-padding">
				<p>혼밥 레시피! 게시판에 있는</p>
				<p>나만의 조합찾기를 해보삼!</p>
			</div>
			<footer class="w3-container w3-theme-l1">
				<p>
					<a class="w3-btn" href="/w3css/default.asp">나만의 조합찾기 바로 가기</a>
				</p>
			</footer>
		</div>
	</div>