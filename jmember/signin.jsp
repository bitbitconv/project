<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import= "com.conv.member.domain.Member" %>
<% Member m = new Member(); %>
	<h1>회원가입</h1>
	<br>
	<form method="post" action="/conv/member/signin">
	모두 빠짐없이 입력해 주세요.
	<br>
	<h4>개인정보 : </h4>
	아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="id">
	<button type="button" value="idDubcheck" onclick="<% m.set %>">아이디 중복체크</button><br>
	  
	  <br>
	 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="pass"><br>
	비밀번호 힌트
	<input type="text" name="passhint"><br>
	이메일 주소
	<input type="text" name="emailAddr"><br>
	<br>
	<button type="submit">회원가입</button>
	
	
	
	</form>
</body>
</html>