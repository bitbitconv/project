<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인하세요!</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<body>


<header class="w3-container w3-theme w3-padding" id="myHeader">
  
  <div class="w3-center">
  <h1 class="w3-xxxlarge w3-animate-bottom">로그인</h1>
  </div>
  
</header>
	<form method="post" action="/conv/member/login" method="post">
	<div align="center"  class="w3-center">
	<br>
	<p>${error}</p>
	<p>${logined}</p>
	<br>
	아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input  type="text" name="id">
	<br>
	비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="password" name="pass"><br>
	<br>
	<button class="w3-button w3-theme" type="submit">로그인</button>
  </div>
	</form>
</body>
</html>