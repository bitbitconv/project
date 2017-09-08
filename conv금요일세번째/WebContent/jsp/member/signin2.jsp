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

	<div class="w3-third">
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