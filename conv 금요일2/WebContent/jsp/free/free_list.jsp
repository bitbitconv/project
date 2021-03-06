<%@page import="com.conv.free.domain.Free"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	List<Free> list = (List)request.getAttribute("list");
	List<Free> all = (List)request.getAttribute("all");
	int[] recnt = (int[])request.getAttribute("reCnt");
%> 
<!DOCTYPE html>
<html>
<title>BIT CONVINI</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>

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

<div class="w3-container">
  <hr>
  <div class="w3-center">
    <h2>같이 먹어요</h2>
    <p class="w3-large">혼자 먹기 힘들다면 나눠봅시다</p>
  </div>
  <a href = "/conv/jsp/free/free_insert.jsp">
<button class="w3-btn w3-xlarge w3-blue w3-hover-white" style="font-weight:900;">글쓰기</button></a>
<p>
<div class="w3-responsive w3-card-4">
<table class="w3-table w3-striped w3-bordered">
<thead>
<tr class="w3-theme">
  	<th width=7% style="word-break:break-all">NO</th>
    <th width=10% style="word-break:break-all">상태</th>
    <th width=35% style="word-break:break-all">제목</th>
    <th width=10% style="word-break:break-all" class="w3-center">작성자</th>
    <th width=10% style="word-break:break-all" class="w3-center">등록일</th>
    <th width=7% style="word-break:break-all" class="w3-center">조회수</th>
</tr>
</thead>
<tbody>
<form action="/conv/free/post">
	<% int cnt = 0; %>
<c:forEach var="f" items="${ list }">
    <tr>
      <td width=7% style="word-break:break-all"><c:out value="${ f.no }" /></td>
      <td width=10% style="word-break:break-all"><c:out value="${ f.state }" /></td>
      <td width=35% style="word-break:break-all">
      		<button class="w3-bar-item w3-button" name="no" value="<c:out value="${ f.no }" />">
      	    	<c:out value="${ f.title }" />(<%= recnt[cnt] %>)
      		</button></td>
      <td width=10% style="word-break:break-all" class="w3-center"><c:out value="${ f.writer }" /></td>
      <td width=10% style="word-break:break-all" class="w3-center"><fmt:formatDate value="${ f.regDate }" pattern="yyyy-MM-dd" /></td>
      <td width=7% style="word-break:break-all" class="w3-center"><c:out value="${ f.hits }" /></td>
    </tr>
    <% cnt++; %>
     </c:forEach>
</form>
</tbody>
</table>
</div>

  <!-- Pagination -->
  <form action="/conv/free/list">
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">«</a>
  <c:forEach var="i" begin="1" end="${ all.size()/9 + 1}" step="1">
      <button class="w3-bar-item w3-button w3-hover-theme" name="no" value=<c:out value="${ i }" />>
      	<c:out value="${ i }" /></button>
  </c:forEach>
      <a href="#" class="w3-bar-item w3-button w3-hover-theme">»</a>
    </div>
  </div>
  </form>
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
