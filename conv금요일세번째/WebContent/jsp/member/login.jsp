<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인하세요!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/main/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
</head>
<body>


	<header class="w3-container w3-theme w3-padding" id="myHeader">

	<div class="w3-center">
		<h1 class="w3-xxxlarge w3-animate-bottom">로그인</h1>
	</div>

	</header>

	<div class="w3-center">
		<form class="w3-container w3-card-4" method="post"
			action="/conv/member/login">
			<h2>회원가입</h2>
			<div class="w3-section" align="center" >
				<p>${error}</p>
				<p>${logined}</p>
			</div>
			<br>

			<div class="w3-section">
				<input class="w3-input" type="text" name="id" required> <label>아이디</label>
			</div>
			<div class="w3-section">
				<input class="w3-input" type="password" name="pass" required> <label>비밀번호</label>
			</div>
			<button class="w3-button w3-theme" type="submit">로그인</button>
			</form>
			</div>

</body>
</html>