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


<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기까지 복붙~~~ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->






	<!-- 메인페이지 -->

	<div class="w3-row-padding w3-center w3-margin-top"
		style="background: white;">
		<div class="w3-half">
			<div class="w3-card-2 w3-container" style="min-height: 460px">

				<h3>혼밥 레시피!</h3>
				<br>
				<%
					List<Recipe> recipeList = dao.mainRecipe();
					for (Recipe recipe : recipeList) {
						int no = recipe.getNo();
						String title = recipe.getTitle();
						String photo = recipe.getPhoto();
				%>
				<figure class="snip1132">
					<img src="${pageContext.request.contextPath}/upload<%=photo%>"
						height="200px" width="310px"/>
					<figcaption>
						<div class="heading">
							<h3>혼밥 <span>레시피</span></h3>
						</div>
						<div class="caption">
							<p><%=title%></p>
						</div>
					</figcaption>
					<a href="#"></a>
				</figure>
				<%
					}
				%>
			</div>
		</div>


		<div class="w3-half">
			<div class="w3-card-2 w3-container" style="min-height: 460px">
				<h3>세계의 편의점</h3>
				<br>
				<div class="w3-responsive w3-card-4">
					<table class="w3-table w3-striped w3-bordered">

						<%
							List<World> worldList = dao.mainWorld();
							for (World world : worldList) {
								String title = world.getTitle();
								String photo = world.getPhoto();
						%>
			<figure class="snip1132">
					<img src="${pageContext.request.contextPath}/<%=photo%> " height="200px"
							width="200px" />
					<figcaption>
						<div class="heading">
							<h3>세계의<span>편의점</span></h3>
						</div>
						<div class="caption">
							<p><%=title%></p>
						</div>
					</figcaption>
					<a href="#"></a>
				</figure>
						<%
							}
						%>

					</table>
				</div>
			</div>
		</div>



		<div class="w3-half">
			<div class="w3-card-2 w3-container" style="min-height: 460px">
				<h3>
					<a href="/conv/review/list">리뷰 게시판</a>
				</h3>
				<br>

				<div class="w3-responsive w3-card-4">
					<table class="w3-table w3-striped w3-bordered">
						<thead>
							<tr class="w3-theme">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Review> list = dao.mainReview();
								for (Review review : list) {
									int no = review.getNo();
									String title = review.getTitle();
									String writer = review.getWriter();
									int hit = review.getHit();
									Date regDate = review.getRegDate();
							%>

							<tr class="w3-white">
								<td><button class="w3-bar-item w3-button" name="no"
										value="<%=no%>"><%=no%></button></td>
								<td><%=title%></td>
								<td><%=writer%></td>
								<td><%=hit%></td>
								<td><%=regDate%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>




		<div class="w3-half">
			<div class="w3-card-2 w3-container" style="min-height: 460px">
				<h3>
					<a href="/conv/free/list">나눔 게시판</a>
				</h3>
				<br>

				<div class="w3-responsive w3-card-4">
					<table class="w3-table w3-striped w3-bordered">
						<thead>
							<tr class="w3-theme">
								<th>번호</th>
								<th>상태</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<%
								List<Free> freeList = dao.mainFree();
								for (Free free : freeList) {
									int no = free.getNo();
									String state = free.getState();
									String title = free.getTitle();
									String writer = free.getWriter();
									Date regDate = free.getRegDate();
							%>

							<tr class="w3-white">
								<td><%=no%></td>
								<td><%=state%></td>
								<td><button class="w3-bar-item w3-button" name="title"
										value="<%=title%>"><%=title%></button></td>
								<td><%=writer%></td>
								<td><%=regDate%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<div class="w3-half">
			<div class="w3-card-2 w3-container" style="min-height: 460px">
				<h3>PB 상품</h3>
				<br>
				<div class="w3-card-4">
					<%
						List<PB> PBList = dao.mainPB();
						for (PB pb : PBList) {
							String productname = pb.getProductName();
							String imageURL = pb.getImageURL();
							String price = pb.getPrice();
							String convname = pb.getConvName();
					%>
					<figure class="snip1273">
						<img src="<%=imageURL%>" height="200px" width="200px"
							alt="sample72" />
						<figcaption>
							<h3><%=productname%></h3>
							<p>
								[<%=convname%>] &nbsp;
								<%=price%></p>
						</figcaption>
						<a href="#"></a>
					</figure>
					<%
						}
					%>
				</div>
			</div>
		</div>


		<div class="w3-half">
			<div class="w3-card-2 w3-container">
				<h3>이달의 행사</h3>
				<br>
				<div class="w3-card-4">
					<%
						List<Sale> saleList = dao.mainSale();
						for (Sale sale : saleList) {
							String productname = sale.getProductName();
							String imageURL = sale.getImageURL();
							String price = sale.getPrice();
							String event = sale.getEvent();
					%>
					<figure class="snip1273">
						<img src="<%=imageURL%>" height="200px" width="200px"
							alt="sample72" />
						<figcaption>
							<h3><%=productname%></h3>
							<p>
								[<%=event%>] &nbsp;
								<%=price%></p>
						</figcaption>
						<a href="#"></a>
					</figure>
					<%
						}
					%>
				</div>
			</div>
		</div>

	</div>

	<div class="w3-container">
		<hr>
		</div>

	<!-- Footer -->
	<footer class="w3-container w3-theme-dark w3-padding-16">
		<h3>Footer</h3>
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
		<div style="position: relative; bottom: 55px;"
			class="w3-tooltip w3-right">
			<span class="w3-text w3-theme-light w3-padding">Go To Top</span>  <a
				class="w3-text-white" href="#myHeader"><span class="w3-xlarge">
					<i class="fa fa-chevron-circle-up"></i>
			</span></a>
		</div>
		<p>
			Remember to check out our  <a href="w3css_references.asp"
				class="w3-btn w3-theme-light" target="_blank">W3.CSS Reference</a>
		</p>
	</footer>

	<!-- Script for Sidebar, Tabs, Accordions, Progress bars and slideshows -->
	<script>
		// 이미지 호버 : pb, sale

		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});

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
				activebtn[i].className = activebtn[i].className.replace(
						" w3-dark-grey", "");
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
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			;
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
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
					elem.innerHTML = width * 1 + '%';
				}
			}
		}
	</script>

</body>
</html>
