<%@page import="com.conv.pb.domain.PB"%>
<%@page import="com.conv.world.domain.World"%>
<%@page import="com.conv.sale.domain.Sale"%>
<%@page import="com.conv.free.domain.Free"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.conv.review.domain.Review"%>
<%@page import="com.conv.main.dao.MainDAO"%>
<%@page import="com.conv.util.ConnectionPool"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.conv.recipe.domain.Recipe"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MainDAO dao = new MainDAO();
	pageContext.setAttribute("dao", dao);
%>
<!DOCTYPE html>
<html>
<head>
<title>bitbit콘비니</title>
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







		<div class="w3-center"><h6>&nbsp;</h6>
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



<div class="w3-row-padding">

<div class="w3-half">
<div class="w3-card white">
  <div class="w3-container w3-indigo">
    <h3>Theme Indigo</h3>
  </div>
  <div class="w3-container">
  <h3 class="w3-text-indigo">Movies 2014</h3>
  </div>
  <ul class="w3-ul w3-border-top">
    <li>
      <h3>Frozen</h3>
      <p>The response to the animations was ridiculous</p>
    </li>
    <li>
      <h3>The Fault in Our Stars</h3>
      <p>Touching, gripping and genuinely well made</p>
    </li>
    <li>
      <h3>The Avengers</h3>
      <p>A huge success for Marvel and Disney</p>
    </li>
  </ul>
  <div class="w3-container w3-indigo w3-large"><span class="w3-right">Next</span></div>
</div>
</div>

<div class="w3-half">
<div class="w3-card white">
  <div class="w3-container w3-theme">
    <h3>Theme</h3>
  </div>
  <div class="w3-container">
  <h3 class="w3-text-theme">Movies 2014</h3>
  </div>
  <ul class="w3-ul w3-border-top">
    <li>
      <h3>Frozen</h3>
      <p>The response to the animations was ridiculous</p>
    </li>
    <li>
      <h3>The Fault in Our Stars</h3>
      <p>Touching, gripping and genuinely well made</p>
    </li>
    <li>
      <h3>The Avengers</h3>
      <p>A huge success for Marvel and Disney</p>
    </li>
  </ul>
  <div class="w3-container w3-theme w3-large"><span class="w3-right">Next</span></div>
</div>
</div>
</div>

<div class="w3-container w3-center">
  <hr>
  <h3>Paper-like Cards with Shadows</h3>
</div>

<div class="w3-row-padding"> 

<div class="w3-third">
<div class="w3-card-2">
  <img src="/w3images/car.jpg" alt="Car" style="width:100%">
  <div class="w3-container">
  <p>w3-card-2</p>
  </div>
</div>
</div>

<div class="w3-third">
<div class="w3-card-4">
  <img src="/w3images/car.jpg" alt="Car" style="width:100%">
  <div class="w3-container">
  <p>w3-card-4</p>
  </div>
</div>
</div>

<div class="w3-third">
<div class="w3-card-4">
  <img src="/w3images/car.jpg" alt="Car" style="width:100%">
  <div class="w3-container">
  <p>w3-card-4</p>
  </div>
</div>
</div>
</div>

<div class="w3-container">
  <hr>
  <div class="w3-center">
    <h2>Tables</h2>
    <p w3-class="w3-large">Don't worry. W3.CSS takes care of your tables.</p>
  </div>
<div class="w3-responsive w3-card-4">
<table class="w3-table w3-striped w3-bordered">
<thead>
<tr class="w3-theme">
  <th>First Name</th>
  <th>Last Name</th>
  <th>Points</th>
</tr>
</thead>
<tbody>
<tr>
  <td>Jill</td>
  <td>Smith</td>
  <td>50</td>
</tr>
<tr class="w3-white">
  <td>Eve</td>
  <td>Jackson</td>
  <td>94</td>
</tr>
<tr>
  <td>Adam</td>
  <td>Johnson</td>
  <td>67</td>
</tr>
</tbody>
</table>
</div>

<hr>
<h2 class="w3-center">Forms and Lists</h2>
</div>

<div class="w3-row-padding">

