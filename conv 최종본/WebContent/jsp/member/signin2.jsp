<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%
	String id = (String)request.getAttribute("id");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>삑</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/main/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/main/main2.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Libre+Barcode+39+Text" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
</head>
<body>

	<%--페이스북 로그인 api --%>

	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1943226235933346',
				xfbml : true,
				version : 'v2.10'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=409465049448770";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

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
		<a href="/conv/pb/list" class="w3-bar-item w3-button">PB 상품</a>
			 <a
			href="/conv/sale/list" class="w3-bar-item w3-button">이달의 행사</a>
	</nav>

	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">
		<i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
		<span style="float: right"> <c:choose>
				<c:when test="${empty user}">
				 ${welcome} <a class="w3-button w3-theme"
						href="/conv/jsp/member/login.jsp">로그인</a>

					<c:if test="${empty welcome}">
						<a class="w3-button w3-theme" href="/conv/jsp/member/signin.jsp">회원가입</a>
					</c:if>
					<br>
					<%--페이스북 로그인 버튼 --%>
					<div class="fb-login-button" data-max-rows="1" data-size="large"
						data-button-type="continue_with" data-show-faces="false"
						data-auto-logout-link="false" data-use-continue-as="false"></div>

				</c:when>
				<c:otherwise>
					<a class="w3-button w3-theme" href="/conv/member/logout"> 로그아웃</a>
				
				 ${user}님 환영합니다! 
				<%--
				접속시간 : ${user.accessTime}
				 --%>
				</c:otherwise>
			</c:choose>
		</span>







		<div class="w3-center"><h6>&nbsp;</h6><h6>&nbsp;</h6>
			<h4 style="text-align: center">펴니점 꿀정보 사이트</h4>
			<h1 class="w3-xxxlarge w3-animate-bottom">
				<a href="/conv/jsp/main/main.jsp" style="font-family: 'Libre Barcode 39 Text', cursive; font-size:250%; text-decoration: none; ">   BBIK   </a>
			</h1>
			<div class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id01').style.display='block'"
					style="font-weight: 900;">밥 뭐먹지</button>
			</div>
		</div>
		<span style="float: right">
			<form action="/conv/main/search">
				<input type="text" name="keyword">
				<button class="w3-button w3-theme" type="submit">검색</button>
			</form>
		</span>

	</header>


	<!-- Modal -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">X</span>
				<h4>밥 메뉴가 고민된다면??</h4>
				<h5>
					여러 사람들의 편의점 레시피가 모인 곳!<i class="fa fa-smile-o"></i>
				</h5>
			</header>
			<div class="w3-padding">
				<p>혼밥 레시피! 게시판에서</p>
				<p>다양한 음식 조합을 만나보세요!</p>
			</div>
			<footer class="w3-container w3-theme-l1">
				<p>
					<a class="w3-btn" href="/conv/com/conv/recipe/controller/recipelistcontroller">혼밥 레시피! 바로 가기</a>
				</p>
			</footer>
		</div>
	</div>
	<div class="w3-section"></div>
	</header>
	<%--
    <script type="text/javascript">
        $("#join").click(function() {
        	var pass= $("#pass");
        	var passCheck= $("#passCheck");
        	
            if(pass!=passCheck){
            	alert("입력된 비밀번호가 서로 다릅니다.");
            }
        }    )
        
   </script>
	 --%>
<div class="w3-third"><div class="w3-section"></div></div>
	<div class="w3-third w3-center">
		<form class="w3-container w3-card-4" method="post"
			 name= "userInfo" action="/conv/jsp/member/signin2" >
			<h2>나머지 정보입력</h2>
			<div class="w3-section" align="center" >
			</div>
			<br>

			<div class="w3-section">
				<input class="w3-input" disabled="disabled" type="text" name="id" maxlength="50" value="${userId}" required> <label>아이디</label>
			</div>
			<div class="w3-section">
				<input class="w3-input" type="password" name="pass" id="pass" maxlength="50" required> <label>비밀번호</label>
			</div>
			<div class="w3-section">
				<input class="w3-input" type="password" name="passCheck" id="passCheck" maxlength="50" required> <label>비밀번호 재입력</label>
			</div>
			<div class="w3-section">
				<input class="w3-input" type="text" name="passhint" maxlength="50" required> <label>비밀번호 힌트</label>
			</div>
			<div class="w3-section">
				<input class="w3-input" type="text" name="email" maxlength="50" required> <label>이메일 주소</label>
			</div>
			<button class="w3-button w3-theme" id="join" type="submit">가입하기!</button>
			</form>
			</div>

</body>
</html>