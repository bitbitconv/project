<%@page import="com.conv.free.domain.FreeReply"%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Free post = (Free)request.getAttribute("post");
	List<FreeReply> re = (List)request.getAttribute("re");
%>
<!DOCTYPE html>
<html>
<head>
<title>BIT CONVINI</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/main/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/main/main2.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
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
	
<%-- 	
	<div id="id02" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="w3-button w3-display-topright">X</span>
				<h4>댓글과 게시글은 일심동체..</h4>
			</header>
			<div class="w3-padding">
				<p>어쩔 수가 없어요..</p>
			</div>
			<footer class="w3-container w3-theme-l1">
				<p>
				<span onclick="document.getElementById('id02').style.display='none'">
					<a class="w3-btn">NotFound</a></span>
				</p>
			</footer>
		</div>
	</div>
--%>

<div class="w3-container">
  <hr>
  <div class="w3-center">
    <h2>같이 먹어요</h2>
    <p class="w3-large">혼자 먹기 힘들다면 나눠봅시다</p>
  </div>
<p>
<%-- <div class="w3-half"> --%>
<div class="w3-card white">


  <div class="w3-container w3-theme w3-card-2">
    <h3><c:out value="${ post.title }" /></h3>
  </div>
  <div class="w3-container">
  <h3 class="w3-text-theme">${ post.writer }</h3>
  </div>
  <ul class="w3-ul w3-border">
    <li>
      <p><fmt:formatDate value="${ post.regDate }" pattern="yyyy-MM-dd KK:mm:ss" /></p>
    </li>
    <li>
      <p><c:out value="${ post.hits }" /></p>
    </li>
    <li>
      <p><img src="${pageContext.request.contextPath}/free_upload${ post.image }"></p>
      <p>${ post.content } </p>
  </ul>
  
<div class="w3-responsive w3-card-1">
	<form action="/conv/free/delete">
	<% if (re.size() == 0 ) { String msg = "possible"; %>
		<input type="hidden" value="<%= msg %>" required />
		<button class="w3-btn w3-large w3-blue w3-right"
	   			style="font-weight:900;" name="no" value="${ post.no }"
	   			onclick="document.getElementById('id02').style.display='block'">삭제</button>
	<% } %>
	</form>
	<form action="/conv/free/updateno">
		<button class="w3-btn w3-large w3-blue w3-right"
	   			style="font-weight:900;" name="no" value="${ post.no }">수정</button>
	</form>
	<a href="/conv/free/list">
		<button class="w3-btn w3-large w3-blue w3-right"
				style="font-weight:900;">목록으로</button></a>
</div>
<p>

<div class="w3-responsive w3-card-2">
  <div class="w3-container w3-theme">
    <h3>댓글(${ re.size() })</h3>
  </div>
	
</div>
	
<%-- 	<div class="w3-container"> --%>
	<div class="w3-responsive w3-card-2">
	<table class="w3-table w3-striped w3-bordered">
	<tbody>
	 <c:choose>
		<c:when test="${ !empty re }">
		 	<c:forEach var ="r" items="${ re }" > 	
		 	<tr>
		 		<td width=20% style="word-break:break-all" >${ r.writer }</td>
		 		<td width=40% style="word-break:break-all" >${ r.content }</td>
		 		<td width=20% style="word-break:break-all" >
		 			<fmt:formatDate value="${ r.regDate }" pattern="yyyy-MM-dd KK:mm:ss" /></td>
      			
		 		<td width=6% style="word-break:break-all" ><form action="/conv/free/replydelete">
		 			<input type="hidden" name="no" value="${ post.no }" />
		 			<button class="w3-button w3-blue w3-left"
		 					name="rno" value="${ r.no }">삭제</button>
		 			</form></td>
		 	</tr>
		 	</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td>
				<div class="w3-container w3-theme">
					이 글의 첫번째 댓글을 달아주세요!
  				</div>
				</td>
			</tr>		
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
	</div>
	
<%-- 댓글작성창 --%>
<div class="w3-responsive w3-card-2">
	<form action="/conv/free/replyinsert"><br>
		댓글<input class="w3-input w3-hover-light-grey" name="content">
		<button class="w3-button w3-blue" style="width:20%"
				name="no" value="${ post.no }">댓글 등록</button>
	</form>	
	 
</div>
</div>
</div>

<!-- Footer -->
	<footer class="w3-container w3-theme-dark w3-padding-16">
		<h3>BBIK</h3>
		<p>
			Made by <a href="/conv/jsp/common/us.jsp"
				class="w3-btn w3-theme-light" target="_blank">삑을 만든 사람들</a>
		</p>
		<div style="position: relative; bottom: 55px;"
			class="w3-tooltip w3-right">
			<span class="w3-text w3-theme-light w3-padding">위로 가기</span>  <a
				class="w3-text-white" href="#myHeader"><span class="w3-xlarge">
					<i class="fa fa-chevron-circle-up"></i>
			</span></a>
		</div>
		<p>문의 : sangjoons@bbik.com</p>
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