<div class="w3-half">
<form class="w3-container w3-card-4">
  <h2>Input Form</h2>
  <div class="w3-section">      
    <input class="w3-input" type="text" required>
    <label>Name</label>
  </div>
  <div class="w3-section">      
    <input class="w3-input" type="text" required>
    <label>Email</label>
  </div>
  <div class="w3-section">      
    <input class="w3-input" type="text" required>
    <label>Subject</label>
  </div>

  <div class="w3-row">
  <div class="w3-half">
    <input id="milk" class="w3-check" type="checkbox" checked="checked">
    <label>Milk</label>
    <br>
    <input id="sugar" class="w3-check" type="checkbox">
    <label>Sugar</label>
    <br>
    <input id="lemon" class="w3-check" type="checkbox" disabled>
    <label>Lemon (Disabled)</label>
    <br><br>
  </div>

  <div class="w3-half">
    <input id="male" class="w3-radio" type="radio" name="gender" value="male" checked>
    <label>Male</label>
    <br>
    <input id="female" class="w3-radio" type="radio" name="gender" value="female">
    <label>Female</label>
    <br>
    <input id="unknown" class="w3-radio" type="radio" name="gender" value="" disabled>
    <label> Don't know (Disabled)</label>
  </div>
  </div>
</form>
</div>
<div class="w3-half">
<div class="w3-card-4 w3-container">
<h2>Lists</h2>
<ul class="w3-ul w3-margin-bottom">
  <li>Jill</li>
  <li>Eve</li>
  <li>Adam</li>
</ul>
<br>
<ul class="w3-ul w3-border w3-hoverable">
  <li class="w3-theme">Jill</li>
  <li>Eve</li>
  <li>Adam</li>
  <li>Steve</li>
</ul>
<br>
</div>
</div>
</div>
<hr>

<h2 class="w3-center">Progress Bars</h2>
<div class="w3-container">

<div class="w3-light-gray">
  <div id="myBar" class="w3-center w3-padding w3-theme" style="width:5%">5%</div>
</div><br>
<button class="w3-btn w3-theme" onclick="move()">Click Me</button> 
</div>
<hr>

<h2 class="w3-center">Slideshows</h2>
<div class="w3-content" style="max-width:800px;position:relative">

<img class="mySlides w3-animate-opacity" src="/w3images/fjords.jpg" style="width:100%">
<img class="mySlides w3-animate-opacity" src="/w3images/lights.jpg" style="width:100%">
<img class="mySlides w3-animate-opacity" src="/w3images/mountains.jpg" style="width:100%">
<img class="mySlides w3-animate-opacity" src="/w3images/forest.jpg" style="width:100%">

<a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;left:0;" onclick="plusDivs(-1)">❮</a>
<a class="w3-button w3-hover-dark-grey" style="position:absolute;top:45%;right:0;" onclick="plusDivs(+1)">❯</a>
</div>

<div class="w3-container">
<hr>
<h2 class="w3-center">Navigation</h2>

<div class="w3-bar w3-theme">
  <a href="#" class="w3-bar-item w3-button w3-padding-16">Home</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-16">Link 1</a>
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-padding-16">
      Dropdown <i class="fa fa-caret-down"></i>
    </button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="javascript:void(0)" class="w3-bar-item w3-button">Link 1</a>
      <a href="javascript:void(0)" class="w3-bar-item w3-button">Link 2</a>
      <a href="javascript:void(0)" class="w3-bar-item w3-button">Link 3</a>
    </div>
  </div>
</div>
  
<hr>
<h2 class="w3-center">Accordions</h2>
<button onclick="myAccFunc('Demo1')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">Open Section 1</button>
<div id="Demo1" class="w3-hide">
  <div class="w3-container">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
<button onclick="myAccFunc('Demo2')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">Open Section 2</button>
<div id="Demo2" class="w3-hide">
  <a href="#" class="w3-button w3-block w3-left-align">Link 1</a>
  <a href="#" class="w3-button w3-block w3-left-align">Link 2</a>
  <a href="#" class="w3-button w3-block w3-left-align">Link 3</a>
