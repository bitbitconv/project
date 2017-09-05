<%@page import="java.util.Date"%>
<%@page import="com.conv.world.domain.World"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	World post = (World)request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
<title>bitbit콘비니</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left w3-center" style="display:none" id="mySidebar">
  <h1 class="w3-xxxlarge w3-text-theme">펴니점 메뉴</h1>
  <button class="w3-bar-item w3-button" onclick="w3_close()">숨기기 <i class="fa fa-remove"></i></button>
  <a href="#" class="w3-bar-item w3-button">혼밥 게시판!</a>
  <a href="#" class="w3-bar-item w3-button">세계의 편의점</a>
  <a href="review_board.html" class="w3-bar-item w3-button">리뷰 게시판</a>
  <a href="#" class="w3-bar-item w3-button">나눔 게시판</a>
  <a href="#" class="w3-bar-item w3-button">PB 상품</a>
  <a href="#" class="w3-bar-item w3-button">이달의 행사</a>
</nav>

<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i> 
  
  <div class="w3-center">
  
  <h4>펴니점 꿀정보 사이트</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom"><a href="/conv/jsp/review/main.jsp">펴니펴니펴니점</a></h1>
    <div class="w3-padding-32">
      <button class="w3-btn w3-xlarge w3-white w3-hover-orange" onclick="document.getElementById('id01').style.display='block'" style="font-weight:900;">밥 뭐먹지</button>
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
        <h5>메뉴 골라줄게<i class="fa fa-smile-o"></i></h5>
      </header>
      <div class="w3-padding">
        <p>혼밥 레시피! 게시판에 있는</p>
        <p>나만의 조합찾기를 해보삼!</p>
      </div>
      <footer class="w3-container w3-theme-l1">
        <p><a class="w3-btn" href="/w3css/default.asp">나만의 조합찾기 바로 가기</a></p>
      </footer>
    </div>
</div>

<div class="w3-container">
  <hr>
  <div class="w3-center">
    <h2>리뷰 게시판</h2>
    <p w3-class="w3-large">각종 리뷰들이 한곳에!</p>
  </div>
<p>
<%-- <div class="w3-half"> --%>
<div class="w3-card white">

  <div class="w3-container w3-theme">
    <h3><%= post.getNo() %></h3>
  </div>
  <ul class="w3-ul w3-border-top">
  
    <li>
      <p><%= post.getTitle() %></p>
    </li>
    <li>
    
    	<%= post.getId() %>
    </li>
    <li>
      <p><%= post.getContent() %></p>
    </li>
    <li>
      <p><%= post.getPhoto() %></p>
    </li>
  </ul>
		<br>
		</div>
			<form action="/conv/com/conv/world/controller/a"">
				<button name ="no"  value="${post.no}" class="w3-btn w3-xlarge w3-blue w3-hover-white"
					style="font-weight: 900;">글수정</button>
			</form>
			<form action="/conv/com/conv/world/controller/worlddelcontroller">
				<button class="w3-btn w3-xlarge w3-blue w3-hover-white" style="font-weight: 900;" name="no" value="${post.no}">글삭제</button>
			</form>
</div>
	
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
