<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String id = (String)request.getAttribute("id");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원가입하기</title>

    <script type="text/javascript">
        // 취소 버튼 클릭시 메인으로 이동
        function goFirstForm() {
            location.href="/conv/jsp/main/main.jsp";
        }    
        
   </script>
    
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<body>
	<header class="w3-container w3-theme w3-padding" id="myHeader">

	<div class="w3-third">
		<h1 class="w3-xxxlarge w3-animate-bottom">회원가입</h1>
	</div>

	</header>

	<div class="w3-third">
		<form class="w3-container w3-card-4" method="post"
			name= "userInfo" action="/conv/jsp/member/signin" >
			<h2>아이디 중복체크</h2>
			<div class="w3-section" align="center" >
			${idDup}
			</div>
			<br>

			<div class="w3-section">
				<input class="w3-input" type="text" name="id" maxlength="50" value="${userId}" required> <label>아이디</label>
			</div>
			<button class="w3-button w3-theme" type="submit">체크하기!</button>
			</form>
			</div>
</body>
</html>