</div>
<button onclick="myAccFunc('Demo3')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">Open Section 3</button>
<div id="Demo3" class="w3-hide w3-black">
  <div class="w3-container">
    <p>Accordion with Images:</p>
    <img src="/w3images/fjords.jpg" style="width:30%;" class="w3-animate-zoom">
    <p>Trolltunga, Norway</p>
  </div>
</div>

<hr>
<h2 class="w3-center">Tabs</h2>
<div class="w3-border">
<div class="w3-bar w3-theme">
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openCity(event,'London')">London</button>
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openCity(event,'Paris')">Paris</button>
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openCity(event,'Tokyo')">Tokyo</button>
</div>

<div id="London" class="w3-container city w3-animate-opacity">
  <h2>London</h2>
  <p>London is the capital city of England.</p>
  <p>It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
</div>

<div id="Paris" class="w3-container city w3-animate-opacity">
  <h2>Paris</h2>
  <p>Paris is the capital of France.</p> 
  <p>The Paris area is one of the largest population centers in Europe, with more than 12 million inhabitants.</p>
</div>

<div id="Tokyo" class="w3-container city w3-animate-opacity">
  <h2>Tokyo</h2>
  <p>Tokyo is the capital of Japan.</p>
  <p>It is the center of the Greater Tokyo Area, and the most populous metropolitan area in the world.</p>
</div>
</div>

<hr>
<h2 class="w3-center">Buttons</h2>
<div class="w3-center">
  <br>
  <a class="w3-button w3-theme">Button</a>
  <a class="w3-button w3-theme">Button</a>
  <a class="w3-button w3-theme-d3 w3-disabled">Button</a>
  <br><br>
  <a class="w3-button w3-circle w3-large w3-black"><i class="fa fa-plus"></i></a>
  <a class="w3-button w3-circle w3-large w3-theme"><i class="fa fa-plus"></i></a>  
  <a class="w3-button w3-circle w3-large w3-card-4"><i class="fa fa-plus"></i></a>
</div>
<br>
<div class="w3-center">
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-theme">Dropdown <i class="fa fa-caret-down"></i></button>
    <div class="w3-dropdown-content w3-bar-block w3-border">
      <a href="#" class="w3-bar-item w3-button">Link 1</a>
      <a href="#" class="w3-bar-item w3-button">Link 2</a>
      <a href="#" class="w3-bar-item w3-button">Link 3</a>
    </div>
  </div>
</div>

</div>

<hr>
<div class="w3-center">
  <h2>Pagination</h2>
  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">«</a>
      <a href="#" class="w3-bar-item w3-button w3-theme w3-hover-theme">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">5</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">»</a>
    </div>
  </div>
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-dark w3-padding-16">
  <h3>Footer</h3>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
  <div style="position:relative;bottom:55px;" class="w3-tooltip w3-right">
    <span class="w3-text w3-theme-light w3-padding">Go To Top</span>    
    <a class="w3-text-white" href="#myHeader"><span class="w3-xlarge">
    <i class="fa fa-chevron-circle-up"></i></span></a>
  </div>
  <p>Remember to check out our  <a href="w3css_references.asp" class="w3-btn w3-theme-light" target="_blank">W3.CSS Reference</a></p>
</footer>

<!-- Script for Sidebar, Tabs, Accordions, Progress bars and slideshows -->
<script>
// Side navigation
function w3_open() {
    var x = document.getElementById("mySidebar");
    x.style.width = "100%";
    x.style.fontSize = "40px";
    x.style.paddingTop = "10%";
    x.style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}

// Tabs
function openCity(evt, cityName) {
  var i;
  var x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  var activebtn = document.getElementsByClassName("testbtn");
  for (i = 0; i < x.length; i++) {
      activebtn[i].className = activebtn[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-dark-grey";
}

var mybtn = document.getElementsByClassName("testbtn")[0];
mybtn.click();

// Accordions
function myAccFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

// Slideshows
var slideIndex = 1;

function plusDivs(n) {
slideIndex = slideIndex + n;
showDivs(slideIndex);
}

function showDivs(n) {
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}

showDivs(1);

// Progress Bars
function move() {
  var elem = document.getElementById("myBar");   
  var width = 5;
  var id = setInterval(frame, 10);
  function frame() {
    if (width == 100) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}
</script>

</body>
</html>